create function check_pin_attract(
  the_application uuid
) returns setof text
  language plpgsql
as $function$
declare
  contract_draft_count integer;
begin

  update contract_draft set
    product = 'NEEDFUL_CREDIT_MORTGAGE',
    currency = 'KZT',
    client_category ='A1',
    term_range = '[12, 120]',
    amount_range = '[10000, 100000)',
    amount = 500000
  where application = the_application;
  
  update individual set
    iin = '800102012345',
    surname = 'Ivanov',
    name = 'Ivan',
    patronymic = 'Ivanovich'
  where application = the_application
    and individual = (
      select individual
      from individual_responsibility
      where application = the_application
        and responsibility = 'BORROWER'
    );
  get diagnostics contract_draft_count = row_count;
  return next is(contract_draft_count, 1, 'application has one borrower');
  
end;
$function$;

