create function function_name(
  the_application uuid
) returns setof text
  language plpgsql
  set role from current
  -- security definer
as $function$
declare
  cursor refcursor;
begin

  return next is(
    'Actual',
    'Expected',
    'Description'
  );

end;
$function$;

comment on function function_name(uuid) is
  '';

