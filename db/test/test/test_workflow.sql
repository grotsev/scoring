create function test_workflow(
) returns setof text
  language plpgsql
  set role from current
as $function$
declare
  the_actor uuid;
  the_application uuid;

  the_stage code;
  stage_round int4;
  stage_name text;
  stage_function text;
  back_stage code;
  reset boolean;

  the_error text;
begin

  select become(auth('attract', 'scoring_attract')) into the_actor;
  the_application = application_create();
  return next diag('         check_application_create');
  return query select check_application_create(the_application, the_actor);

  foreach the_stage, stage_round, back_stage, reset in array array[
    ('ATTRACT'    ::code, null, null            , false),
    ('BLACKLIST'  ::code, null, null            , false),
    ('TERROLIST'  ::code, null, null            , false),
    ('DECLARE'    ::code, null, null            , false),
    ('VERIFY'     ::code, null, null            , false),
    ('PLEDGERATE' ::code, null, null            , false),
    ('LAWYER'     ::code, null, 'DECLARE'       , true),
    ('DECLARE'    ::code, 2   , null            , false),
    ('VERIFY'     ::code, 2   , null            , false),
    ('PLEDGERATE' ::code, 2   , 'DECLARE'       , false),
    --('PKB'        ::code, null, null            , false),
    ('LAWYER'     ::code, 2   , null            , false),
    ('DECLARE'    ::code, 3   , null            , false),
    ('PLEDGERATE' ::code, 3   , null       , false),
    --('SECURITY'   ::code, null, null            , false), -- TODO amount >= 1000000
    ('RISK'       ::code, null, null            , false),
    --('RETAILCOM'  ::code, null, null            , false), -- amount >= 1000000
    ('CREDITCOM'  ::code, null, null            , false),
    ('MIDDLE'     ::code, null, null            , false),
    ('SIGNING'    ::code, null, null            , false),
    ('PLEDGEREG'  ::code, null, null            , false),
    ('CREDITADMIN'::code, null, null            , false)
  ] loop
    begin
      stage_name = lower(the_stage);
      stage_function = stage_name||coalesce('_'||stage_round, '');
      return next diag('  ', stage_function);
      select become(auth(stage_name, 'scoring_'||stage_name)) into the_actor;
      perform pin(the_application, the_stage);

      return next diag('         check_pin(', stage_function, ')');
      return query select check_pin(the_application, the_actor, the_stage);

      return next diag('         check_pin_', stage_function);
      return query execute 'select check_pin_'||stage_function||'($1)' using the_application;

      perform unpin(the_application, back_stage, reset);

      return next diag('         check_unpin_', stage_function);
      return query execute 'select check_unpin_'||stage_function||'($1)' using the_application;
    exception
      when others then
        GET STACKED DIAGNOSTICS the_error = message_text;
        return next fail(the_error);
        exit;
    end;
  end loop;

end;
$function$;
