create function route_default(
  the_application uuid
, the_stage code
) returns setof code
  language plpgsql
  stable -- WARN
as $function$
declare
  amount numeric;
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
    when 'PLEDGERATE' then
      return next 'LAWYER';
    when 'LAWYER' then
      return next 'SECURITY';
    when 'SECURITY' then
      select x.amount from contract_actual x where application = the_application into amount;
      case
        when amount > 1000000 then
          return next 'RISK';
        else
          return next 'SIGNING';
      end case;
    when 'RISK' then
      return next 'RETAILCOM';
    when 'RETAILCOM' then
      return next 'CREDITCOM';
    when 'CREDITCOM' then
      return next 'MIDDLE';
    when 'MIDDLE' then
      return next 'SIGNING';
    when 'SIGNING' then
      return next 'PLEDGEREG';
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

