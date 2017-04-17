create table title (
	lang code references lang,
	dict regclass,
	code code,
	primary key (lang, dict, code)
);

comment on table title is '';
