#!/bin/bash

mkdir build/

cat \
	model/sys/recreate-schema.sql \
	model/sys/code.sql \
	model/sys/textfield.sql \
	model/sys/textarea.sql \
	model/sys/iin.sql \
	model/sys/phone.sql \
	model/sys/email.sql \
	\
	model/dict/lang.sql \
	model/dict/currency.sql \
	model/dict/branch.sql \
	model/dict/outlet.sql \
	model/dict/income_evidence.sql \
	model/dict/repayment_kind.sql \
	model/dict/client_category.sql \
	model/dict/product.sql \
	model/dict/cashflow_kind.sql \
	model/dict/fee_kind.sql \
	model/dict/fee.sql \
	model/dict/pledge_kind.sql \
	model/dict/credit_kind.sql \
	model/dict/marital_status.sql \
	model/dict/gender.sql \
	model/dict/tenure.sql \
	model/dict/stage.sql \
	model/dict/country.sql \
	model/dict/province.sql \
	model/dict/district.sql \
	model/dict/location.sql \
	model/dict/idcard_kind.sql \
	model/dict/idcard_authority.sql \
	model/dict/residency.sql \
	model/dict/education.sql \
	model/dict/speciality.sql \
	model/dict/credit_purpose.sql \
	model/dict/phone_kind.sql \
	model/dict/position_category.sql \
	model/dict/kinship.sql \
	model/dict/liability.sql \
	model/dict/wall_material.sql \
	model/dict/auto_brand.sql \
	model/dict/auto_model.sql \
	\
	model/dict-conf/product_scheme.sql \
	model/dict-conf/product_fee.sql \
	\
	model/rel/app.sql \
	model/rel/app_address.sql \
	model/rel/app_entity.sql \
	model/rel/app_person.sql \
	model/rel/app_cashflow.sql \
	model/rel/app_phone.sql \
	model/rel/app_kin.sql \
	model/rel/app_pledge.sql \
	\
	> build/model.sql
