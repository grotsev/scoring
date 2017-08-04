create function amount_by_repayment_kind(
  repayment_kind code,
  monthly_payment monetary,
  term int4,
  interest numeric
) returns monetary
  language sql
  stable
as $function$

  select case repayment_kind
    when 'ANNUITY' then -- simplified sum of geometric progression
      monthly_payment * (1 - (12/(12+interest)) ^ term) * 12 / interest
    when 'DIFFERENTIATED' then
      monthly_payment / (interest/12 + 1/term)
    end::monetary

$function$;

