create function i18n(
  the_table name
) returns text
  language plpgsql
  stable
as $function$
declare
begin

  return format(
$macro$

alter table %1$s
  add column created_at timestamptz not null
, add column created_by        uuid not null
, add foreign key (created_by) references %2$s;

$macro$
  , the_table
  , ( select string_agg(line, E'\n'::text) from (
        select format('  add column %s text%s',
            column_name,
            case when ordinal_position=max(ordinal_position) over () then ';' else ',' end
          ) as line
        from i18n
        where table_catalog = 'postgres'
          and table_schema  = 'scoring'
          and table_name    = the_table
        order by i18n
      ) l
    )
  );

end;
$function$;

comment on function i18n(name) is
  'Macro add translation columns to dictionary. Requires i18n';
