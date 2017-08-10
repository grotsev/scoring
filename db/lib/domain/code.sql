create domain code as text
  check (value ~ '^[_A-Z][_A-Z0-9]{0,31}$');

comment on domain code is
  'Domain specific constant like enum strictly formatted for wide use';
