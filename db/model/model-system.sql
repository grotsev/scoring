create domain code as text
  check (value ~ '^[_A-Z][_A-Z0-9]{0,31}$')
;

create domain uuid_pk as uuid
  default uuid_generate_v1mc()
;

comment on domain uuid_pk is 'Primary key aware mostly sequential time based uuid';

create domain login as text
  check (value ~ '^[A-Za-z][A-Za-z_0-9]{0,31}$')
;

create domain textfield as text
  check (char_length(value) <= 100)
;

comment on domain textfield is 'Reasonably large user input but securely bounded';

create domain textarea as text
  check (char_length(value) <= 2000)
;

comment on domain textarea is 'Reasonably large user input but securely bounded';



create table lang
( lang code not null check (lang ~ '^[A-Z]{3}$')

, primary key (lang)
);

comment on table lang is 'ISO 639-2 upper case';

create table title
( lang     code not null
, dict regclass not null
, code     code not null

, primary key (lang, dict, code)
, foreign key (lang) references lang
);



create function modified(
) returns trigger
  language plpgsql
as $function$
begin
  if new <> old then
    return new;
  else
    return null;
  end if;
end;
$function$;


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
  ) on conflict (application) do update set
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
  'Generate code of function to move application data from draft to actual table';

