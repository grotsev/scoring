create function pin(
  the_application uuid,
  the_stage code
) returns void
  language plpgsql
as $function$
begin

  if not exists (
    select
    from application_stage
    where application = the_application
      and stage = the_stage
      and not blocked
  ) then
    raise 'No stage %', the_stage;
  end if;

  insert into pin (application, staff, stage, sys_period)
    values (the_application, current_staff(), the_stage, tstzrange(now(), null) );

  insert into contract_draft (
    select * from contract_actual
    where application = the_application
  );

  -- new empty contract
  insert into contract_draft (application, sys_period)
    values (the_application, tstzrange(now(), null))
    on conflict do nothing;

end;
$function$;

comment on function pin(uuid, code) is
  'Pin application to current_staff and create or copy draft from last state';

