create function score(
  pkb pkb
) returns real
  language plpgsql
  immutable -- WARN
as $function$
declare
  credit_count_factor real;
begin

  credit_count_factor := case coalesce(pkb.current_credit_count, 0)
    when 0 then 1
    when 1 then 0.8
    when 2 then 0.6
    when 3 then 0.4
    else 0.2
  end;

  return credit_count_factor;

end;
$function$;

comment on function score(pkb) is
  'Score by PKB credit history';

