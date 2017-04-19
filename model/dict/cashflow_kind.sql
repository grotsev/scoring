create table cashflow_kind (
	cashflow_kind code primary key,
	period numeric not null
);

comment on column cashflow_kind.period is 'In monthes, positive income, negative expences';

insert into cashflow_kind values
	('SALARY_LAST_MONTH', 1),
	('SALARY_AVG', 1),
	('SALARY_SPOUSE', 1),
	('OTHER_CONFIRMED_INCOME', 1),
	('CREDIT_PAY', -1),
	('CREDIT_CARD_LIMIT', -1),
	('EDUCATION', -1),
	('TENANCY', -1),
	('UTILITIES', -1),
	('COMMUNICATIONS', -1),
	('PERSONAL', -1),
	('ALIMONY', -1),
	('TRANSPORT_TAX', -12)
;

