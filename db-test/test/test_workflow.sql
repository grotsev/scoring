create function test_workflow(
) returns setof text
  language plpgsql
  set role from current
as $function$
declare
  the_staff uuid;
  the_application uuid;
  
  the_stage code;
  stage_round integer;
  stage_name text;
  stage_function text;

  the_error text;
begin

  select become(auth('attraction', 'scoring_attraction')) into the_staff;
  the_application = application_create();
  return next diag('         check_application_create');
  return query select check_application_create(the_application, the_staff);
  
  foreach the_stage, stage_round in array array[
    ('ATTRACTION'              ::code, null)/*,
    ('BLACK_LIST'              ::code, null),
    ('TERRORIST_LIST'          ::code, null),
    ('APPLICATION'             ::code, null),
    ('VERIFICATION'            ::code, null),
    ('APPLICATION'             ::code, 2),
    ('VERIFICATION'            ::code, 2),
    ('PKB'                     ::code, null),
    ('PLEDGE_ESTIMATION'       ::code, null),
    ('LEGAL_REVIEW'            ::code, null),
    ('APPLICATION'             ::code, 3),
    ('SECURITY'                ::code, null),
    ('RISK_MANAGEMENT'         ::code, null),
    ('RETAIL_COMMITTEE'        ::code, null),
    ('CREDIT_COMMITTEE'        ::code, null),
    ('LEGAL_REVIEW_ADDITIONAL' ::code, null),
    ('MIDDLE_ADMINISTRATOR'    ::code, null),
    ('CONTRACT_SIGNING'        ::code, null),
    ('PLEDGE_REGISTRATION'     ::code, null),
    ('CREDIT_ADMINISTRATOR'    ::code, null)*/
  ] loop
    begin
      stage_name = lower(the_stage);
      stage_function = stage_name||coalesce(stage_round::text, '');
      select become(auth(stage_name, 'scoring_'||stage_name)) into the_staff;
      perform pin(the_application, the_stage);

      return next diag('         common ', stage_function);
      return next throws_ok(
        $$select pin('$$||the_application||$$', 'ATTRACTION')$$,
        'duplicate key value violates unique constraint "pin_pkey"',
        'Application is pinned just once'
      );
      return next isnt_empty(
        $$select * from contract_draft where application='$$||the_application||$$'$$,
        'pin() in create_application() creates contract_draft'
      );

      return next diag('         check_pin_', stage_function);
      return query execute 'select check_pin_'||stage_function||'($1)' using the_application;

      perform unpin(the_application);

      return next diag('         check_unpin_', stage_function);
      return query execute 'select check_unpin_'||stage_function||'($1)' using the_application;
    exception
      when others then
        GET STACKED DIAGNOSTICS the_error = message_text; -- pg_exception_detail
        raise '% %', the_stage, the_error;
    end;
  end loop;

end;
$function$;

