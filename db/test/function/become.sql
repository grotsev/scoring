create function become(
  token jwt_token,
  global boolean = false
) returns uuid
  language plpgsql
as $function$
declare
  cmd text;
begin
  cmd = case when global then 'set' else 'set local' end;

  execute cmd||$$ jwt.claims.login = '$$ || token.login || $$'$$;
  execute cmd||$$ jwt.claims.role  = '$$ || token.role  || $$'$$;
  execute cmd||$$ jwt.claims.actor = '$$ || token.actor || $$'$$;
  execute cmd||$$ role $$ || token.role;

  return token.actor;
end;
$function$;

comment on function become(jwt_token,boolean) is
  'Become a actor and role';
