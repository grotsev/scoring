grant select on table
  credit_kind
, credit_purpose
, income_evidence
, repayment_kind
to scoring_user;

grant select, insert, update on table
  contract
, contract_draft
, contract_history
to scoring_user;

grant select, insert, update on table
  credit_kind
, credit_purpose
, income_evidence
, repayment_kind
to scoring_administrator;

