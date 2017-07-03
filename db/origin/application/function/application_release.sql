create function application_release(the_application uuid) returns void as $function$
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
    product = excluded.product
  ;

end;
$function$ language plpgsql;
