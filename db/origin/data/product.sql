insert into currency values
  ('RUB')
, ('KZT')
, ('USD')
, ('CNY')
;

insert into client_category values
  ('A1')
, ('A2')
, ('B1')
, ('B2')
, ('EMPLOYEE')
;

insert into product values
  ('CREDIT_CARD')
, ('NEEDFUL_CREDIT_MORTGAGE')
, ('NEEDFUL_CREDIT_AUTO')
, ('NEEDFUL_CREDIT_CASH')
, ('NEEDFUL_CREDIT_PLEDGE')
, ('NEEDFUL_CREDIT_NOT_REVOLVING')
, ('NEEDFUL_CREDIT_REVOLVING')
, ('NEEDFUL_CREDIT_REFINANCING')
, ('CREDIT_DEPOSIT')
, ('AUTO_CREDIT')
;

insert into product_scheme values
  ('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'A1', '[12, 120]', '[10000, 100000)', 13.8, 1, 1, 0, false)
, ('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'B1', '[12, 120]', '[10000, 100000)', 15,   1, 1, 0, false)
, ('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'A2', '[12, 120]', '[10000, 100000)', 15,   1, 1, 0, false)
, ('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'B2', '[12, 120]', '[10000, 100000)', 15,   1, 1, 0, false)
, ('NEEDFUL_CREDIT_MORTGAGE', 'USD', 'A1', '[12, 120]', '[1000, 100000)' , 13,   1, 1, 0, false)
;

insert into fee_kind values
  ('COMMISSION')
, ('FINE')
, ('INSURANCE')
;

insert into fee values
  ('REVIEW', 'COMMISSION', 1)
, ('OVERDUE', 'FINE', 5)
, ('MANDATORY_INSURANCE', 'INSURANCE', 3)
;

insert into product_fee
  select p.product, p.currency, p.client_category, p.term_range, p.amount_range, f.fee
  from product_scheme p
    cross join fee f
;

