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

  select become(auth('attract', 'scoring_attract')) into the_staff;
  the_application = application_create();
  return next diag('         check_application_create');
  return query select check_application_create(the_application, the_staff);
  
  foreach the_stage, stage_round in array array[
    ('ATTRACT'    ::code, null),
    ('BLACKLIST'  ::code, null),
    ('TERROLIST'  ::code, null),
    ('DECLARE'    ::code, null),
    ('VERIFY'     ::code, null),
    ('PLEDGERATE' ::code, null)/*,
    ('DECLARE'    ::code, 2),
    ('VERIFY'     ::code, 2),
    ('PLEDGERATE' ::code, 2),
    ('PKB'        ::code, null),
    ('LAWYER'     ::code, null),
    ('DECLARE'    ::code, 3),
    ('LAWYER'     ::code, 2),
    ('SECURITY'   ::code, null),
    ('RISK'       ::code, null),
    ('RETAILCOM'  ::code, null),
    ('CREDITCOM'  ::code, null),
    ('MIDDLE'     ::code, null),
    ('SIGNING'    ::code, null),
    ('PLEDGEREG'  ::code, null),
    ('CREDITADMIN'::code, null)*/
  ] loop
    --begin
      stage_name = lower(the_stage);
      stage_function = stage_name||coalesce('_'||stage_round, '');
      select become(auth(stage_name, 'scoring_'||stage_name)) into the_staff;
      perform pin(the_application, the_stage);

      return next diag('         check_pin(', stage_function, ')');
      return query select check_pin(the_application, the_staff, the_stage);

      return next diag('         check_pin_', stage_function);
      return query execute 'select check_pin_'||stage_function||'($1)' using the_application;

      perform unpin(the_application);

      return next diag('         check_unpin_', stage_function);
      return query execute 'select check_unpin_'||stage_function||'($1)' using the_application;
    /*exception
      when others then
        GET STACKED DIAGNOSTICS the_error = message_text; -- pg_exception_detail
        raise '% %', the_stage, the_error;
    end;*/
  end loop;

end;
$function$;

