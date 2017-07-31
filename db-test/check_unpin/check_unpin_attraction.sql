create function check_unpin_attraction(
  the_application uuid
) returns setof text
  language plpgsql
  set role scoring
as $function$
begin

  return next row_eq(
    $$select * from contract_actual where application='$$||the_application||$$'$$,
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
      )::contract_actual,
    'unpin() fill contract_actual from contract_draft'
  );

  return next is_empty(
    $$select * from contract_draft where application = '$$||the_application||$$'$$,
    'contract_draft is cleared by unpin()'
  );

  return next set_eq(
    $$select stage, blocked from application_stage where application ='$$||the_application||$$'$$,
    $$values ('BLACK_LIST', false), ('TERRORIST_LIST', false)$$,
    'application_stage after [ATTRACTION] are not blocked to [BLACK_LIST] and [TERRORIST_LIST]'
  );

end;
$function$;
