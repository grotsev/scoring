create function total_cashflow(
  the_application uuid,
  the_individual uuid,
  out total_income monetary,
  out total_expences monetary
)
  language sql
as $function$
  select (sum( amount/period) filter (where period > 0))::monetary as total_income
       , (sum(-amount/period) filter (where period < 0))::monetary as total_expenses
  from individual_cashflow
    inner join cashflow_kind using (cashflow_kind)
  where application = $1
    and individual = $2
$function$;
