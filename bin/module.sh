#!/bin/bash

module='
  lib
  actor
  product application
  address
  pledge contract person pkb
'

main_model_lib='
  lib/domain/code
  lib/domain/monetary
  lib/domain/textarea
  lib/domain/textfield
  lib/domain/uuid_pk
  lib/trigger/created_at_by
  lib/trigger/deleted_by
  lib/trigger/distinct_data
  lib/trigger/modified_by
  lib/macro/actualize
  lib/macro/audit_created_at_by
  lib/macro/macro_i18n
  lib/macro/versionize
  lib/table/rel
  lib/table/i18n
  lib/table/i18n_rel
  lib/table/i18n_attr
'

main_model_actor='
  main/domain/login
  main/type/jwt_token
  main/table/branch
  main/table/outlet
  main/table/actor
  main/guc/lib.actor_table
  main/table/actor_outlet
  main/table/actor_role
'

main_model_address='
  main/table/country
  main/table/province
  main/table/district
  main/table/location
  main/table/address
'

main_model_application='
  main/table/stage
  main/table/application
  main/table/application_stage
  main/table/pin_history
  main/table/pin
  main/table/rework
  main/trigger/assign_outlet
'

main_model_contract='
  main/table/credit_kind
  main/table/credit_purpose
  main/table/income_evidence
  main/table/repayment_kind
  main/table/contract_template
  main/table/contract_attract
  main/table/contract_history
  main/table/contract
'

main_model_person='
  main/domain/email
  main/domain/iin
  main/domain/phone
  main/table/cashflow_kind
  main/table/education
  main/table/gender
  main/table/idcard_authority
  main/table/idcard_kind
  main/table/kinship
  main/table/marital_status
  main/table/phone_kind
  main/table/position_category
  main/table/residency
  main/table/responsibility
  main/table/speciality
  main/table/tenure
  main/table/individual
  main/table/individual_cashflow
  main/table/individual_kin
  main/table/individual_phone
  main/table/individual_responsibility
  main/table/legal_entity
  main/table/legal_entity_responsibility
'

main_model_pkb='
  main/table/pkb
'

main_model_pledge='
  main/table/auto_brand
  main/table/auto_model
  main/table/pledge_kind
  main/table/wall_material
  main/table/pledge
'

main_model_product='
  main/table/currency
  main/table/client_category
  main/table/product
  main/table/product_scheme
  main/table/fee_kind
  main/table/fee
  main/table/product_fee
'

main_data_lib='
  main/data/rel
  main/data/i18n
  main/do/i18n
'

main_data_actor='
  main/data/branch
  main/data/outlet
'

main_data_address='
  main/data/country
  main/data/province
  main/data/district
  main/data/location
'

main_data_application='
  main/data/stage
'

main_data_contract='
  main/data/credit_kind
  main/data/credit_purpose
  main/data/income_evidence
  main/data/repayment_kind
'

main_data_person='
  main/data/cashflow_kind
  main/data/education
  main/data/gender
  main/data/idcard_authority
  main/data/idcard_kind
  main/data/kinship
  main/data/marital_status
  main/data/phone_kind
  main/data/position_category
  main/data/residency
  main/data/responsibility
  main/data/speciality
  main/data/tenure
  '

main_data_pledge='
  main/data/auto_brand
  main/data/auto_model
  main/data/pledge_kind
  main/data/wall_material
'

main_data_product='
  main/data/currency
  main/data/client_category
  main/data/product
  main/data/product_scheme
  main/data/fee_kind
  main/data/fee
  main/data/product_fee
'

test_data_actor='
  test/data/actor
  test/data/actor_outlet
  test/data/actor_role
'

test_data_application='
  test/data/application
'

test_data_contract='
  test/data/contract
'
