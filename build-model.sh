#!/bin/bash

mkdir build/

cat \
	model/sys/recreate-schema.sql \
	model/sys/code.sql \
	model/sys/person.sql \
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
	model/dict/fine_kind.sql \
	model/dict/cashflow_kind.sql \
	model/dict/fee_kind.sql \
	model/dict/fee.sql \
	model/dict/pledge_kind.sql \
	model/dict/credit_kind.sql \
	model/dict/marital_status.sql \
	model/dict/gender.sql \
	model/dict/residence_kind.sql \
	model/dict/stage.sql \
	model/dict/country.sql \
	model/dict/province.sql \
	model/dict/district.sql \
	model/dict/location.sql \
	model/dict/idcard_kind.sql \
	model/dict/idcard_authority.sql \
	model/dict/resident_status.sql \
	model/dict/education.sql \
	model/dict/speciality.sql \
	model/dict/credit_purpose.sql \
	model/dict/phone_kind.sql \
	model/dict/position_category.sql \
	model/dict/relation_kind.sql \
	\
	model/dict-conf/product_scheme.sql \
	model/dict-conf/product_fee.sql \
	\
	model/rel/app.sql \
	model/rel/app_person.sql \
	model/rel/app_idcard.sql \
	model/rel/app_wish.sql \
	model/rel/app_profile.sql \
	model/rel/app_address.sql \
	model/rel/app_offer.sql \
	model/rel/app_cashflow.sql \
	model/rel/app_term.sql \
	model/rel/app_phone.sql \
	model/rel/app_coborrower.sql \
	model/rel/app_pledgor.sql \
	model/rel/app_employment.sql \
	model/rel/app_relation.sql \
	model/rel/app_relation_phone.sql \
	\
	> build/model.sql
