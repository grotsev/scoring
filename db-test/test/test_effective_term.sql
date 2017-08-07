create function test_effective_term(
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
    (effective_term('ANNUITY', 180, 0.13) * (0.6*180000-3000))::monetary,
    8298806.56::monetary,
    $$effective_term('ANNUITY') k1 example$$
  );

  return next is(
    (effective_term('ANNUITY', 180, 0.13) * (0.8*180000-(3000-0)))::monetary,
    11144111.67::monetary,
    $$effective_term('ANNUITY') k2 example$$
  );

  return next is(
    (effective_term('DIFFERENTIATED', 180, 0.13) * (0.8*180000-(3000-0)))::monetary,
    8603389.83::monetary,
    $$effective_term('DIFFERENTIATED') k2 example$$
  );

end;
$function$;

