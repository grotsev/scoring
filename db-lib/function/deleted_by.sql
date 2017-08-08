create function deleted_by(
) returns trigger
  language plpgsql
as $function$
begin
  new.deleted_by = current_staff();
  return new;
end;
$function$;

