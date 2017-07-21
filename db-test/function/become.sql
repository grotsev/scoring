create function become(
  token jwt_token
) returns uuid
  language plpgsql
as $function$
begin
  execute $$set local jwt.claims.login to '$$ || token.login || $$'$$;
  execute $$set local jwt.claims.role  to '$$ || token.role  || $$'$$;
  execute $$set local jwt.claims.staff to '$$ || token.staff || $$'$$;
  execute $$set local role $$ || token.role;

  return token.staff;
end;
$function$;

comment on function become(jwt_token) is
  'Become a staff and role';

