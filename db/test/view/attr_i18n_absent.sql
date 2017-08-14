create view attr_i18n_absent as
select *
from attr
where i18n_rus is null
order by attr, rel;

comment on view attr_i18n_absent is
  'Not i18n attribute';
