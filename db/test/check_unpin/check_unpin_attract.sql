create function check_unpin_attract(
  the_application uuid
) returns setof text
  language plpgsql
  set role scoring
as $function$
begin

  return next row_eq(
    $$select * from contract_attract where application='$$||the_application||$$'$$,
    row(
      the_application,

      'NEEDFUL_CREDIT_MORTGAGE'::code,
      'KZT',
      'A1',
      '[12,120]'::int4range,
      '[10000,)'::int4range,
      16,
      2000000,

      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null
      )::contract_attract,
    'pin() fill contract_attract'
  );

  return next set_eq(
    $$select stage, blocked from application_stage where application ='$$||the_application||$$'$$,
    $$values ('BLACKLIST', false), ('TERROLIST', false)$$,
    'application_stage after [ATTRACT] are not blocked to [BLACKLIST] and [TERROLIST]'
  );

end;
$function$;
