----------------------------------
----------------------------------
-- Table: nz_locality
----------------------------------
----------------------------------

CREATE TABLE IF NOT EXISTS admin_bdys.nz_locality
(
  id integer NOT NULL,
  parent_id numeric(10,0),
  suburb_4th character varying(60),
  suburb_3rd character varying(60),
  suburb_2nd character varying(60),
  suburb_1st character varying(60),
  type_order numeric(10,0),
  type character varying(12),
  city_id numeric(10,0),
  city_name character varying(60),
  has_addres character varying(1),
  start_date date,
  end_date date,
  major_id numeric(10,0),
  major_name character varying(80),
  shape geometry(MultiPolygon,4167),
  CONSTRAINT nz_locality_pkey PRIMARY KEY (id)
);

DROP INDEX IF EXISTS admin_bdys.nz_locality_shape_geom_idx; 

-- CREATE INDEX IF NOT EXISTS nz_locality_shape_geom_idx -- introduced in 9.5
CREATE INDEX nz_locality_shape_geom_idx
  ON admin_bdys.nz_locality
  USING gist
  (shape);

-- Trigger: admin_bdys_nz_locality_revision_trg on admin_bdys.nz_locality
--DROP TRIGGER IF EXISTS admin_bdys_nz_locality_revision_trg ON admin_bdys.nz_locality;

-- CREATE TRIGGER admin_bdys_nz_locality_revision_trg
--   AFTER INSERT OR UPDATE OR DELETE
--   ON admin_bdys.nz_locality
--   FOR EACH ROW
--   EXECUTE PROCEDURE table_version.admin_bdys_nz_locality_revision();

