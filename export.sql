--- alter session set "_ORACLE_SCRIPT"=true;

--1. Crear un tablespace llamado "MID_TERM" con un datafile de 50M (0.3)
CREATE TABLESPACE MID_TERM
DATAFILE 'MID_TERM_01' SIZE 50M

--2. Crear un usuario con la letra de su primer nombre y el apellido (Ejemplo: amartinez)
--(Con este usuario usted deberá CREAR todas las cosas que se piden a continuación) (0.3)
CREATE USER jballesteros 
IDENTIFIED BY jballesteros
DEFAULT TABLESPACE MID_TERM
QUOTA UNLIMITED ON MID_TERM

GRANT CREATE SESSION TO jballesteros
GRANT DBA to jballesteros


-----CREATE ROLE parcial
IDENTIFIED BY parcial


GRANT CREATE table to parcial
GRANT CREATE SEQUENCE TO parcial

--4. Asignar el rol creado al usuario creado en el punto 2. (0.1)
ALTER USER jballesteros 
DEFAULT ROLE parcial

--5.1 La secuencia de departamentos deberá iniciar en 22 y dar saltos de 1

CREATE SEQUENCE departmento_seq
INCREMENT BY 1
START WITH 22 MAXVALUE 1000
--5.2 La secuencia de municipios deberá iniciar en 89 y dar saltos de 1

CREATE SEQUENCE municipio_seq
INCREMENT BY 1
START WITH 89 MAXVALUE 1000
--5.3 La secuencia de proyectos deberá iniciar en 40 y dar saltos de 1
CREATE SEQUENCE proyectos_seq
INCREMENT BY 1
START WITH 40 MAXVALUE 1000


--5.4 La secuencia de peajes deberá iniciar en 101 y dar saltos de 1
CREATE SEQUENCE peajes_seq
INCREMENT BY 1
START WITH 101 MAXVALUE 1000


--5.5 Crear las cuatro tablas propuestas (proyectos, peajes, municipios y departamentos) y 
--Agregar las claves primarias a todas las tablas propuestas

CREATE TABLE departamentos (id integer primary key, nombre varchar2(255))
CREATE TABLE municipios (id integer primary key,departmento_id integer, nombre varchar2(255))
CREATE TABLE proyectos (id integer primary key, nombre varchar2(255))
CREATE TABLE peajes (id integer primary key, municipio_id integer, proyecto_id integer, nombre_estacion_peaje varchar2(255), fecha_ultimo_cambio_tarifa date,
tarifa_plena_i number(19,4), tarifa_plena_ii number(19,4), tarifa_plena_iii number(19,4), tarifa_plena_iv number(19,4), 
tarifa_plena_v number(19,4), tarifa_plena_vi number(19,4), tarifa_plena_vii number(19,4), tarifa_plena_viii number(19,4), 
tarifa_plena_ix number(19,4), tarifa_plena_ie10 number(19,4), tarifa_plena_iee number(19,4), tarifa_plena_ieee number(19,4), 
tarifa_plena_iia number(19,4), tarifa_plena_ea number(19,4), tarifa_plena_eg number(19,4), tarifa_plena_er number(19,4), 
tarifa_plena_ec number(19,4), tarifa_especial_i number(19,4), tarifa_especial_ii number(19,4), tarifa_especial_iii number(19,4), 
tarifa_especial_iv number(19,4), tarifa_especial_v number(19,4), tarifa_especial_vi number(19,4), tarifa_especial_vii number(19,4), 
tarifa_especial_viii number(19,4), tarifa_especial_ix number(19,4), tarifa_especial_ie10 number(19,4), tarifa_especial_iee number(19,4),
tarifa_especial_ieee number(19,4), tarifa_especial_iia number(19,4), tarifa_especial_ea number(19,4), tarifa_especial_eg number(19,4), 
tarifa_especial_er number(19,4), tarifa_especial_ec number(19,4))

--7. agregar las claves foráneas para todas las tablas que tengan una (Usted es libre de colocar el nombre) 

ALTER TABLE municipios
ADD CONSTRAINT  departamento_id_fk
FOREIGN KEY (departmento_id)
REFERENCES departamentos (id)


ALTER TABLE peajes
ADD CONSTRAINT  peajes_municipios_id_fk
FOREIGN KEY (municipio_id)
REFERENCES municipios (id)

ALTER TABLE peajes
ADD CONSTRAINT  peajes_proyectos_id_fk
FOREIGN KEY (proyecto_id)
REFERENCES proyectos (id)


--8.1 Las columnas llamadas nombre no podrán aceptar valores NULL
ALTER TABLE departamentos
MODIFY nombre varchar2(255) NOT NULL

ALTER TABLE municipios
MODIFY nombre varchar2(255) NOT NULL


ALTER TABLE proyectos
MODIFY nombre varchar2(255) NOT NULL


ALTER TABLE peajes
MODIFY nombre_estacion_peaje varchar2(255) NOT NULL

-- 8.2 La columna tarifa_plena_i deberá tener una restricción en la cual acepte valores iguales o mayores a cero.

ALTER TABLE peajes
ADD CONSTRAINT CK_tarifa_plena_peajes
 check (tarifa_plena_i>=0 )



