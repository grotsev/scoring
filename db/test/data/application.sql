set local jwt.claims.actor = '11110000-0000-0000-0000-000011110000'; -- all

insert into application (application) values
  ('11120000-0000-0000-0000-000011110000'::uuid) -- FOR performance disable-trigger disabled
, ('11120000-0000-0000-0000-000011110001'::uuid) -- FOR performance disable-trigger enabled
;
