create function actualize(
  the_template name
) returns text
  language plpgsql
as $function$
begin

  return format(

$macro$
create function actualize_%1$s(
  the_application uuid
) returns void
  language plpgsql
 as $function1$
begin

  insert into %1$s_actual (
    select * from only %1$s_draft
    where application = the_application
  ) on conflict on constraint %1$s_actual_pkey do update set
%2$s

end;
$function1$;
$macro$

  , the_template
  , ( select string_agg(line, E'\n'::text) from (
        select format('    %s = excluded.%s%s',
            rpad(column_name, max(length(column_name)) over ()),
            column_name,
            case when ordinal_position=max(ordinal_position) over () then ';' else ',' end
          ) as line
        from information_schema.columns
        where table_catalog = 'postgres'
          and table_schema  = 'scoring'
          and table_name    = the_template||'_template'
        order by ordinal_position
      ) l
    )
  );
  -- TODO delete removed rows


end;
$function$;

comment on function actualize(name) is
  'Macro move application data according to template from draft to actual table';