--------------------------------------------------------
-- Archivo creado  - miÃ©rcoles-abril-24-2019   
--------------------------------------------------------
DROP TYPE "SYSTEM"."LOGMNR$COL_GG_REC";
DROP TYPE "SYSTEM"."LOGMNR$COL_GG_RECS";
DROP TYPE "SYSTEM"."LOGMNR$GSBA_GG_REC";
DROP TYPE "SYSTEM"."LOGMNR$GSBA_GG_RECS";
DROP TYPE "SYSTEM"."LOGMNR$KEY_GG_REC";
DROP TYPE "SYSTEM"."LOGMNR$KEY_GG_RECS";
DROP TYPE "SYSTEM"."LOGMNR$SEQ_GG_REC";
DROP TYPE "SYSTEM"."LOGMNR$SEQ_GG_RECS";
DROP TYPE "SYSTEM"."LOGMNR$TAB_GG_REC";
DROP TYPE "SYSTEM"."LOGMNR$TAB_GG_RECS";
DROP TYPE "SYSTEM"."LOGMNR$USER_GG_REC";
DROP TYPE "SYSTEM"."LOGMNR$USER_GG_RECS";
DROP SEQUENCE "JBALLESTEROS"."DEPARTMENTO_SEQ";
DROP SEQUENCE "JBALLESTEROS"."MUNICIPIO_SEQ";
DROP SEQUENCE "JBALLESTEROS"."PEAJES_SEQ";
DROP SEQUENCE "JBALLESTEROS"."PROYECTOS_SEQ";
DROP TABLE "JBALLESTEROS"."DEPARTAMENTOS";
DROP TABLE "JBALLESTEROS"."MUNICIPIOS";
DROP TABLE "JBALLESTEROS"."PEAJES";
DROP TABLE "JBALLESTEROS"."PROYECTOS";
DROP VIEW "SYSTEM"."MVIEW_EVALUATIONS";
DROP VIEW "SYSTEM"."MVIEW_EXCEPTIONS";
DROP VIEW "SYSTEM"."MVIEW_FILTER";
DROP VIEW "SYSTEM"."MVIEW_FILTERINSTANCE";
DROP VIEW "SYSTEM"."MVIEW_LOG";
DROP VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS";
DROP VIEW "SYSTEM"."MVIEW_WORKLOAD";
DROP VIEW "SYSTEM"."PRODUCT_PRIVS";
DROP VIEW "SYSTEM"."SCHEDULER_JOB_ARGS";
DROP VIEW "SYSTEM"."SCHEDULER_PROGRAM_ARGS";
DROP FUNCTION "SYSTEM"."LOGMNR$COL_GG_TABF_PUBLIC";
DROP FUNCTION "SYSTEM"."LOGMNR$GSBA_GG_TABF_PUBLIC";
DROP FUNCTION "SYSTEM"."LOGMNR$KEY_GG_TABF_PUBLIC";
DROP FUNCTION "SYSTEM"."LOGMNR$SEQ_GG_TABF_PUBLIC";
DROP FUNCTION "SYSTEM"."LOGMNR$TAB_GG_TABF_PUBLIC";
DROP FUNCTION "SYSTEM"."LOGMNR$USER_GG_TABF_PUBLIC";
DROP SYNONYM "SYSTEM"."CATALOG";
DROP SYNONYM "SYSTEM"."COL";
DROP SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE";
DROP SYNONYM "SYSTEM"."PUBLICSYN";
DROP SYNONYM "SYSTEM"."SYSCATALOG";
DROP SYNONYM "SYSTEM"."SYSFILES";
DROP SYNONYM "SYSTEM"."TAB";
DROP SYNONYM "SYSTEM"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Type LOGMNR$COL_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$COL_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
MD_COL_NAME VARCHAR2(384),
MD_COL_NUM NUMBER,                 /* col# */
MD_COL_SEGCOL NUMBER,              /* segcol# */
MD_COL_TYPE NUMBER,                /* type# */
MD_COL_LEN NUMBER,
MD_COL_PREC NUMBER,                /* precision */
MD_COL_SCALE NUMBER,
MD_COL_CHARSETID NUMBER,           /* character set id */
MD_COL_CHARSETFORM NUMBER,         /* character set form */
MD_COL_ALT_TYPE VARCHAR2(4000),    /* adt type if any */
MD_COL_ALT_PREC NUMBER,            /* precision of the adt attribute */
MD_COL_ALT_CHAR_USED VARCHAR2(2),  /* charset used by the adt attribute */
MD_COL_ALT_LENGTH NUMBER,          /* length of the adt attribute */
MD_COL_ALT_XML_TYPE NUMBER,        /* 0/1. is xml_type column */
MD_COL_ALT_BINARYXML_TYPE NUMBER,  /* 0/1. is xml_type stored as binary */
MD_COL_ENC_ISENC VARCHAR2(3) ,     /* 'YES'/'NO' */
MD_COL_ENC_NOSALT VARCHAR2(3) ,    /* 'YES'/'NO' */
MD_COL_ENC_ISLOB VARCHAR2(3) ,     /* 'YES'/'NO' */
MD_COL_ALT_OBJECTXML_TYPE NUMBER,  /* 0/1 xml_type stored as object */
MD_COL_HASNOTNULLDEFAULT VARCHAR2(3) ,   /* 'YES'/'NO' */
MD_COL_ALT_TYPE_OWNER VARCHAR2(384),  /* owner of the adt type if any */
PROPERTY NUMBER,
XCOLTYPEFLAGS NUMBER,
XOPQTYPEFLAGS NUMBER,
EAFLAGS NUMBER,
XFQCOLNAME VARCHAR2(4000),
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000),
/* Following fields added in 12.1.0.2 */
OBJV# NUMBER,
INTCOL# NUMBER,
INTERVAL_LEADING_PRECISION NUMBER,
INTERVAL_TRAILING_PRECISION NUMBER,
TOID RAW(16),
TYPENAME VARCHAR2(384),
NUMINTCOLS NUMBER,
NUMATTRS NUMBER,
ADTORDER NUMBER,
LOGMNR_SPARE1 NUMBER,
LOGMNR_SPARE2 NUMBER,
LOGMNR_SPARE3 VARCHAR2(1000),
LOGMNR_SPARE4 DATE,
LOGMNR_SPARE5 NUMBER,
LOGMNR_SPARE6 NUMBER,
LOGMNR_SPARE7 NUMBER,
LOGMNR_SPARE8 NUMBER,
LOGMNR_SPARE9 NUMBER,
XTYPENAME VARCHAR2(4000),
XTOPINTCOL NUMBER,
XREFFEDTABLEOBJN NUMBER,
XREFFEDTABLEOBJV NUMBER,
XOPQTYPETYPE NUMBER,
XOPQLOBINTCOL NUMBER,
XOPQOBJINTCOL NUMBER,
XXMLINTCOL    NUMBER,
LOGMNRDERIVEDFLAGS NUMBER,
/* Following fields added in 12.2 */
COLLID      NUMBER,
COLLINTCOL#  NUMBER,
ACDRRESCOL# NUMBER
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$COL_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$COL_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$COL_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$GSBA_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$GSBA_GG_REC" AS OBJECT
(
LOGMNR_UID NUMBER,
NAME           VARCHAR2(384),
VALUE          VARCHAR2(4000),
LOGMNR_SPARE1  NUMBER,
LOGMNR_SPARE2  NUMBER,
LOGMNR_SPARE3  VARCHAR2(4000),
LOGMNR_SPARE4  DATE
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$GSBA_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$GSBA_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$GSBA_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$KEY_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$KEY_GG_REC" as object
(
LOGMNR_UID NUMBER,
KEY# NUMBER,                   /* index obj# or con# */
KEY_FLAGS NUMBER,              /* index or constraint */
KEY_NAME VARCHAR2(384),        /* index name or constraint name */
INDEX_OWNER# NUMBER,
INDEX_OWNERNAME VARCHAR2(384),
COLNAME VARCHAR2(384),
INTCOL# NUMBER,
which number,
KEY_ORDER VARCHAR2(10),              /* asc or desc */
KEYCOL_FLAGS NUMBER,           /* Column properties such as is_null */
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$KEY_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$KEY_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$KEY_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$SEQ_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$SEQ_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
NAME VARCHAR2(384),
OWNER# NUMBER,
OWNERNAME VARCHAR2(384),
FLAGS NUMBER,
MD_TAB_SEQCACHE NUMBER,
MD_TAB_SEQINCREMENTBY NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$SEQ_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$SEQ_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$SEQ_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$TAB_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$TAB_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
BASEOBJV# NUMBER,
MD_TAB_USERID NUMBER,                /* owner# */
MD_TAB_COLCOUNT NUMBER,              /* user column count */
MD_TAB_TOTAL_COL_NUM NUMBER,         /* kernal column count */
MD_TAB_LOG_GROUP_EXISTS NUMBER,      /* Any log group exists for this table */
MD_TAB_IOT VARCHAR2(3) ,             /* 'YES'/'NO' IS IOT? */
MD_TAB_IOT_OVERFLOW VARCHAR2(3) ,    /* 'YES'/'NO' IOT with overflow ? */
MD_TAB_PARTITION  VARCHAR2(3) ,      /* 'YES'/'NO' is partitioned ? */
MD_TAB_SUBPARTITION VARCHAR2(3) ,    /* 'YES'/'NO' is sub partitioned? */
MD_TAB_XMLTYPETABLE VARCHAR2(3) ,    /* 'YES'/'NO' is xmltype table? */
MD_TAB_OBJECTID NUMBER,              /* object id if table object */
MD_TAB_OWNER VARCHAR2(384),     /* owner name */
MD_TAB_NAME VARCHAR2(384),      /* table name */
MD_TAB_OBJTYPE VARCHAR2(384),   /* Object type name */
MD_TAB_SCN NUMBER,                   /* COMMIT_SCN of this table version */
TAB_FLAGS NUMBER,
TRIGFLAG NUMBER,
OBJ_FLAGS NUMBER,
PROPERTY NUMBER,
PARTTYPE NUMBER,
SUBPARTTYPE NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000),
/* Following fields added in 12.1.0.2 */
LVLCNT NUMBER,
LVL1OBJ# NUMBER,
LVL2OBJ# NUMBER,
LVL1TYPE# NUMBER,
LVL2TYPE# NUMBER,
LVL1NAME  VARCHAR2(384),
LVL2NAME  VARCHAR2(384),
INTCOLS   NUMBER,
ASSOC#    NUMBER,
XIDUSN    NUMBER,
XIDSLT    NUMBER,
XIDSQN    NUMBER,
DROP_SCN  NUMBER,
FLAGS     NUMBER,
LOGMNR_SPARE1   NUMBER,
LOGMNR_SPARE2   NUMBER,
LOGMNR_SPARE3   VARCHAR2(1000),
LOGMNR_SPARE4   DATE,
LOGMNR_SPARE5   NUMBER,
LOGMNR_SPARE6   NUMBER,
LOGMNR_SPARE7   NUMBER,
LOGMNR_SPARE8   NUMBER,
LOGMNR_SPARE9   NUMBER,
UNSUPPORTEDCOLS  NUMBER,
COMPLEXTYPECOLS  NUMBER,
NTPARENTOBJNUM   NUMBER,
NTPARENTOBJVERSION NUMBER,
NTPARENTINTCOLNUM  NUMBER,
LOGMNRTLOFLAGS    NUMBER,
LOGMNRMCV VARCHAR2(30),
/* Following fields added in 12.2 */
ACDRFLAGS        NUMBER,                                    /* automatic CDR */
ACDRTSOBJ#       NUMBER,                                    /* automatic CDR */
ACDRROWTSINTCOL# NUMBER                                     /* automatic CDR */
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$TAB_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$TAB_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$TAB_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$USER_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$USER_GG_REC" AS OBJECT
(
LOGMNR_UID     NUMBER,
USERNAME       VARCHAR2(384),
USERID         NUMBER,
LOGMNR_SPARE1  NUMBER,
LOGMNR_SPARE2  NUMBER,
LOGMNR_SPARE3  VARCHAR2(4000),
LOGMNR_SPARE4  DATE
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$USER_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$USER_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$USER_GG_REC;

/
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JBALLESTEROS"."DEPARTMENTO_SEQ"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 22 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MUNICIPIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JBALLESTEROS"."MUNICIPIO_SEQ"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 89 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PEAJES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JBALLESTEROS"."PEAJES_SEQ"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PROYECTOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JBALLESTEROS"."PROYECTOS_SEQ"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 40 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table DEPARTAMENTOS
--------------------------------------------------------

  CREATE TABLE "JBALLESTEROS"."DEPARTAMENTOS" SHARING=METADATA 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MUNICIPIOS
--------------------------------------------------------

  CREATE TABLE "JBALLESTEROS"."MUNICIPIOS" SHARING=METADATA 
   (	"ID" NUMBER(*,0), 
	"DEPARTMENTO_ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table PEAJES
--------------------------------------------------------

  CREATE TABLE "JBALLESTEROS"."PEAJES" SHARING=METADATA 
   (	"ID" NUMBER(*,0), 
	"MUNICIPIO_ID" NUMBER(*,0), 
	"PROYECTO_ID" NUMBER(*,0), 
	"NOMBRE_ESTACION_PEAJE" VARCHAR2(255), 
	"FECHA_ULTIMO_CAMBIO_TARIFA" DATE, 
	"TARIFA_PLENA_I" NUMBER(19,4), 
	"TARIFA_PLENA_II" NUMBER(19,4), 
	"TARIFA_PLENA_III" NUMBER(19,4), 
	"TARIFA_PLENA_IV" NUMBER(19,4), 
	"TARIFA_PLENA_V" NUMBER(19,4), 
	"TARIFA_PLENA_VI" NUMBER(19,4), 
	"TARIFA_PLENA_VII" NUMBER(19,4), 
	"TARIFA_PLENA_VIII" NUMBER(19,4), 
	"TARIFA_PLENA_IX" NUMBER(19,4), 
	"TARIFA_PLENA_IE10" NUMBER(19,4), 
	"TARIFA_PLENA_IEE" NUMBER(19,4), 
	"TARIFA_PLENA_IEEE" NUMBER(19,4), 
	"TARIFA_PLENA_IIA" NUMBER(19,4), 
	"TARIFA_PLENA_EA" NUMBER(19,4), 
	"TARIFA_PLENA_EG" NUMBER(19,4), 
	"TARIFA_PLENA_ER" NUMBER(19,4), 
	"TARIFA_PLENA_EC" NUMBER(19,4), 
	"TARIFA_ESPECIAL_I" NUMBER(19,4), 
	"TARIFA_ESPECIAL_II" NUMBER(19,4), 
	"TARIFA_ESPECIAL_III" NUMBER(19,4), 
	"TARIFA_ESPECIAL_IV" NUMBER(19,4), 
	"TARIFA_ESPECIAL_V" NUMBER(19,4), 
	"TARIFA_ESPECIAL_VI" NUMBER(19,4), 
	"TARIFA_ESPECIAL_VII" NUMBER(19,4), 
	"TARIFA_ESPECIAL_VIII" NUMBER(19,4), 
	"TARIFA_ESPECIAL_IX" NUMBER(19,4), 
	"TARIFA_ESPECIAL_IE10" NUMBER(19,4), 
	"TARIFA_ESPECIAL_IEE" NUMBER(19,4), 
	"TARIFA_ESPECIAL_IEEE" NUMBER(19,4), 
	"TARIFA_ESPECIAL_IIA" NUMBER(19,4), 
	"TARIFA_ESPECIAL_EA" NUMBER(19,4), 
	"TARIFA_ESPECIAL_EG" NUMBER(19,4), 
	"TARIFA_ESPECIAL_ER" NUMBER(19,4), 
	"TARIFA_ESPECIAL_EC" NUMBER(19,4)
   ) ;
--------------------------------------------------------
--  DDL for Table PROYECTOS
--------------------------------------------------------

  CREATE TABLE "JBALLESTEROS"."PROYECTOS" SHARING=METADATA 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output'
;
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results'
;
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records'
;
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records'
;
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log'
;
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations'
;
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload'
;
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR
        USERID LIKE SYS_CONTEXT('USERENV','CURRENT_USER')
;
  GRANT READ ON "SYSTEM"."PRODUCT_PRIVS" TO PUBLIC;
--------------------------------------------------------
--  DDL for View SCHEDULER_JOB_ARGS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."SCHEDULER_JOB_ARGS" ("OWNER", "JOB_NAME", "ARGUMENT_NAME", "ARGUMENT_POSITION", "ARGUMENT_TYPE", "VALUE", "ANYDATA_VALUE", "OUT_ARGUMENT") AS 
  SELECT "OWNER","JOB_NAME","ARGUMENT_NAME","ARGUMENT_POSITION","ARGUMENT_TYPE","VALUE","ANYDATA_VALUE","OUT_ARGUMENT" FROM sys.all_scheduler_job_args
;
  GRANT SELECT ON "SYSTEM"."SCHEDULER_JOB_ARGS" TO "SELECT_CATALOG_ROLE";
--------------------------------------------------------
--  DDL for View SCHEDULER_PROGRAM_ARGS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "SYSTEM"."SCHEDULER_PROGRAM_ARGS" ("OWNER", "PROGRAM_NAME", "ARGUMENT_NAME", "ARGUMENT_POSITION", "ARGUMENT_TYPE", "METADATA_ATTRIBUTE", "DEFAULT_VALUE", "DEFAULT_ANYDATA_VALUE", "OUT_ARGUMENT") AS 
  SELECT "OWNER","PROGRAM_NAME","ARGUMENT_NAME","ARGUMENT_POSITION","ARGUMENT_TYPE","METADATA_ATTRIBUTE","DEFAULT_VALUE","DEFAULT_ANYDATA_VALUE","OUT_ARGUMENT" FROM sys.all_scheduler_program_args
;
  GRANT SELECT ON "SYSTEM"."SCHEDULER_PROGRAM_ARGS" TO "SELECT_CATALOG_ROLE";
REM INSERTING into JBALLESTEROS.DEPARTAMENTOS
SET DEFINE OFF;
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('1','QUINDÃƒï¿½O');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('2','VALLE DEL CAUCA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('3','CALDAS');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('4','RISARALDA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('5','CUNDINAMARCA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('6','META');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('7','BOLÃƒï¿½VAR');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('8','ATLÃƒï¿½NTICO');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('9','ANTIOQUIA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('10','LA GUAJIRA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('11','MAGDALENA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('12','NORTE DE SANTANDER');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('13','BOYACÃƒï¿½');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('14','SUCRE');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('15','CÃƒâ€œRDOBA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('16','TOLIMA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('17','CESAR');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('18','SANTANDER');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('19','HUILA');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('20','NARIÃƒâ€˜O');
Insert into JBALLESTEROS.DEPARTAMENTOS (ID,NOMBRE) values ('21','CASANARE');
REM INSERTING into JBALLESTEROS.MUNICIPIOS
SET DEFINE OFF;
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('1','1','FILANDIA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('2','2','SEVILLA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('3','3','MANIZALES');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('4','3','CHINCHINÃƒï¿½');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('5','4','SANTA ROSA DE CABAL');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('6','5','NOCAIMA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('7','5','TENJO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('8','5','CHIPAQUE');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('9','5','QUETAME');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('10','6','VILLAVICENCIO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('11','7','CARTAGENA DE INDIAS');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('12','8','BARRANQUILLA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('13','9','COPACABANA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('14','9','ENVIGADO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('15','5','MADRID');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('16','5','FUNZA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('17','10','MANAURE');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('18','10','RIOHACHA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('19','11','SANTA MARTA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('20','10','MAICAO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('21','12','SAN JOSÃƒâ€° DE CÃƒÅ¡CUTA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('22','12','VILLA DEL ROSARIO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('23','12','LOS PATIOS');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('24','5','VILLAPINZÃƒâ€œN');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('25','5','SESQUILÃƒâ€°');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('26','13','CÃƒâ€œMBITA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('27','14','TOLÃƒÅ¡ VIEJO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('28','14','MORROA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('29','15','CERETÃƒâ€°');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('30','15','MONTERÃƒï¿½A');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('31','16','FLANDES');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('32','16','IBAGUÃƒâ€°');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('33','4','PEREIRA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('34','7','CLEMENCIA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('35','8','BARANOA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('36','7','ARJONA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('37','7','TURBANÃƒï¿½');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('38','8','SABANAGRANDE');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('39','7','TURBACO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('40','5','PUERTO SALGAR');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('41','17','EL COPEY');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('42','11','PLATO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('43','17','EL PASO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('44','11','ARACATACA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('45','17','VALLEDUPAR');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('46','9','TURBO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('47','9','CALDAS');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('48','9','LA PINTADA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('49','9','SANTA BÃƒï¿½RBARA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('50','3','BELALCÃƒï¿½ZAR');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('51','3','SUPÃƒï¿½A');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('52','9','PUERTO BERRÃƒï¿½O');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('53','18','BETULIA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('54','18','PIEDECUESTA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('55','8','GALAPA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('56','9','MEDELLÃƒï¿½N');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('57','5','SAN JUAN DE RIOSECO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('58','5','GUATAQUÃƒï¿½');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('59','5','CHÃƒï¿½A');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('60','14','SANTIAGO DE TOLÃƒÅ¡');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('61','15','LA APARTADA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('62','15','PLANETA RICA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('63','15','LORICA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('64','15','SAN CARLOS');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('65','14','SAN ONOFRE');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('66','16','ALVARADO');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('67','16','HONDA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('68','6','PUERTO LÃƒâ€œPEZ');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('69','6','GRANADA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('70','6','ACACÃƒï¿½AS');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('71','6','PUERTO GAITÃƒï¿½N');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('72','19','AIPE');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('73','16','ESPINAL');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('74','19','NEIVA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('75','5','FUSAGASUGÃƒï¿½');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('76','5','GRANADA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('77','2','DAGUA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('78','9','CISNEROS');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('79','5','SOPÃƒâ€œ');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('80','5','LA CALERA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('81','7','CALAMAR');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('82','7','EL CARMEN DE BOLÃƒï¿½VAR');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('83','20','TANGUA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('84','19','ALTAMIRA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('85','19','RIVERA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('86','5','MACHETÃƒï¿½');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('87','21','VILLANUEVA');
Insert into JBALLESTEROS.MUNICIPIOS (ID,DEPARTMENTO_ID,NOMBRE) values ('88','6','CUMARAL');
REM INSERTING into JBALLESTEROS.PEAJES
SET DEFINE OFF;
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('100','88','39','VERACRUZ',to_date('16/01/19','DD/MM/RR'),'6700','13500','8700','13500','19400','26000','29100','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('1','1','1','CIRCASIA',to_date('16/01/19','DD/MM/RR'),'13800','17600','17600','17600','42900','52600','58600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('2','2','1','COROZAL',to_date('16/01/19','DD/MM/RR'),'10400','12600','12600','12600','30700','38400','44600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('3','3','1','PAVAS',to_date('16/01/19','DD/MM/RR'),'10400','12600','12600','12600','30700','38400','44600','0','0','0','0','0','0','0','0','0','0','0','3300','3700','3900','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('4','3','1','SAN BERNARDO',to_date('16/01/19','DD/MM/RR'),'10400','12600','12600','12600','30700','38400','44600','0','0','0','0','0','0','0','0','0','0','0','3300','3700','3900','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('5','3','1','SANTÃƒï¿½GUEDA',to_date('16/01/19','DD/MM/RR'),'10400','12600','12600','12600','30700','38400','44600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('6','4','1','TARAPACÃƒï¿½ I',to_date('16/01/19','DD/MM/RR'),'11500','15200','15200','15200','38100','50400','56300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('7','5','1','TARAPACÃƒï¿½ II',to_date('16/01/19','DD/MM/RR'),'11500','15200','15200','15200','38100','50400','56300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('8','6','2','CAIQUERO',to_date('16/01/19','DD/MM/RR'),'9300','12100','30000','36100','41500','0','0','0','0','0','0','0','0','9300','6500','8900','0','2200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('9','7','2','SIBERIA',to_date('16/01/19','DD/MM/RR'),'10000','14300','12000','16000','28100','37700','41400','0','0','0','0','0','0','0','0','0','0','5700','8200','6700','9200','0','0','0','5200','7200','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('10','8','3','BOQUERÃƒâ€œN I',to_date('16/11/18','DD/MM/RR'),'11900','35300','17800','47100','52900','58800','70500','0','0','0','0','0','0','0','0','0','0','400','11500','400','0','0','0','0','0','0','0','1600','6100','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('11','8','3','BOQUERÃƒâ€œN II',to_date('16/11/18','DD/MM/RR'),'11900','35300','17800','47100','52900','58800','70500','0','0','0','0','0','0','0','0','0','0','400','11500','400','0','0','0','0','0','0','0','1600','6100','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('12','9','3','NARANJAL',to_date('16/11/18','DD/MM/RR'),'10200','26600','20100','39400','45900','52900','58800','0','0','0','0','0','0','0','0','0','0','500','500','500','500','500','0','0','0','0','0','500','500','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('13','10','3','PIPIRAL',to_date('16/11/18','DD/MM/RR'),'16600','33000','22500','39400','43000','65800','85100','0','0','0','0','0','0','0','0','0','0','3400','0','0','0','0','0','0','0','0','0','3400','3400','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('14','11','4','MARAHUACO',to_date('16/01/19','DD/MM/RR'),'11300','17200','12300','21800','68700','91800','101900','0','0','0','0','0','0','0','0','0','0','7100','8500','7500','8700','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('15','12','4','PAPIROS',to_date('16/01/19','DD/MM/RR'),'4800','5700','11400','20200','63600','85000','94400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('16','12','4','PUERTO COLOMBIA',to_date('16/01/19','DD/MM/RR'),'11300','17200','12300','21800','68700','91800','101900','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('17','13','5','GUARNE',to_date('01/01/19','DD/MM/RR'),'12000','20900','16700','20900','41600','59300','59300','0','0','0','0','0','0','0','0','0','0','9000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('18','14','5','LAS PALMAS',to_date('01/01/19','DD/MM/RR'),'8700','10500','10500','10500','23300','31400','35100','0','0','0','0','0','0','0','0','0','0','6500','200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('19','15','6','CORZO',to_date('06/01/19','DD/MM/RR'),'8000','12000','10400','13900','23600','31900','34500','0','0','0','0','0','0','0','0','0','0','200','200','200','200','200','200','200','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('20','16','6','RÃƒï¿½O BOGOTÃƒï¿½',to_date('06/01/19','DD/MM/RR'),'8000','12000','10400','13900','23600','31900','34500','0','0','0','0','0','0','0','0','0','0','200','200','200','200','200','200','200','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('21','17','7','ALTO PINO',to_date('16/01/19','DD/MM/RR'),'9600','14800','11900','18900','27700','44700','56400','0','0','0','0','0','0','0','0','0','0','5000','7500','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('22','18','7','EL EBANAL',to_date('16/01/19','DD/MM/RR'),'9600','14800','11900','18900','27700','44700','56400','0','0','0','0','0','0','0','0','0','0','5000','7500','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('23','19','7','NEGUANJE',to_date('16/01/19','DD/MM/RR'),'9600','14800','11900','18900','27700','44700','56400','0','0','0','0','0','0','0','0','0','0','5000','7500','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('24','20','7','PARAGUACHÃƒâ€œN',to_date('16/01/19','DD/MM/RR'),'9600','14800','11900','18900','27700','44700','56400','0','0','0','0','0','0','0','0','0','0','5000','3000','3000','3000','0','0','0','0','0','3000','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('25','21','8','EL ESCOBAL',null,'2000','2000','2000','2000','2000','0','0','0','0','0','0','0','0','2000','2000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('26','22','8','LA PARADA',null,'2000','2000','2000','2000','2000','0','0','0','0','0','0','0','0','2000','2000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('27','23','8','LOS ACACIOS',to_date('16/01/19','DD/MM/RR'),'6100','8700','19500','25100','28500','0','0','0','0','0','0','0','0','8800','6300','8500','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('28','24','9','ALBARRACÃƒï¿½N',to_date('15/01/19','DD/MM/RR'),'8000','8900','23000','28500','33500','0','0','0','0','0','0','0','0','8200','5700','6800','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('29','25','9','EL ROBLE',to_date('15/01/19','DD/MM/RR'),'8000','8900','23000','28500','33500','0','0','0','0','0','0','0','0','8200','5700','6800','0','4300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('30','26','9','TUTA',to_date('15/01/19','DD/MM/RR'),'8000','8900','23000','28500','33500','0','0','0','0','0','0','0','0','8200','5700','6800','0','3100','4300','4500','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('31','27','10','LA ESPERANZA',to_date('16/01/19','DD/MM/RR'),'8200','8900','19200','24300','27400','0','0','0','0','0','0','0','0','8700','6400','8400','0','2100','0',null,'0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('32','28','10','LAS FLORES',to_date('15/01/19','DD/MM/RR'),'4500','12000','18600','23600','27100','0','0','0','0','0','0','0','0','0','0','0','0','3000','4800','6300','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('33','29','10','LOS GARZONES 1',to_date('15/01/19','DD/MM/RR'),'4500','12000','18600','23600','27100','0','0','0','0','0','0','0','0','0','0','0','0','3000','4800','6300','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('34','30','10','LOS GARZONES 2',to_date('15/01/19','DD/MM/RR'),'4500','12000','18600','23600','27100','0','0','0','0','0','0','0','0','0','0','0','0','3000','4800','6300','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('35','31','11','CHICORAL',to_date('16/01/19','DD/MM/RR'),'10800','11800','10800','14100','28400','38000','41800','0','0','0','0','0','0','9700','6800','9500','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('36','32','11','GUALANDAY',to_date('16/01/19','DD/MM/RR'),'9800','11600','27600','37100','40900','0','0','0','0','0','0','0','0','9500','6400','9000','0','5700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('37','33','12','CERRITOS II',to_date('16/01/19','DD/MM/RR'),'12000','13800','34000','44600','51000','0','0','0','0','0','0','0','0','15200','10300','15000','0','2600','9000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('38','34','13','BAYUNCA',to_date('10/01/19','DD/MM/RR'),'8000','8900','19800','26400','30200','0','0','0','0','0','0','0','0','8700','6000','8400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('39','35','13','GALAPA',to_date('10/01/19','DD/MM/RR'),'8500','9200','19700','25300','28500','0','0','0','0','0','0','0','0','9000','6500','8700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('40','36','13','GAMBOTE',to_date('10/01/19','DD/MM/RR'),'8000','8900','19800','26400','30200','0','0','0','0','0','0','0','0','8700','6000','8400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('41','37','13','PASACABALLOS',to_date('10/01/19','DD/MM/RR'),'8100','8800','18700','24400','28300','28300','28300','0','0','0','0','0','0','0','0','0','0','3100','0','7600','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('42','38','13','SABANAGRANDE',to_date('10/01/19','DD/MM/RR'),'8500','9200','20200','26400','30500','0','0','0','0','0','0','0','0','8700','6000','8400','0','2600','3100','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('43','39','13','TURBACO',to_date('10/01/19','DD/MM/RR'),'3100','7600','9300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','3100','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('44','40','14','EL KORÃƒï¿½N',to_date('20/01/19','DD/MM/RR'),'12800','18000','25400','53100','66000','78300','0','0','0','0','0','0','0','9100','6500','8800','0','2800','2800','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('45','41','15','EL COPEY',to_date('20/01/19','DD/MM/RR'),'7900','8700','20300','26700','30900','0','0','0','0','0','0','0','0','9500','6500','9100','0','0','0','10300','13500','15600','0','0','0','0','0','0','0','0','4800','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('46','42','15','EL DIFÃƒï¿½CIL',to_date('20/01/19','DD/MM/RR'),'9200','11400','24100','34100','36600','0','0','0','0','0','0','0','0','9000','6500','8700','0','2700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('47','43','15','LA LOMA',to_date('20/01/19','DD/MM/RR'),'8100','9000','19500','25100','28500','0','0','0','0','0','0','0','0','9000','6500','8700','0','0','0','9900','12700','14400','0','0','0','0','0','0','0','0','4500','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('48','42','15','PUENTE PLATO',to_date('20/01/19','DD/MM/RR'),'9200','11400','24100','34100','36600','0','0','0','0','0','0','0','0','9000','6500','8700','0','2700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('49','44','15','TUCURINCA',to_date('20/01/19','DD/MM/RR'),'8500','9400','21900','28800','33400','0','0','0','0','0','0','0','0','10300','7000','9800','0','0','0','11100','14600','16800','0','0','0','0','0','0','0','0','5200','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('50','45','15','VALENCIA',to_date('20/01/19','DD/MM/RR'),'8100','9000','19500','25100','28500','0','0','0','0','0','0','0','0','9000','6500','8700','0','0','0','9900','12700','14400','0','0','0','0','0','0','0','0','4500','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('51','46','16','CIRILO',to_date('16/01/19','DD/MM/RR'),'8700','9500','9500','9500','19800','25500','28600','0','0','0','0','0','0','0','0','0','0','4200','6200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('52','47','17','AMAGÃƒï¿½',to_date('16/01/19','DD/MM/RR'),'8300','9000','19200','24400','27400','0','0','0','0','0','0','0','0','8700','6400','8400','6700','0','4200','9500','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('53','48','18','LA PINTADA',to_date('16/01/19','DD/MM/RR'),'8300','9000','19200','24400','27400','0','0','0','0','0','0','0','0','8700','6400','8400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('54','49','18','PRIMAVERA',to_date('16/01/19','DD/MM/RR'),'8300','9000','19200','24400','27400','0','0','0','0','0','0','0','0','8700','6400','8400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('55','50','19','ACAPULCO',to_date('16/01/19','DD/MM/RR'),'11400','14100','14100','14100','33800','42400','48900','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('56','51','19','SUPIA',to_date('16/01/19','DD/MM/RR'),'8300','9000','19200','24400','27400','0','0','0','0','0','0','0','0','8700','6400','8400','6700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('57','52','20','PUERTO BERRÃƒï¿½O',to_date('16/01/19','DD/MM/RR'),'8500','9300','19500','24800','27900','0','0','0','0','0','0','0','0','8700','6400','8400','0','2100','2300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('58','53','21','RIO SOGAMOSO',to_date('16/01/19','DD/MM/RR'),'8500','9300','19500','24800','27900','0','0','0','0','0','0','0','0','8700','6400','8400','0','2100','2300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('59','54','22','EL PICACHO',to_date('16/01/19','DD/MM/RR'),'8500','9300','19500','24800','27900','0','0','0','0','0','0','0','0','8700','6400','8400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('60','55','23','GALAPA',to_date('16/01/19','DD/MM/RR'),'12500','18800','13600','23900','74800','99700','110600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('61','56','24','PALMITAS',to_date('16/01/19','DD/MM/RR'),'16200','18300','39900','51900','62100','0','0','0','0','0','0','0','0','6300','0','0','0','8100','9200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('62','56','24','SAN CRISTOBAL',to_date('16/01/19','DD/MM/RR'),'16200','18300','39900','51900','62100','0','0','0','0','0','0','0','0','6300','0','0','0','8100','9200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('63','57','25','CAMBAO',to_date('16/01/19','DD/MM/RR'),'9900','14000','19200','25700','36400','59000','67400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('64','58','25','GUATAQUÃƒï¿½',to_date('21/01/19','DD/MM/RR'),'9900','14000','19200','25700','36400','59000','67400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('65','59','26','ANDES',to_date('16/01/19','DD/MM/RR'),'8700','15000','9600','21800','33100','42700','47300','0','0','0','0','0','0','0','0','0','0','0','14200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('66','59','26','FUSCA',to_date('16/01/19','DD/MM/RR'),'8700','15000','9600','21800','33100','42700','47300','0','0','0','0','0','0','0','0','0','0','0','14200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('67','59','26','UNISABANA',to_date('16/01/19','DD/MM/RR'),'0','0','0','0','33100','42700','47300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('68','60','27','CAIMANERA',to_date('16/01/19','DD/MM/RR'),'12300','18200','18200','18200','19500','28300','28400','0','0','0','0','0','0','0','0','0','0','700','700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('69','30','27','CEDROS',to_date('16/01/19','DD/MM/RR'),'12600','18600','18600','18600','33600','53600','61800','0','0','0','0','0','0','0','0','0','0','11300','15800','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('70','61','27','LA APARTADA',to_date('16/01/19','DD/MM/RR'),'12600','18600','18600','18600','33600','53600','61800','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('71','62','27','MANGUITOS',to_date('16/01/19','DD/MM/RR'),'12600','18600','18600','18600','33600','53600','61800','0','0','0','0','0','0','0','0','0','0','6400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('72','63','27','MATA DE CAÃƒâ€˜A',to_date('16/01/19','DD/MM/RR'),'12300','18200','18200','18200','19500','28300','28400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('73','30','27','PURGATORIO',to_date('16/01/19','DD/MM/RR'),'12600','18600','18600','18600','33600','53600','61800','0','0','0','0','0','0','0','0','0','0','11300','15700','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('74','64','27','SAN CARLOS',to_date('16/01/19','DD/MM/RR'),'12300','18200','18200','18200','19500','28300','28400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('75','65','27','SAN ONOFRE',to_date('16/01/19','DD/MM/RR'),'12600','18600','18600','18600','33600','53600','61800','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('76','66','28','ALVARADO',to_date('16/01/19','DD/MM/RR'),'10700','11400','11900','12400','26500','36200','39200','0','0','0','0','0','0','0','0','0','0','7400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('77','67','28','HONDA',to_date('16/01/19','DD/MM/RR'),'10700','11400','11900','12400','26500','36200','39200','0','0','0','0','0','0','0','0','0','0','5400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('78','68','29','CASETABLA',to_date('16/01/19','DD/MM/RR'),'4400','4800','4800','4800','19700','25000','28100','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('79','69','29','IRACÃƒï¿½',to_date('16/01/19','DD/MM/RR'),'9700','19400','13300','23300','34600','46000','50000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('80','10','29','LA LIBERTAD',to_date('16/01/19','DD/MM/RR'),'12700','25300','18300','30500','45400','59800','68500','0','0','0','0','0','0','0','0','0','0','6300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('81','70','29','OCOA',to_date('16/01/19','DD/MM/RR'),'9700','19400','13300','23300','34600','46000','50000','0','0','0','0','0','0','0','0','0','0','3600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('82','71','29','YUCAO',to_date('16/01/19','DD/MM/RR'),'4400','4800','4800','4800','19700','25000','28100','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('83','72','30','EL PATÃƒï¿½',to_date('16/01/19','DD/MM/RR'),'11700','14100','15800','20200','34400','44200','50100','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('84','73','30','FLANDES',to_date('16/01/19','DD/MM/RR'),'11700','13900','15600','19900','33300','42700','48600','0','0','0','0','0','0','0','0','0','0','7400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('85','74','30','NEIVA',to_date('16/01/19','DD/MM/RR'),'11700','13900','15600','19900','33300','42700','48600','0','0','0','0','0','0','0','0','0','0','5200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('86','75','31','CHINAUTA',to_date('16/01/19','DD/MM/RR'),'10300','11600','24800','40300','46300','0','0','0','0','0','0','0','0','9700','6400','9400','0','2600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('87','69','31','CHUSACA',to_date('16/01/19','DD/MM/RR'),'10300','11600','24800','40300','46300','0','0','0','0','0','0','0','0','9700','6400','9400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('88','77','32','LOBOGUERRERO',to_date('20/01/19','DD/MM/RR'),'8000','9000','21500','28200','32100','0','0','0','0','0','0','0','0','9800','6300','20800','6300','600','600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('89','78','33','CISNEROS',to_date('16/01/19','DD/MM/RR'),'8300','8900','8900','8900','18800','23900','27000','0','0','0','0','0','0','8700','6400','8400','0','1700','1900','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('90','79','34','LA CABAÃƒâ€˜A',to_date('16/01/19','DD/MM/RR'),'9600','15100','23400','34300','46900','47300','0','0','0','0','0','0','0','8700','6400','8400','6700','0','10300','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('91','80','34','PATIOS',to_date('16/01/19','DD/MM/RR'),'9600','15100','23400','34300','46900','47300','0','0','0','0','0','0','0','8700','6400','8400','6700','5100','10300','0','0','0','0','0','0','0','0','0','0','5400','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('92','81','35','CALAMAR',to_date('16/01/19','DD/MM/RR'),'8300','9000','19200','24400','27400','0','0','0','0','0','0','0','0','8700','6400','8400','0','2800','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('93','82','35','EL CARMEN',to_date('16/01/19','DD/MM/RR'),'8800','9600','20100','25600','28800','0','0','0','0','0','0','0','0','8700','6400','8400','0','1400','1400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('94','83','36','EL PLACER',to_date('16/01/19','DD/MM/RR'),'9900','10400','22100','28800','33200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('95','84','37','ALTAMIRA',to_date('16/01/19','DD/MM/RR'),'8500','9300','19500','24800','27900','0','0','0','0','0','0','0','0','8700','6400','8400','6700','2500','5400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('96','85','37','LOS CAUCHOS',to_date('16/01/19','DD/MM/RR'),'8300','9000','19200','24400','27400','0','0','0','0','0','0','0','0','8700','6400','8400','6700','5300','2200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('97','86','38','MACHETÃƒï¿½',to_date('16/01/19','DD/MM/RR'),'8500','9200','19500','24700','27700','0','0','0','0','0','0','0','0','8700','6400','8400','0','3900','4200','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('98','10','39','PUENTE AMARILLO',to_date('16/01/19','DD/MM/RR'),'3600','12500','7900','12500','17700','23700','26900','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
Insert into JBALLESTEROS.PEAJES (ID,MUNICIPIO_ID,PROYECTO_ID,NOMBRE_ESTACION_PEAJE,FECHA_ULTIMO_CAMBIO_TARIFA,TARIFA_PLENA_I,TARIFA_PLENA_II,TARIFA_PLENA_III,TARIFA_PLENA_IV,TARIFA_PLENA_V,TARIFA_PLENA_VI,TARIFA_PLENA_VII,TARIFA_PLENA_VIII,TARIFA_PLENA_IX,TARIFA_PLENA_IE10,TARIFA_PLENA_IEE,TARIFA_PLENA_IEEE,TARIFA_PLENA_IIA,TARIFA_PLENA_EA,TARIFA_PLENA_EG,TARIFA_PLENA_ER,TARIFA_PLENA_EC,TARIFA_ESPECIAL_I,TARIFA_ESPECIAL_II,TARIFA_ESPECIAL_III,TARIFA_ESPECIAL_IV,TARIFA_ESPECIAL_V,TARIFA_ESPECIAL_VI,TARIFA_ESPECIAL_VII,TARIFA_ESPECIAL_VIII,TARIFA_ESPECIAL_IX,TARIFA_ESPECIAL_IE10,TARIFA_ESPECIAL_IEE,TARIFA_ESPECIAL_IEEE,TARIFA_ESPECIAL_IIA,TARIFA_ESPECIAL_EA,TARIFA_ESPECIAL_EG,TARIFA_ESPECIAL_ER,TARIFA_ESPECIAL_EC) values ('99','87','39','SAN PEDRO',to_date('16/01/19','DD/MM/RR'),'8400','9100','19400','24700','27600','0','0','0','0','0','0','0','0','8700','6400','8400','0','2400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
REM INSERTING into JBALLESTEROS.PROYECTOS
SET DEFINE OFF;
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('1','ARMENIA-PEREIRA-MANIZALES');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('2','BOGOTÃƒï¿½ - SIBERIA - LA PUNTA - EL VINO - VILLETA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('3','BOGOTÃƒï¿½ - VILLAVICENCIO');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('4','CARTAGENA-BARRANQUILLA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('5','DESARROLLO VIAL DEL ORIENTE DE MEDELLÃƒï¿½N');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('6','FONTIBÃƒâ€œN - FACATATIVÃƒï¿½ - LOS ALPES');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('7','SANTA MARTA-RIOHACHA-PARAGUACHÃƒâ€œN');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('8','Ãƒï¿½REA METROPOLITANA DE CÃƒÅ¡CUTA Y NORTE DE SANTANDER');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('9','BRICEÃƒâ€˜O - TUNJA - SOGAMOSO');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('10','CÃƒâ€œRDOBA - SUCRE');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('11','GIRARDOT - IBAGUÃƒâ€° - CAJAMARCA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('12','PEREIRA - LA VICTORIA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('13','RUTA CARIBE');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('14','RUTA DEL SOL 1');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('15','RUTA DEL SOL SECTOR 3');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('16','AUTOPISTA ALÃ‚Â MAR 2');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('17','AUTOPISTA CONEXIÃƒâ€œN PACIFICO 1');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('18','AUTOPISTA CONEXIÃƒâ€œN PACIFICO 2');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('19','AUTOPISTA CONEXIÃƒâ€œN PACIFICO 3');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('20','AUTOPISTAS AL RÃƒï¿½O MAGDALENA 2');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('21','BUCARAMANGA - BARRANCABERMEJA - YONDÃƒâ€œ');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('22','BUCARAMANGA - PAMPLONA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('23','CARTAGENA - BARRANQUILLA CIRCUNVALAR DE LA PROSPERIDAD');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('24','CONCESIÃƒâ€œN AUTOPISTA AL MAR 1');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('25','GIRARDOT - HONDA - PUERTO SALGAR');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('26','IP - ACCESOS NORTE');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('27','IP - ANTIOQUIA BOLIVAR');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('28','IP - CAMBAO-MANIZALES');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('29','IP - MALLA VIAL DEL META');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('30','IP - NEIVA GIRARDOT');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('31','IP - TERCER CARRIL');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('32','IP - VÃƒï¿½A AL PUERTO');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('33','IP - VÃƒï¿½A DEL NUS');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('34','PERIMETRAL DE ORIENTE DE CUNDINAMARCA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('35','PUERTA DE HIERRO - CRUZ DEL VISO');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('36','RUMICHACA - PASTO');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('37','SANTANA-MOCOA-NEIVA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('38','TRANSVERSAL DEL SISGA');
Insert into JBALLESTEROS.PROYECTOS (ID,NOMBRE) values ('39','VILLAVICENCIO-YOPAL');
--------------------------------------------------------
--  DDL for Index SYS_C007732
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007732" ON "JBALLESTEROS"."DEPARTAMENTOS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007734
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007734" ON "JBALLESTEROS"."MUNICIPIOS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007735
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007735" ON "JBALLESTEROS"."PROYECTOS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007736
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007736" ON "JBALLESTEROS"."PEAJES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007732
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007732" ON "JBALLESTEROS"."DEPARTAMENTOS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007734
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007734" ON "JBALLESTEROS"."MUNICIPIOS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007736
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007736" ON "JBALLESTEROS"."PEAJES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007735
--------------------------------------------------------

  CREATE UNIQUE INDEX "JBALLESTEROS"."SYS_C007735" ON "JBALLESTEROS"."PROYECTOS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Function LOGMNR$COL_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$COL_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
237 185
nkvJV1w6wH1y7mRApzf9mGuebNUwgxDILkhGfHQCmP8+Vi4fyqh3SG1Fyq+pCts1OlgnK761
YuzKBA4JE5DNwZzBIF/Y4ZM5eUlquVyTkOg+AodK3vQJt9NLvPITXbP42O37gO+zKr4BQEJk
ypwrP1U/Pf6MLZONN8LUaVqHCN87T14HqHs5taX7LhLXQ2lCVBE1Ll8dyB9CDOlbyvQS/lrb
+0n1pQi9IJAWySL85ChAqnTaqFJm0YeToD4lZ8UUPQqIZNoX0x73WK9OzsmdBrvEC97iduxe
PEXVkxF6xklPod6yOGBvW7DAFMBgf+LajDLVKOAwB2EAiKCXYMuTUTtMYYkCFFf4sj1rCpsj
TLth6TSru530aM2HP6bEbm3m

/
--------------------------------------------------------
--  DDL for Function LOGMNR$GSBA_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$GSBA_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
206 171
6gxi/CQwK1I5Rfwuw/SXrOGpVRYwgwLI1yfbfHRGEjNe54OE4QwRZCoA20oG536tzgcBrj+1
xE3tE8jIhAoTlUdUmkdYMmZycO1SdiJZwwt/6BrM1wHXl/E5+3Ip2NXzC9j8v4+KjkD9d5AT
p05eEsEWjU1CBTMSpjZZrXzbgFl9QNnQ+zJGjSug21f76ajs78m6anxz7vFcTcem6XpAgKjc
EXzd/ijP8qiOqwblTfnXcRslJn3MljD02u+5fh9NBctOmnaw/tOjRCFPUhY8I9gCoMptjG7U
rHEIFzHOFyxBEdulRGq4ngSgcm7l2yOdSHgNM8rO2vUH4gozvJoLE1S8GBBzG/wrvHPhACQ/
2w==

/
--------------------------------------------------------
--  DDL for Function LOGMNR$KEY_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$KEY_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2a0 1a1
3O4I5hDO715d8A2tqbxMCflFW0owg/D319xqfC9Grfg+K6yE71zMvtNS45AyRXBk77WpI5v4
nUSfE2lbvUYgk3JHySIe28XxC3xIYYpPGQjxwa3GzPw0FN5aN6kerQQTHUBp29Dd+vLSgBaC
2pAFrq059ZvN0ZPN11XG/2RuDY7HaTQu/QffhnY8rVlNxpFmbkVidwtZQahx5qIFu9Uww/tv
o1AvhjaORi898/KiPtOqv7LpsPFbyNuMnZEG48cxtZuesMBJFP/bKtgU2DN69xiT8Pxf+N2n
g0D2ximYzZqwY/4dBQj9dyQDuXRFo40hdqtWw0L96zV6723aQ8Xp0cqBaZj2wWTI4+6Ikry9
zY0Mdm3bV8TYqsOa+zT4fnikGO0eYbTFHEiW9QUbl/UwzuERwk8p

/
--------------------------------------------------------
--  DDL for Function LOGMNR$SEQ_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$SEQ_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
249 181
++dDv/cHZatK7/vHG9lvR8DQCpYwg/D3AEhqfHQC2h6ONoOvOeHvTNX1S5GDyajM4j8vkSVz
IMw+LbYS3goujprvmrB/LUpdBF8TVvjEqZpC7MCKPXWcGnTeL7ja8C2tcOdjOpRXkwL5NmPJ
B0KqMvwepdiQDY7HUDQrBddQC1lBqHGEogWkwRJ3+2+jUC+Gpo5GTazIWS0V551NkSl3+h0W
BhkPglLbvQDPzxWTnmu4ZuJIlTiNwTf1R0WxghyyKFjES9CJsCrGT8Fn7prlF4Mr5kx1YBGf
5xaODtRnmVJgb65RlKbAN9+Xxf2QnQjKQL99RZAgsEwGVKNfx9lFKwHLGUwzjOxmIAXXYd/Z
+L9osPQJjZYkNrD0pQ==

/
--------------------------------------------------------
--  DDL for Function LOGMNR$TAB_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$TAB_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
22e 181
PRVt0FiLRPgjIhZlCZcQhnOHXQ4wgzJp2UhGfHSKrQ843hKm3gKD9swoFAS4jVcW0CsSl7W1
6banVWdjktOVM18XyRjY4ZM5eRdquSp0ZdfHl3KJPBYqPi9LXIwum30Qh7ymgO+zTKj+R1N2
nSs/TPnknfYLwcUdAfBryDQGEIMisMuE9XT5ix3sudhHa5tLJRjsBIDKlqL7zk2CH0C1NRAZ
XrP7WgavVdNS3Yikz88VupZG21hTuAGspJBgCagmNWIwi9pgCIWP3rxF4p+uMps/ABEg+MBP
6Iykm62kO6hWhVHJXkfKF/jrQFjYBTTzatr1VTcOXt/AFuagDR7isNtb//lnXh8TXyAFWyCT
ubv6GXL0aM0PP/t+DfSl

/
--------------------------------------------------------
--  DDL for Function LOGMNR$USER_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$USER_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
272 191
Vc+i+Mga8m7/BSlvXl0J+GmParYwg/D319wCfC8CTE6Ot30G8QRR0WzR8ohw8Z/y6DuL4pL5
IDjZApnCaZgeKa1OTjLj2B2tOYZg2ZuOAPKrxo7DeBqtn0Ahw0tubS36jP4xc+d2eQebdJMD
c/U0JxdiAl0qIPzsltBjeoGAEsxUk0aubCMJmysgc2d8ojil6ixQ37D7RA0HWMkh27QdOuXF
vSwuufDunMMT8Hue9dvy4vRXj+PhuyylJSukStsxyIb234EahCXyrjDlnzbC91eoU7v5sb4D
OvtDmggQCEViyhFXwspP9P0dOObin8JENsDJeFZYr/oVAgSHa97LRKvNZgd+f//XHlpEAOP4
rNm5mF0wTCABbb7tc5c7uo09M+79i7en8g==

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  Constraints for Table DEPARTAMENTOS
--------------------------------------------------------

  ALTER TABLE "JBALLESTEROS"."DEPARTAMENTOS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "JBALLESTEROS"."DEPARTAMENTOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MUNICIPIOS
--------------------------------------------------------

  ALTER TABLE "JBALLESTEROS"."MUNICIPIOS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "JBALLESTEROS"."MUNICIPIOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PEAJES
--------------------------------------------------------

  ALTER TABLE "JBALLESTEROS"."PEAJES" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "JBALLESTEROS"."PEAJES" ADD CONSTRAINT "CK_TARIFA_PLENA_PEAJES" CHECK (tarifa_plena_i>=0 ) ENABLE;
  ALTER TABLE "JBALLESTEROS"."PEAJES" MODIFY ("NOMBRE_ESTACION_PEAJE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROYECTOS
--------------------------------------------------------

  ALTER TABLE "JBALLESTEROS"."PROYECTOS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "JBALLESTEROS"."PROYECTOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MUNICIPIOS
--------------------------------------------------------

  ALTER TABLE "JBALLESTEROS"."MUNICIPIOS" ADD CONSTRAINT "DEPARTAMENTO_ID_FK" FOREIGN KEY ("DEPARTMENTO_ID")
	  REFERENCES "JBALLESTEROS"."DEPARTAMENTOS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PEAJES
--------------------------------------------------------

  ALTER TABLE "JBALLESTEROS"."PEAJES" ADD CONSTRAINT "PEAJES_MUNICIPIOS_ID_FK" FOREIGN KEY ("MUNICIPIO_ID")
	  REFERENCES "JBALLESTEROS"."MUNICIPIOS" ("ID") ENABLE;
  ALTER TABLE "JBALLESTEROS"."PEAJES" ADD CONSTRAINT "PEAJES_PROYECTOS_ID_FK" FOREIGN KEY ("PROYECTO_ID")
	  REFERENCES "JBALLESTEROS"."PROYECTOS" ("ID") ENABLE;
