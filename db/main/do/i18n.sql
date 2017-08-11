do $block$
begin
  execute (
    select string_agg(macro_i18n(table_name), E'\n'::text)
    from (values
      ('client_category')
    , ('gender')
    , ('country')
    , ('credit_kind')
    , ('credit_purpose')
    , ('currency')
    , ('district')
    , ('education')
    , ('fee')
    , ('fee_kind')
    , ('idcard_authority')
    , ('idcard_kind')
    , ('income_evidence')
    , ('kinship')
    , ('location')
    , ('marital_status')
    , ('outlet')
    , ('phone_kind')
    , ('pledge_kind')
    , ('position_category')
    , ('product')
    , ('province')
    , ('repayment_kind')
    , ('residency')
    , ('responsibility')
    , ('speciality')
    , ('stage')
    , ('tenure')
    , ('wall_material')
    ) t(table_name)
  );
end;
$block$;