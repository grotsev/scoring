create view rel_i18n_absent as
select *
from rel
where i18n_rus is null;
