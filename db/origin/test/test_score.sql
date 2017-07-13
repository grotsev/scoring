create function test_score(
) returns setof text
  language plpgsql
  set role from current
as $function$
declare
  empty_pkb pkb;
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

end;
$function$;

