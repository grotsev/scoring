create function next_possible_stage(
  the_application uuid
) returns void
  language plpgsql
as $function$
declare
  the_stage code;
begin
  
  select stage
  from take
  where application = the_application
  into the_stage;

  delete from possible_stage
  where application = the_application
    and stage = the_stage;

  case the_stage
    when 'ATTRACTION' then
      insert into possible_stage values 
        (the_application, 'BLACK_LIST'),
        (the_application, 'TERRORIST_LIST');
    when  'BLACK_LIST', 'TERRORIST_LIST' then
      if not exists (select 1 from possible_stage where application = the_application) then
        insert into possible_stage values (the_application, 'APPLICATION');
      end if;
    when 'APPLICATION' then
      insert into possible_stage values (the_application 'VERIFICATION');
    when 'VERIFICATION' then
      insert into possible_stage values (the_application 'PLEDGE_ESTIMATION');
    when 'PLEDGE_ESTIMATION' then
      insert into possible_stage values (the_application 'LEGAL_REVIEW');
    when 'LEGAL_REVIEW' then
      insert into possible_stage values (the_application 'SECURITY');
    when 'SECURITY' then
      insert into possible_stage values (the_application 'RISK_MANAGEMENT');
    when 'RISK_MANAGEMENT' then
      insert into possible_stage values (the_application 'RETAIL_COMMITTEE');
    when 'RETAIL_COMMITTEE' then
      insert into possible_stage values (the_application 'CREDIT_COMMITTEE');
    when 'CREDIT_COMMITTEE' then
      insert into possible_stage values (the_application 'LEGAL_REVIEW_ADDITIONAL');
    when 'LEGAL_REVIEW_ADDITIONAL' then
      insert into possible_stage values (the_application 'MIDDLE_ADMINISTRATOR');
    when 'MIDDLE_ADMINISTRATOR' then
      insert into possible_stage values (the_application 'CONTRACT_SIGNING');
    when 'CONTRACT_SIGNING' then
      insert into possible_stage values (the_application 'PLEDGE_REGISTRATION');
    when 'PLEDGE_REGISTRATION' then
      insert into possible_stage values (the_application 'CREDIT_ADMINISTRATOR');
    when 'CREDIT_ADMINISTRATOR' then
      -- The end, do nothing
    else assert false, 'Unhandled stage ' || the_stage;
  end case;

end;
$function$;

comment on function next_possible_stage(uuid) is
  'Calculate next possible application stages mostly based on current taken stage';

