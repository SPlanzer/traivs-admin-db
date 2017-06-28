----------------------------------
----------------------------------
-- Table: meshblock_concordance
----------------------------------
----------------------------------

CREATE TABLE IF NOT EXISTS admin_bdys.meshblock_concordance
(
  ogc_fid serial NOT NULL,
  objectid character varying,
  meshblock character varying,
  ta character varying,
  "ta ward" character varying,
  "community board" character varying,
  "ta subdivision" character varying,
  "ta maori_ward" character varying,
  region character varying,
  "region constituency" character varying,
  "region maori constituency" character varying,
  dhb character varying,
  "dhb constituency" character varying,
  "ged 2007" character varying,
  "med 2007" character varying,
  "high court" character varying,
  "district court" character varying,
  ged character varying,
  med character varying,
  "licensing trust ward" character varying,
  CONSTRAINT meshblock_concordance_pkey PRIMARY KEY (ogc_fid)
);

