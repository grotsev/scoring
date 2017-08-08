create function created_at_by(
) returns trigger
  language plpgsql
as $function$
begin
  new.created_at = now();
  new.created_by = current_staff();
  return new;
end;
$function$;

