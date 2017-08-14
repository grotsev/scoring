create view rel_i18n_absent as
select *
from rel
where i18n_rus is null;

comment on view rel_i18n_absent is
  'Not i18n relation';
