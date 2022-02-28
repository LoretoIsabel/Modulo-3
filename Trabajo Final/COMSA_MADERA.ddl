-- Generado por Oracle SQL Developer Data Modeler 20.4.1.406.0906
--   en:        2022-02-28 00:57:17 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE datos_transportista CASCADE CONSTRAINTS;

DROP TABLE factura_compra CASCADE CONSTRAINTS;

DROP TABLE faena CASCADE CONSTRAINTS;

DROP TABLE informe_recepcion CASCADE CONSTRAINTS;

DROP TABLE metro_ruma CASCADE CONSTRAINTS;

DROP TABLE recepcionista CASCADE CONSTRAINTS;

DROP TABLE sector_acopio CASCADE CONSTRAINTS;

DROP TABLE servicio_cosecha CASCADE CONSTRAINTS;

DROP TABLE servicio_transporte CASCADE CONSTRAINTS;

DROP TABLE venta_directa CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE datos_transportista (
    rutchofer     VARCHAR2(10) NOT NULL,
    nombrechofer  CLOB NOT NULL
);

ALTER TABLE datos_transportista ADD CONSTRAINT datos_transportista_pk PRIMARY KEY ( rutchofer );

CREATE TABLE factura_compra (
    idfactura         VARCHAR2(10) NOT NULL,
    nombreproveedor   VARCHAR2(20) NOT NULL,
    cantidad_mr       NUMBER(20) NOT NULL,
    rutproveedor      VARCHAR2(10) NOT NULL,
    valor_mr          NUMBER(20) NOT NULL,
    valor_cosecha     NUMBER(10),
    valor_transporte  NUMBER(100),
    neto              NUMBER(15) NOT NULL,
    iva               NUMBER(20) NOT NULL,
    total             NUMBER(20, 2) NOT NULL,
    valorcosecha      NUMBER(10),
    valortransporte   NUMBER(10)
);

ALTER TABLE factura_compra ADD CONSTRAINT factura_compra_pk PRIMARY KEY ( idfactura );

CREATE TABLE faena (
    idfaena      VARCHAR2(20) NOT NULL,
    idrecepcion  VARCHAR2(10) NOT NULL
);

ALTER TABLE faena ADD CONSTRAINT faena_pk PRIMARY KEY ( idfaena );

CREATE TABLE informe_recepcion (
    idrecepcion        VARCHAR2(10) NOT NULL,
    sucursal           CLOB NOT NULL,
    fecharecepcion     DATE NOT NULL,
    horarecepcion      TIMESTAMP(4) WITH LOCAL TIME ZONE NOT NULL,
    rutrrecepcionista  VARCHAR2(10) NOT NULL,
    idguiarep          VARCHAR2(10) NOT NULL,
    fechaguiarecep     DATE NOT NULL,
    altura1            VARCHAR2(10) NOT NULL,
    altura2            VARCHAR2(10),
    altura3            VARCHAR2(10),
    altura4            VARCHAR2(10),
    altura5            VARCHAR2(10),
    altura6            VARCHAR2(10),
    altura7            VARCHAR2(10),
    altura8            VARCHAR2(10),
    largocamion        VARCHAR2(10) NOT NULL,
    rutchofer          VARCHAR2(10) NOT NULL,
    patentecamion      VARCHAR2(10) NOT NULL,
    idsecacopio        VARCHAR2(20) NOT NULL,
    idcalidad          VARCHAR2(20) NOT NULL,
    idfactura          VARCHAR2(10) NOT NULL,
    pagocontado        VARCHAR2(1) NOT NULL
);

ALTER TABLE informe_recepcion ADD CONSTRAINT informe_recepcion_pk PRIMARY KEY ( idrecepcion );

CREATE TABLE metro_ruma (
    idcalidad           VARCHAR2(20) NOT NULL,
    descripcioncalidad  CLOB NOT NULL
);

ALTER TABLE metro_ruma ADD CONSTRAINT metro_ruma_pk PRIMARY KEY ( idcalidad );

CREATE TABLE recepcionista (
    rutrrecepcionista    VARCHAR2(10) NOT NULL,
    nombrerecepcionista  CLOB NOT NULL
);

ALTER TABLE recepcionista ADD CONSTRAINT recepcionista_pk PRIMARY KEY ( rutrrecepcionista );

CREATE TABLE sector_acopio (
    idsecacopio      VARCHAR2(20) NOT NULL,
    nombresecacopio  INTEGER NOT NULL,
    mr_secacopio     NUMBER(20, 2) NOT NULL
);

ALTER TABLE sector_acopio ADD CONSTRAINT sector_acopio_pk PRIMARY KEY ( idsecacopio );

CREATE TABLE servicio_cosecha (
    idcosecha                 VARCHAR2(10) NOT NULL,
    rutcontratistacosecha     VARCHAR2(10) NOT NULL,
    nombrecontratistacosecha  CLOB NOT NULL,
    dfaena                    VARCHAR2(20) NOT NULL
);

ALTER TABLE servicio_cosecha ADD CONSTRAINT servicio_cosecha_pk PRIMARY KEY ( idcosecha );

CREATE TABLE servicio_transporte (
    idtransporte           INTEGER NOT NULL,
    rut_contra_transporte  VARCHAR2(10) NOT NULL,
    nom_contra_transporte  CLOB NOT NULL,
    idfaena                VARCHAR2(20) NOT NULL
);

ALTER TABLE servicio_transporte ADD CONSTRAINT servicio_transporte_pk PRIMARY KEY ( idtransporte );

CREATE TABLE venta_directa (
    idventadirecta  VARCHAR2(10) NOT NULL,
    idrecepcion     VARCHAR2(10) NOT NULL
);

ALTER TABLE venta_directa ADD CONSTRAINT venta_directa_pk PRIMARY KEY ( idventadirecta );

ALTER TABLE faena
    ADD CONSTRAINT faena_informe_recepcion_fk FOREIGN KEY ( idrecepcion )
        REFERENCES informe_recepcion ( idrecepcion );

ALTER TABLE informe_recepcion
    ADD CONSTRAINT inf_recep_factura_compra_fk FOREIGN KEY ( idfactura )
        REFERENCES factura_compra ( idfactura );

ALTER TABLE informe_recepcion
    ADD CONSTRAINT inf_recep_metro_ruma_fk FOREIGN KEY ( idcalidad )
        REFERENCES metro_ruma ( idcalidad );

ALTER TABLE informe_recepcion
    ADD CONSTRAINT inf_recep_recepcionista_fk FOREIGN KEY ( rutrrecepcionista )
        REFERENCES recepcionista ( rutrrecepcionista );

ALTER TABLE informe_recepcion
    ADD CONSTRAINT inf_recep_sector_acopio_fk FOREIGN KEY ( idsecacopio )
        REFERENCES sector_acopio ( idsecacopio );

ALTER TABLE informe_recepcion
    ADD CONSTRAINT inf_recep_transportista_fk FOREIGN KEY ( rutchofer )
        REFERENCES datos_transportista ( rutchofer );

ALTER TABLE servicio_transporte
    ADD CONSTRAINT serv_transporte_faena_fk FOREIGN KEY ( idfaena )
        REFERENCES faena ( idfaena );

ALTER TABLE servicio_cosecha
    ADD CONSTRAINT servicio_cosecha_faena_fk FOREIGN KEY ( dfaena )
        REFERENCES faena ( idfaena );

ALTER TABLE venta_directa
    ADD CONSTRAINT venta_directa_inf_recepcion_fk FOREIGN KEY ( idrecepcion )
        REFERENCES informe_recepcion ( idrecepcion );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
