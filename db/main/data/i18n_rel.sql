insert into i18n_rel
        (i18n , rel, title)
  select 'RUS', rel, title
  from ( values
     ('actor'                      , 'исполнитель'                                  )
  ,  ('actor_outlet'               , 'отделение исполнителя'                        )
  ,  ('actor_role'                 , 'роль исполнителя'                             )
  ,  ('address'                    , 'адрес'                                        )
  ,  ('application'                , 'заявка'                                       )
  ,  ('application_stage'          , 'этап заявки'                                  )
  ,  ('attr'                       , 'атрибут'                                      )
  ,  ('auto_brand'                 , 'бренд авто'                                   )
  ,  ('auto_model'                 , 'модель авто'                                  )
  ,  ('borrower_cashflow'          , 'доходы/расходы заёмщика'                      )
  ,  ('branch'                     , 'отделение'                                    )
  ,  ('cashflow_kind'              , 'вид доходов/расходов'                         )
  ,  ('client_category'            , 'категория клиента'                            )
  ,  ('contract'                   , 'условия контракта'                            )
  ,  ('contract_attract'           , 'условия контракта на этапе привлечения'       )
  ,  ('contract_ext'               , 'расчётные условия контракта'                  )
  ,  ('contract_history'           , 'изменения условий контракта'                  )
  ,  ('contract_template'          , 'условия контракта и их изменения'             )
  ,  ('country'                    , 'страна'                                       )
  ,  ('credit_kind'                , 'форма займа'                                  )
  ,  ('credit_purpose'             , 'цель кредитования'                            )
  ,  ('currency'                   , 'валюта'                                       )
  ,  ('district'                   , 'район'                                        )
  ,  ('education'                  , 'образование'                                  )
  ,  ('fee'                        , 'штраф/пеня'                                   )
  ,  ('fee_kind'                   , 'вид штрафа/пени'                              )
  ,  ('gender'                     , 'пол'                                          )
  ,  ('i18n'                       , 'перевод'                                      )
  ,  ('i18n_attr'                  , 'перевод атрибута'                             )
  ,  ('i18n_rel'                   , 'перевод термина'                              )
  ,  ('idcard_authority'           , 'орган выдачи документа'                       )
  ,  ('idcard_kind'                , 'документ удостоверения личности'              )
  ,  ('income_evidence'            , 'тип подтверждения доходов'                    )
  ,  ('individual'                 , 'физическое лицо'                              )
  ,  ('individual_cashflow'        , 'доходы/расходы физического лица'              )
  ,  ('individual_cashflow_total'  , 'доходы/расходы физического лица'              )
  ,  ('individual_kin'             , 'доходы/расходы физического лица итого в месяц')
  ,  ('individual_phone'           , 'телефон физического лица'                     )
  ,  ('individual_responsibility'  , 'ответственность по договору физического лица' )
  ,  ('kinship'                    , 'отношение к физическому лицу'                 )
  ,  ('legal_entity'               , 'юридическое лицо'                             )
  ,  ('legal_entity_responsibility', 'ответственность по договору юридического лица')
  ,  ('location'                   , 'местоположение'                               )
  ,  ('marital_status'             , 'семейное положение'                           )
  ,  ('outlet'                     , 'отделение'                                    )
  ,  ('phone_kind'                 , 'тип телефона'                                 )
  ,  ('pin'                        , 'взятие в работу'                              )
  ,  ('pin_history'                , 'история взятия в работу'                      )
  ,  ('pkb'                        , 'ПКБ'                                          )
  ,  ('pledge'                     , 'обеспечение'                                  )
  ,  ('pledge_kind'                , 'вид обеспечения'                              )
  ,  ('position_category'          , 'категория должности'                          )
  ,  ('product'                    , 'продукт'                                      )
  ,  ('product_fee'                , 'сборы по продукту'                            )
  ,  ('product_scheme'             , 'продуктовая схема'                            )
  ,  ('province'                   , 'область'                                      )
  ,  ('rel'                        , 'термин'                                       )
  ,  ('repayment_kind'             , 'тип погашения'                                )
  ,  ('residency'                  , 'статус резидентства'                          )
  ,  ('responsibility'             , 'ответственность по договору'                  )
  ,  ('rework'                     , 'отправка на доработку'                        )
  ,  ('speciality'                 , 'специальность по диплому'                     )
  ,  ('stage'                      , 'этап'                                         )
  ,  ('tenure'                     , 'отношение к месту проживания'                 )
  ,  ('wall_material'              , 'материал стен'                                )
  ) t(rel                          , title)
;