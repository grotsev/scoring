create domain person as uuid
	default uuid_generate_v4()
;

comment on domain person is 'Legal or natural person unique to the best of our knowledge';

