create function input_contract_draft(
  the_application uuid
) returns setof text
  language plpgsql
as $function$
begin

  update contract_draft set
    product = 'NEEDFUL_CREDIT_MORTGAGE',
    currency = 'KZT',
    client_category ='A1',
    term_range = '[12, 120]',
    amount_range = '[10000, 100000)',
    amount = 500000
  where application = the_application
  ;
  
end;
$function$;

