create function route(
  the_application uuid
) returns setof code
  language plpgsql
  stable -- WARN
as $function$
declare
  the_stage code;
  the_product code;
  amount numeric;
begin
  
  select stage
  from take
  where application = the_application
  into the_stage;

  select product from contract where application = the_application into the_product;

  case the_product
    when 'CREDIT_CARD' then
      return query select route_credit_card(the_application, the_stage); -- TODO
    else
      return query select route_default(the_application, the_stage);
  end case;

end;
$function$;

comment on function route(uuid) is
  'Calculate next possible application stages mostly based on product';

