create function unpin(
  the_application uuid,
  back_stage code default null,
  reset boolean default false
) returns void
  language plpgsql
as $function$
declare
  the_stage code;
begin

  insert into contract_actual
  ( -- contract_draft has changed in some column
    select * from only contract_draft
    where application = the_application
    except
    select * from contract_actual
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
    credit_purpose = excluded.credit_purpose;

  delete from contract_draft
  where application = the_application;

  -- TODO trace dump

  -- update application_stage

  select stage
  from pin
  where application = the_application
    and staff = current_staff()
  into the_stage;

  if back_stage is null then -- decision tree stage transition

    delete from application_stage
    where application = the_application
      and stage = the_stage;

    insert into application_stage (application, stage, blocked) (
      select the_application, forth, false
      from rework
      where application = the_application
        and back = the_stage
    ) on conflict do nothing;

    if not found then -- no rework, route

      insert into application_stage (application, stage, blocked) (
        select the_application, stage, true
        from route(the_application, the_stage) stage
      ) on conflict do nothing;

      if true = all (
        select blocked
        from application_stage
        where application = the_application
      ) then
        update application_stage a set
          blocked = false
        where application = the_application;
      end if;

    end if;

  elseif not reset then -- rework back and forth stage transition

    delete from application_stage
    where application = the_application
      and stage = the_stage;

    insert into rework (application, back, forth)
    values (the_application, back_stage, the_stage);

    insert into application_stage (application, stage, blocked)
    values (the_application, back_stage, false);

  else -- reset stage transition

    delete from application_stage
    where application = the_application;

    insert into application_stage (application, stage, blocked)
    values (the_application, back_stage, false);

  end if;

  -- unpin application from staff

  delete from pin
  where application = the_application;

end;
$function$;

comment on function unpin(uuid,code,boolean) is
  'Unpin application pinned by current_staff, move draft dependent objects into last state and perform stage business logic';

