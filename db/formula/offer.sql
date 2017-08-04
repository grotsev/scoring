create function offer(
  contract contract_template,

  out amount_ltv   monetary,
  out amount_k1    monetary,
  out amount_k2    monetary,
  out amount_offer monetary
)
  language sql
  stable
as $function$
  with amount_calc as (
    select (contract.pledge_value*product.ltv)::monetary as amount_ltv
         , 1::monetary as amount_k1
         , 1::monetary as amount_k2
         , amount as amount_request
    from contract
      inner join product_scheme as product using
        (product, currency, client_category, term_range, amount_range)
  )
  select amount_ltv
       , amount_k1
       , amount_k2
       , least(amount_ltv, amount_k1, amount_k2, amount_request) as amount_offer
  from amount_calc
$function$;

