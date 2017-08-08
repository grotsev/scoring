create function test_authorize(
) returns setof text
  language plpgsql
  set role from current
as $function$
begin

  set local role to anonymous;
  set local jwt.claims.login = 'all';
  set local jwt.claims.actor = '11110000-0000-0000-0000-000011110000';
  return next is(
    authorize('scoring_attract')::jwt_token,
    row(
      'all',
      '11110000-0000-0000-0000-000011110000'::uuid,
      'scoring_attract'::name,
      extract(epoch from (now() + interval '1 week'))
    )::jwt_token,
    'user [all] is able to authorize as [scoring_attract]'
  );

  set local jwt.claims.login = 'attract';
  set local jwt.claims.actor = '11110000-0000-0000-0000-000011110002';
  return next is(
    authorize('scoring_attract')::jwt_token,
    row(
      'attract',
      '11110000-0000-0000-0000-000011110002'::uuid,
      'scoring_attract'::name,
      extract(epoch from (now() + interval '1 week'))
    )::jwt_token,
    'user [attract] is able to authorize as [scoring_attract]'
  );

  set local jwt.claims.login = 'attract';
  set local jwt.claims.actor = '11110000-0000-0000-0000-000011110002';
  return next is(
    authorize('scoring_administrator')::jwt_token,
    row(
      'attract',
      '11110000-0000-0000-0000-000011110002'::uuid,
      'anonymous'::name,
      extract(epoch from (now() + interval '1 week'))
    )::jwt_token,
    'user [attract] is not able to authorize as [scoring_admin]'
  );

end;
$function$;

