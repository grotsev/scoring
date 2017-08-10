create function distinct_data(
) returns trigger
  language plpgsql
as $function$
declare
  tmp uuid;
begin
  tmp = new.modified_by;
  new.modified_by = old.modified_by;
  if new = old then
    return null;
  end if;
  new.modified_by = tmp;
  return new;
end;
$function$;
