grant execute on function
  authenticate(login, text)
, authorize(name)
, jwt_staff()
, jwt_login()
, jwt_role()
to public;

grant select on table staff_role to scoring_public;
alter table staff_role enable row level security;
create policy select_staff_role on staff_role for select
  using (staff = jwt_staff());

grant select on table
  branch
, outlet
, staff_outlet
to scoring_user;

grant select, insert, update on table
  branch
, outlet
to scoring_administrator;
