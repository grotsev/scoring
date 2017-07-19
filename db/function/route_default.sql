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
    when 'ATTRACTION' then
      return next 'BLACK_LIST';
      return next 'TERRORIST_LIST';
    when 'BLACK_LIST', 'TERRORIST_LIST' then
      return next 'APPLICATION';
    when 'APPLICATION' then
      return next 'VERIFICATION';
    when 'VERIFICATION' then
      return next 'PLEDGE_ESTIMATION';
    when 'PLEDGE_ESTIMATION' then
      return next 'LEGAL_REVIEW';
    when 'LEGAL_REVIEW' then
      return next 'SECURITY';
    when 'SECURITY' then
      select amount from contract_actual where application = the_application into amount;
      case
        when amount > 1000000 then
          return next 'RISK_MANAGEMENT';
        else
          return next 'CONTRACT_SIGNING';
      end case;
    when 'RISK_MANAGEMENT' then
      return next 'RETAIL_COMMITTEE';
    when 'RETAIL_COMMITTEE' then
      return next 'CREDIT_COMMITTEE';
    when 'CREDIT_COMMITTEE' then
      return next 'LEGAL_REVIEW_ADDITIONAL';
    when 'LEGAL_REVIEW_ADDITIONAL' then
      return next 'MIDDLE_ADMINISTRATOR';
    when 'MIDDLE_ADMINISTRATOR' then
      return next 'CONTRACT_SIGNING';
    when 'CONTRACT_SIGNING' then
      return next 'PLEDGE_REGISTRATION';
    when 'PLEDGE_REGISTRATION' then
      return next 'CREDIT_ADMINISTRATOR';
    when 'CREDIT_ADMINISTRATOR' then
      -- The end, do nothing
    else
      assert false, 'Unhandled stage ' || the_stage;
  end case;

end;
$function$;

comment on function route_default(uuid, code) is
  'Default route for vast mayority of products mostly based on current stage';

