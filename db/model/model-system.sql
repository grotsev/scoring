create domain monetary as numeric(18, 2)
;

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



create function modified_by(
) returns trigger
  language plpgsql
as $function$
begin
  new.modified_by = current_staff();
  return new;
end;
$function$;

create function deleted_by(
) returns trigger
  language plpgsql
as $function$
begin
  new.deleted_by = current_staff();
  return new;
end;
$function$;

create function distinct_data(
) returns trigger
  language plpgsql
as $function$
declare
  tmp uuid;
begin
  tmp = new.modified_by;
  new.modified_by = old.modified_by;
  if new = old then
    return null;
  end if;
  new.modified_by = tmp;
  return new;
end;
$function$;

