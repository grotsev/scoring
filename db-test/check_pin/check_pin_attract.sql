create function check_pin_attract(
  the_application uuid
) returns setof text
  language plpgsql
as $function$
declare
  the_borrower uuid;
begin

  update contract_attract set
    product = 'NEEDFUL_CREDIT_MORTGAGE',
    currency = 'KZT',
    client_category ='A1',
    term_range = '[12,120]',
    amount_range = '[10000,)',
    term = 16,
    amount = 2000000
  where application = the_application;

  select individual
  from individual_responsibility
  where application = the_application
    and responsibility = 'BORROWER'
  into strict the_borrower;

  update individual set
    iin = '850118400153',
    surname = 'Иванов',
    name = 'Иван',
    patronymic = 'Иванович',
    dob = '1985-01-18',
    gender = 'MALE',

    marital_status = 'MARRIED',
    children_lt_15 = 0,
    children_15_21 = 0,
    dependant_ge_21 = 0,

    tenure = 'PROPERTY',

    photo = uuid_generate_v1mc(),

    employment_title = $$ТОО 'ASSEM'$$,
    employment_last_service = 12,
    employment_total_service = 48
  where application = the_application
    and individual = the_borrower;

end;
$function$;

