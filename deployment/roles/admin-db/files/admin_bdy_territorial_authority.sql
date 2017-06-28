----------------------------------
----------------------------------
-- Table: territorial_authority
----------------------------------
----------------------------------

CREATE TABLE IF NOT EXISTS admin_bdys.territorial_authority
(
  ogc_fid SERIAL,
  shape geometry,
  name character varying(100),
  PRIMARY KEY (ogc_fid),
  CONSTRAINT enforce_dims_shape CHECK (st_ndims(shape) = 2),
  CONSTRAINT enforce_geotype_shape CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL),
  CONSTRAINT enforce_srid_shape CHECK (st_srid(shape) = 4167)
);

DROP INDEX IF EXISTS admin_bdys.territorial_authority_shape_geom_idx; 
--CREATE INDEX IF NOT EXISTS territorial_authority_shape_geom_idx -- IF NOT EXISTS introduced in 9.5
CREATE INDEX territorial_authority_shape_geom_idx
  ON admin_bdys.territorial_authority
  USING gist
  (shape);

