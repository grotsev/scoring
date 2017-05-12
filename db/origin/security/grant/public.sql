grant usage on schema scoring to public;

grant execute on function
  authenticate(login, text)
, authorize(name)
to public;

grant select on table
  staff_role
to public;

