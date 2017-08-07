create view individual_cashflow_total as
select application
     , individual
     , (sum( amount/period) filter (where period > 0       ))::monetary as total_income
     , (sum(-amount/period) filter (where period < 0       ))::monetary as total_expenses
     , (sum(-amount/period) filter (where period < 0 and k1))::monetary as k1_expenses
from individual_cashflow
  inner join cashflow_kind using (cashflow_kind)
group by application, individual;


create view borrower_cashflow as
select application
     , sum(total_income)   as total_income
     , sum(total_expenses) as total_expenses
     , sum(k1_expenses)    as k1_expenses
from individual_cashflow_total
  inner join individual_responsibility using (application, individual)
where responsibility = 'BORROWER'
group by application;


create function effective_term(
  repayment_kind code,
  term int4,
  interest numeric
) returns numeric
  language sql
  immutable
as $function$
  select case repayment_kind
    when 'ANNUITY' then -- simplified sum of geometric progression
      (1 - (12/(12+interest)) ^ term) * 12 / interest
    when 'DIFFERENTIATED' then
      12*term / (interest*term + 12)
    end
$function$;

comment on function effective_term(code,int4,numeric) is
  'Auxilary to calculate amount_k1 and amount_k2 in contract_ext view';


create view contract_ext as
with monthly_payment as (
  select *
       , k1*total_income - k1_expenses    as monthly_payment_k1
       , k2*total_income - total_expenses as monthly_payment_k2
       , effective_term(repayment_kind, term, interest) as effective_term
  from contract
    inner join product_scheme as product using (product, currency, client_category, term_range, amount_range)
    inner join borrower_cashflow using (application)
), amount_calc as (
  select *
       , (pledge_value*ltv)                 ::monetary as amount_ltv
       , (monthly_payment_k1*effective_term)::monetary as amount_k1
       , (monthly_payment_k2*effective_term)::monetary as amount_k2
  from monthly_payment
)
select *
     , least(amount_ltv, amount_k1, amount_k2, amount) as amount_offer
from amount_calc;
