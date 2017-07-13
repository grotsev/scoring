create function application_release(
  the_application uuid
) returns void
  language plpgsql
as $function$
declare
begin
  
  insert into contract
  ( -- contract has changed in some column
    select * from only contract_draft
    where application = the_application
    except
    select * from contract
    where application = the_application
  ) on conflict (application) do update set
    product = excluded.product,
    currency = excluded.currency,
    client_category = excluded.client_category,
    term_range = excluded.term_range,
    amount_range = excluded.amount_range,
    term = excluded.term,
    amount = excluded.amount,
    repayment_kind = excluded.repayment_kind,
    income_evidence = excluded.income_evidence,
    deposit_value = excluded.deposit_value,
    property_value = excluded.property_value,
    pledge_value = excluded.pledge_value,
    pledge_currency = excluded.pledge_currency,
    init_payment = excluded.init_payment,
    init_payment_percent = excluded.init_payment_percent,
    pay_date = excluded.pay_date,
    monthly_payment = excluded.monthly_payment,
    credit_kind = excluded.credit_kind,
    credit_purpose = excluded.credit_purpose
  ;

  delete from contract_draft
  where application = the_application;

  perform route(the_application); -- TODO update possible_stage and available_stage

  delete from take
  where application = the_application;

end;
$function$;

comment on function application_release(uuid) is
  'Unpin application taken by current_staff, move draft dependent objects into last state and perform stage business logic';

