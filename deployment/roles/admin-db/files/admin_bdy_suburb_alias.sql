----------------------------------
----------------------------------
-- Table: suburb_alias
----------------------------------
----------------------------------

CREATE TABLE IF NOT EXISTS admin_bdys.suburb_alias
(
  locality_id integer,
  alias_name character varying,
  alias_type character varying
);

DROP INDEX IF EXISTS admin_bdys.suburb_alias_locality_id_idx; 

--CREATE INDEX IF NOT EXISTS suburb_alias_locality_id_idx -- introduced in 9.5
CREATE INDEX suburb_alias_locality_id_idx
  ON admin_bdys.suburb_alias
  USING btree
  (locality_id);

