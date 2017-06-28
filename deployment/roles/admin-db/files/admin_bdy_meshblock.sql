----------------------------------
----------------------------------
-- Table: meshblock
----------------------------------
----------------------------------

CREATE TABLE IF NOT EXISTS admin_bdys.meshblock
(
  shape geometry(MultiPolygon,4167),
  code character varying(10) NOT NULL,
  CONSTRAINT meshblock_pkey PRIMARY KEY (code)
);

DROP INDEX IF EXISTS admin_bdys.meshblock_shape_geom_idx;

--CREATE INDEX IF NOT EXISTS meshblock_shape_geom_idx -- introduced in 9.5
CREATE INDEX meshblock_shape_geom_idx
  ON admin_bdys.meshblock
  USING gist
  (shape);

-- Trigger: admin_bdys_meshblock_revision_trg on admin_bdys.meshblock
-- DROP TRIGGER IF EXISTS admin_bdys_meshblock_revision_trg ON admin_bdys.meshblock;

-- CREATE TRIGGER admin_bdys_meshblock_revision_trg
--   AFTER INSERT OR UPDATE OR DELETE
--   ON admin_bdys.meshblock
--   FOR EACH ROW
--   EXECUTE PROCEDURE table_version.admin_bdys_meshblock_revision();

