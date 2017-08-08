create function modified_by(
) returns trigger
  language plpgsql
as $function$
begin
  new.modified_by = current_staff();
  return new;
end;
$function$;

