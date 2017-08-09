insert into cashflow_kind values
  ('SALARY_LAST_MONTH'     ,   1, false)
, ('SALARY_AVG'            ,   1, false)
, ('SALARY_SPOUSE'         ,   1, false)
, ('OTHER_CONFIRMED_INCOME',   1, false)
, ('CREDIT_PAY'            ,  -1, false)
, ('CREDIT_CARD_LIMIT'     ,  -1, false)
, ('EDUCATION'             ,  -1, false)
, ('TENANCY'               ,  -1, false)
, ('UTILITIES'             ,  -1, false)
, ('COMMUNICATIONS'        ,  -1, false)
, ('PERSONAL'              ,  -1, false)
, ('ALIMONY'               ,  -1, false)
, ('OTHER_EXPENSES'        ,  -1, false)
, ('INSURANCE'             ,  -1,  true)
, ('COMMISSION'            ,  -1, false)
, ('TRANSPORT_TAX'         , -12, false)
;

insert into education values
  ('SECONDARY')
, ('SPECIALIZEDSECONDARY')
, ('HIGH')
, ('BACHELOR')
, ('MASTER')
, ('CANDIDATE')
, ('PHD')
, ('DOCTOR')
;

insert into gender values
  ('MALE')
, ('FEMALE')
;

insert into idcard_authority values
  ('MIA_RK')
, ('MJ_RK')
, ('OTHER')
;

insert into idcard_kind values
  ('ID_CARD')
, ('PASSPORT')
;

insert into kinship values
  ('PARENT')
, ('CHILD')
, ('SIBLING')
, ('UNCLE_AUNT')
, ('KINSMAN')
, ('FRIEND')
, ('COLLEAGUE')
;

insert into marital_status values
  ('SINGLE')
, ('MARRIED')
;

insert into phone_kind values
  ('CONTACT')
, ('HOME')
, ('MOBILE')
, ('WORK')
;

insert into position_category values
  ('TOP')
, ('MIDDLE')
, ('SPECIALIST')
, ('ORDINARY')
;

insert into residency values
  ('RESIDENT')
, ('NOT_RESIDENT')
;

insert into responsibility values
  ('BORROWER')
, ('COBORROWER')
, ('PLEDGER')
, ('GUARANTOR')
, ('INSURER')
;

insert into speciality values
  ('MATHEMATICIAN')
, ('PHYSICIST')
, ('BIOLOGIST')
;

insert into tenure values
  ('PROPERTY')
, ('TENANCY')
;

