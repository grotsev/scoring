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
    product = excluded.product
  ;

  delete from contract_draft
  where application = the_application
  ;

end;
$function$;

comment on function application_release(uuid) is
  'Unpin application taken by current_staff, move draft dependent objects into last state and perform stage business logic';

