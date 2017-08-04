create function test_amount_by_repayment_kind(
) returns setof text
  language plpgsql
  set role from current
as $function$
declare
  empty_pkb pkb;
  poor_pkb pkb;
begin

  set local role scoring_attract;

  return next is(
    amount_by_repayment_kind('ANNUITY', 0.6*180000-3000, 180, 0.13),
    8298806.56::monetary,
    $$amount_by_repayment_kind('ANNUITY') k1 example$$
  );

  return next is(
    amount_by_repayment_kind('ANNUITY', 0.8*180000-(3000-0), 180, 0.13),
    11144111.67::monetary,
    $$amount_by_repayment_kind('ANNUITY') k2 example$$
  );

  return next is(
    amount_by_repayment_kind('DIFFERENTIATED', 0.8*180000-(3000-0), 180, 0.13),
    11144111.67::monetary,
    $$amount_by_repayment_kind('DIFFERENTIATED') k2 example$$
  );

end;
$function$;

