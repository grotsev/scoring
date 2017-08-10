create function route_default(
  the_application uuid,
  the_stage code
) returns setof code
  language plpgsql
  stable -- WARN
as $function$
declare
  amount monetary;
begin

  case the_stage
    when 'ATTRACT' then
      return next 'BLACKLIST';
      return next 'TERROLIST';
    when 'BLACKLIST', 'TERROLIST' then
      return next 'DECLARE';
    when 'DECLARE' then
      return next 'VERIFY';
    when 'VERIFY' then
      return next 'PLEDGERATE';
      return next 'LAWYER';
      select x.amount from contract x where application = the_application into amount;
      if amount >= 1000000 then
        return next 'SECURITY';
      end if;
      return next 'RISK';
    when 'PLEDGERATE' then
      return next 'MIDDLE';
    when 'LAWYER' then
      return next 'MIDDLE';
    when 'SECURITY' then
      return next 'MIDDLE';
    when 'RISK' then
      select x.amount from contract x where application = the_application into amount;
      if amount >= 1000000 then
        return next 'CREDITCOM';
      else
        return next 'RETAILCOM';
      end if;
    when 'RETAILCOM' then
      null;
    when 'CREDITCOM' then
      null;
    when 'MIDDLE' then
      return next 'SIGNING';
    when 'SIGNING' then
      if true then -- TODO change to has pledge
        return next 'PLEDGEREG';
      else
        return next 'CREDITADMIN';
      end if;
    when 'PLEDGEREG' then
      return next 'CREDITADMIN';
    when 'CREDITADMIN' then
      -- The end, do nothing
    else
      assert false, 'Unhandled stage ' || the_stage;
  end case;

end;
$function$;

comment on function route_default(uuid, code) is
  'Default route for vast mayority of products mostly based on current stage';
