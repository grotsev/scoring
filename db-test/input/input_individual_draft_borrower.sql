create function input_individual_draft_borrower(
  the_application uuid--,
) returns setof text
  language plpgsql
as $function$
declare
  contract_draft_count integer;
begin

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
    )
  ;
  get diagnostics contract_draft_count = row_count;
  return next is(contract_draft_count, 1, 'application has one borrower');
  
end;
$function$;

