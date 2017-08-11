create function macro_i18n(
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
%2$s
$macro$
  , the_table
  , ( select string_agg(line, E'\n'::text)
      from (
        select format('  add column i18n_%s text not null%s',
            i18n,
            case when row_number() over ()=count(*) over () then ';' else ',' end
          ) as line
        from i18n
        order by i18n
      ) l
    )
  );

end;
$function$;

comment on function macro_i18n(name) is
  'Macro add translation columns to dictionary. Requires i18n';
