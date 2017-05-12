grant usage on schema scoring to scoring_public;

grant select on table staff_role to scoring_public;
alter table staff_role enable row level security;
create policy select_staff_role on staff_role for select
  using (staff = jwt_staff());

