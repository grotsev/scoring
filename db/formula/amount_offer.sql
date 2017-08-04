create function amount_offer(
  amount_ltv monetary,
  amount_k1 monetary,
  amount_k2 monetary,
  amount_request monetary
) returns monetary
  language sql
as $function$
  select least(amount_ltv, amount_k1, amount_k2, amount_request)
$function$;
