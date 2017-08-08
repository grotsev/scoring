create function become(
  token jwt_token
) returns uuid
  language plpgsql
as $function$
begin
  execute $$set local jwt.claims.login to '$$ || token.login || $$'$$;
  execute $$set local jwt.claims.role  to '$$ || token.role  || $$'$$;
  execute $$set local jwt.claims.actor to '$$ || token.actor || $$'$$;
  execute $$set local role $$ || token.role;

  return token.actor;
end;
$function$;

comment on function become(jwt_token) is
  'Become a actor and role';

