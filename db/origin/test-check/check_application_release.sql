create function check_application_release(
  the_application uuid
) returns setof text
  language plpgsql
  set role scoring
as $function$
begin

  return next row_eq(
    $$select * from contract where application='$$||the_application||$$'$$,
    row(
      the_application,
      tstzrange(now(), null),

      'NEEDFUL_CREDIT_MORTGAGE'::code,
      'KZT',
      'A1',
      '[12, 120]'::int4range,
      '[10000, 100000)'::int4range,
      null,
      500000,

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
      )::contract,
    'application_release fill contract from contract_draft'
  );

  return next is_empty(
    $$select * from contract_draft where application = '$$||the_application||$$'$$,
    'contract_draft should be cleared by application_release'
  );

  --return next diag(array(select row(c.*) from contract_draft c)); TODO remove
  
end;
$function$;

