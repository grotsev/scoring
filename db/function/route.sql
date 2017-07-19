create function route(
  the_application uuid
, the_stage code
) returns setof code
  language plpgsql
  stable -- WARN
as $function$
declare
  the_product code;
begin
  
  select product from contract_actual where application = the_application into the_product;

  case the_product
    when 'CREDIT_CARD' then
      return query select route_credit_card(the_application, the_stage); -- TODO
    else
      return query select route_default(the_application, the_stage);
  end case;

end;
$function$;

comment on function route(uuid, code) is
  'Calculate next possible application stages mostly based on product';

