create function application_release(the_application uuid, stage code) returns void as $function$
declare
begin
  
  insert into contract
  ( select * from only contract_draft
    where application = the_application
    except
    select * from contract
    where application = the_application
  ) on conflict (application) do update set
    product = excluded.product
  ;

end;
$function$ language plpgsql;

