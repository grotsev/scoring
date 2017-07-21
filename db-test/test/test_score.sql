create function test_score(
) returns setof text
  language plpgsql
  set role from current
as $function$
declare
  empty_pkb pkb;
  poor_pkb pkb;
begin

  set local role scoring_attraction;

  empty_pkb = row(
    null::uuid,
    null::integer,
    null::textfield,
    null::textfield,
    null::textfield,
    null::numeric,
    null::boolean,
    null::boolean,
    null::numeric,
    null::boolean,
    null::boolean,
    null::integer,
    null::numeric
  )::pkb;

  return next is
  ( score(empty_pkb)
  , 1::real
  , 'score(empty_pkb) = 1'
  );

  poor_pkb = row(
    null::uuid,
    2::integer,
    null::textfield,
    null::textfield,
    null::textfield,
    null::numeric,
    null::boolean,
    null::boolean,
    null::numeric,
    null::boolean,
    null::boolean,
    null::integer,
    1000000::numeric
  )::pkb;

  return next is
  ( score(poor_pkb)
  , 0.36::real
  , 'score(poor_pkb) = 1'
  );

end;
$function$;

