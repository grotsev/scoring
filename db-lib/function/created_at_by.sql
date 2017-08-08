create function created_at_by(
) returns trigger
  language plpgsql
as $function$
begin
  new.created_at = now();
  new.created_by = current_actor();
  return new;
end;
$function$;

comment on function created_at_by() is
  'Trigger to audit created_at and created_by. Requires current_actor()';

