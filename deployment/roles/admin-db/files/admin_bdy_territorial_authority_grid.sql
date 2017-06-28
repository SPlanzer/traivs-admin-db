----------------------------------
----------------------------------
-- Table: territorial_authority_grid
----------------------------------
----------------------------------

CREATE TABLE IF NOT EXISTS admin_bdys.territorial_authority_grid
(
  id integer NOT NULL,
  territorial_authority_ogc_fid integer NOT NULL,
  geom geometry(MultiPolygon,4167),
  CONSTRAINT territorial_authority_grid_pkey PRIMARY KEY (id)
);

-- Index idx_territorial_authority_shape
DROP INDEX IF EXISTS admin_bdys.idx_territorial_authority_shape; 

--CREATE INDEX IF NOT EXISTS idx_territorial_authority_shape -- IF NOT EXISTS introduced in 9.5
CREATE INDEX idx_territorial_authority_shape
  ON admin_bdys.territorial_authority_grid
  USING gist
  (geom);

