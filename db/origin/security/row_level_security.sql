alter table staff_role enable row level security;

create policy select_staff_role on staff_role for select
  using (staff = jwt_staff());

