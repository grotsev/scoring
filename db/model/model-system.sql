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


create function actual(
  the_template name
) returns setof text
  language plpgsql
as $function$
begin

  return next 'create function actual_'||the_template||'(';
  return next '  the_application uuid';
  return next ') returns void';
  return next '  language plpgsql';
  return next ' as $function1$';
  return next 'begin';
  return next '';
  return next '  insert into '||the_template||'_actual (';
  return next '    select * from only '||the_template||'_draft';
  return next '    where application = the_application';
  return next '  ) on conflict (application) do update set';

  return query
    select '    '||
      rpad(column_name, max(length(column_name)) over ())
      ||' = excluded.'
      ||column_name
      ||case when ordinal_position=max(ordinal_position) over () then ';' else ',' end
    from information_schema.columns
    where table_schema = 'scoring'
      and table_name   = the_template||'_template'
    order by ordinal_position;

  -- TODO delete removed rows

  return next '';
  return next 'end;';
  return next '$function1$;';

end;
$function$;

comment on function actual(name) is
  'Generate code of function to move application data from draft to actual table';

