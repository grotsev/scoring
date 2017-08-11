insert into fee
  (fee                  , fee_kind    , percent, i18n_rus                                     )
values
  ('REVIEW'             , 'COMMISSION',       1, 'за рассмотрение заявки на получение кредита')
, ('OVERDUE'            , 'FINE'      ,       5, 'пеня за нарушение сроков платежа по ДБЗ'    )
, ('MANDATORY_INSURANCE', 'INSURANCE' ,       3, 'обязательное страхование'                   )
;
