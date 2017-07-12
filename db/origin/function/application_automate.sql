create function application_automate(
  the_application uuid
) returns void
  language plpgsql
as $function$
declare
  the_stage code;
  the_contract contract;
  required_field text[];
begin

  select stage from staging where application = the_application into the_stage;

  case the_stage
  when 'ATTRACTION' then
    -- required field check
    select * from contract where application = the_application into the_contract;
    with c as (select * from contract where application = the_application)
    select array(
      select 'product' from c where product is null union all
      select 'currency' from c where currency is null union all
      select 'client_category' from c where client_category is null
    ) into required_field;
    case when array_length(required_field, 1) > 0 then
      raise 'Required  fields %', required_field;
    end case;
  when 'APPLICATION' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'VERIFICATION' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'PLEDGE_ESTIMATION' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'LEGAL_REVIEW' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'SECURITY' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'RISK_MANAGEMENT' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'RETAIL_COMMITTEE' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'CREDIT_COMMITTEE' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'LEGAL_REVIEW_ADDITIONAL' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'MIDDLE_ADMINISTRATOR' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'CONTRACT_SIGNING' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'PLEDGE_REGISTRATION' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  when 'CREDIT_ADMINISTRATOR' then
    assert false, 'Unimplemented stage ' || the_stage; -- TODO implement
  else assert false, 'Unhandled stage ' || the_stage;
  end case;

end;
$function$;

comment on function application_automate(uuid) is
  'Advance appliction stage and do another automatic business process';

