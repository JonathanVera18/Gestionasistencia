
--Creacion de las tablas y las claves foraneas:
/*==============================================================*/
/* Table: CANTON                                                */
/*==============================================================*/
create table CANTON (
   ID_CAN               INT4                 not null,
   NAME_CAN             TEXT                 not null,
   constraint PK_CANTON primary key (ID_CAN)
);

/*==============================================================*/
/* Table: CAUSA_MUERTE                                          */
/*==============================================================*/
create table CAUSA_MUERTE (
   ID_CAU_MUE           INT4                 not null,
   NAME_CAU_MUE         TEXT                 not null,
   constraint PK_CAUSA_MUERTE primary key (ID_CAU_MUE)
);
/*==============================================================*/
/* Table: CERTIFICADO                                           */
/*==============================================================*/
create table CERTIFICADO (
   ID_CERTI             INT4                 not null,
   ID_TRAM              INT4                 not null,
   constraint PK_CERTIFICADO primary key (ID_CERTI)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIEN             INT4                 not null,
   ID_UBI               INT4                 not null,
   CI_CLIEN             VARCHAR(10)          not null,
   NAME_CLIEN           TEXT                 not null,
   LNAME_CLIEN          TEXT                 not null,
   FCH_NACI_CLIEN       DATE                 not null,
   TEL1_CLIEN           VARCHAR(10)          not null,
   TEL2_CLIEN           VARCHAR(10)          not null,
   constraint PK_CLIENTE primary key (ID_CLIEN)
);
/*==============================================================*/
/* Table: DIFUNTO                                               */
/*==============================================================*/
create table DIFUNTO (
   ID_DIFU              INT4                 not null,
   ID_CAU_MUE           INT4                 not null,
   NAME_DIFU            TEXT                 not null,
   LASTN_DIFU           TEXT                 not null,
   FCH_NACI_DIFU        DATE                 not null,
   FCH_MUERTE_DIFU      DATE                 not null,
   CODE_ACTA_DIFU       VARCHAR(5)           not null,
   constraint PK_DIFUNTO primary key (ID_DIFU)
);
/*==============================================================*/
/* Table: ESTADO_ESTRUCTURA                                     */
/*==============================================================*/
create table ESTADO_ESTRUCTURA (
   ID_EST_ESTRUC        INT4                 not null,
   NAME_EST_ESTRUC      TEXT                 not null,
   constraint PK_ESTADO_ESTRUCTURA primary key (ID_EST_ESTRUC)
);

/*==============================================================*/
/* Table: ESTRUCTURA                                            */
/*==============================================================*/
create table ESTRUCTURA (
   ID_ESTRUC            INT4                 not null,
   ID_LUGAR_ESTRUC      INT4                 not null,
   ID_TIPO_ESTRUC       INT4                 not null,
   ID_EST_ESTRUC        INT4                 not null,
   CRUCES               BOOL                 not null,
   constraint PK_ESTRUCTURA primary key (ID_ESTRUC)
);
/*==============================================================*/
/* Table: LUGAR_ESTRUCTURA                                      */
/*==============================================================*/
create table LUGAR_ESTRUCTURA (
   ID_LUGAR_ESTRUC      INT4                 not null,
   NAME_ZONA            TEXT                 not null,
   NAME_MANZA           TEXT                 not null,
   constraint PK_LUGAR_ESTRUCTURA primary key (ID_LUGAR_ESTRUC)
);
/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_TIPO_PAGO         INT4                 not null,
   ID_TRAM              INT4                 not null,
   CANT_PAGO            DECIMAL(6)           not null,
   FCH_PAGO             DATE                 not null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
   ID_PER               INT4                 not null,
   ID_TIPO_PER          INT4                 not null,
   CI_PER               VARCHAR(10)          not null,
   NAME_PER             TEXT                 not null,
   LNAME_PER            TEXT                 not null,
   FCH_NACI_PER         DATE                 not null,
   TEL1_PER             VARCHAR(10)          not null,
   TEL2_PER             VARCHAR(10)          not null,
   constraint PK_PERSONAL primary key (ID_PER)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PRO               INT4                 not null,
   NAME_PRO             TEXT                 not null,
   constraint PK_PROVINCIA primary key (ID_PRO)
);


/*==============================================================*/
/* Table: REPORTE_INCIDENTE                                     */
/*==============================================================*/
create table REPORTE_INCIDENTE (
   ID_INCI              INT4                 not null,
   ID_TIPO_INCI         INT4                 not null,
   ID_PER               INT4                 not null,
   FCH_REP_INC          DATE                 not null,
   constraint PK_REPORTE_INCIDENTE primary key (ID_INCI)
);

/*==============================================================*/
/* Table: TIPO_ESTRUCTURA                                       */
/*==============================================================*/
create table TIPO_ESTRUCTURA (
   ID_TIPO_ESTRUC       INT4                 not null,
   NAME_TIPO_ESTRUC     TEXT                 not null,
   constraint PK_TIPO_ESTRUCTURA primary key (ID_TIPO_ESTRUC)
);

/*==============================================================*/
/* Table: TIPO_INCIDENTE                                        */
/*==============================================================*/
create table TIPO_INCIDENTE (
   ID_TIPO_INCI         INT4                 not null,
   NAME_TIPO_INCI       VARCHAR(30)          not null,
   constraint PK_TIPO_INCIDENTE primary key (ID_TIPO_INCI)
);

/*==============================================================*/
/* Table: TIPO_PAGO                                             */
/*==============================================================*/
create table TIPO_PAGO (
   ID_TIPO_PAGO         INT4                 not null,
   NAME_TIPO_PAGO       TEXT                 not null,
   constraint PK_TIPO_PAGO primary key (ID_TIPO_PAGO)
);

/*==============================================================*/
/* Table: TIPO_PERSONAL                                         */
/*==============================================================*/
create table TIPO_PERSONAL (
   ID_TIPO_PER          INT4                 not null,
   NAME_TIPO_PER        TEXT                 not null,
   constraint PK_TIPO_PERSONAL primary key (ID_TIPO_PER)
);

/*==============================================================*/
/* Table: TIPO_TRAMITE                                          */
/*==============================================================*/
create table TIPO_TRAMITE (
   ID_TIPO_TRAM      INT4                 not null,
   NAME_TIPO_TRAM    TEXT                 not null,
   constraint PK_TIPO_TRAMITE primary key (ID_TIPO_TRAMITE)
);

/*==============================================================*/
/* Table: TRAMITE                                          */
/*==============================================================*/
create table TRAMITE (
   ID_TRAM      INT4                 not null,
   ID_TIPO_TRAM    TEXT                 not null,
   ID_CLIEN	INT4			not null,
   ID_CLIEN	INT4			not null,
   ID_CLIEN	INT4			not null,
   ID_CLIEN	INT4			not null,
   FCH_TRAM	DATE			not null,
   FCH_TRAM	DATE			not null,
   SMS_TRAM	TEXT			not null,	
   constraint PK_TRAMITE primary key (ID_TRAM)
);
/*==============================================================*/
/* Table: UBICACION                                        */
/*==============================================================*/
create table UBICACION /*==============================================================*/
   ID_UBI          INT4                 not null,
   ID_PRO    TEXT                 not null,
   ID_CAN	INT4			not null,
   constraint PK_UBICACION primary key (ID_UBI)
);

Creacion de llaves sforaneas:
alter table CERTIFICADO
add constraint FK_CERTIFIC_TRAMITE_C_TRAMITE foreign key (ID_TRAM)
references TRAMITE (ID_TRAM)
on delete restrict on update restrict;

alter table CLIENTE
add constraint FK_CLIENTE_UBICACION_UBICACIO foreign key (ID_UBI)
references UBICACION (ID_UBI)
on delete restrict on update restrict;

alter table DIFUNTO
add constraint FK_DIFUNTO_CAUSAMUER_CAUSA_MU foreign key (ID_CAU_MUE)
references CAUSA_MUERTE (ID_CAU_MUE)  -- Asumiendo que el nombre de la tabla es CAUSA_MUERTE
on delete restrict on update restrict;

alter table ESTRUCTURA
add constraint FK_ESTRUCTU_ESTADOEST_ESTADO_E foreign key (ID_EST_ESTRUC)
references ESTADO_ESTRUCTURA (ID_EST_ESTRUC)  -- Asumiendo que el nombre de la tabla es ESTADO_ESTRUCTURA
on delete restrict on update restrict;

alter table ESTRUCTURA
add constraint FK_ESTRUCTU_LUGARESTR_LUGAR_ES foreign key (ID_LUGAR_ESTRUC)
references LUGAR_ESTRUCTURA (ID_LUGAR_ESTRUC)
on delete restrict on update restrict;
alter table PAGO
add constraint FK_PAGO_TIPOPAGO__TIPO_PAG foreign key (ID_TIPO_PAGO)
references TIPO_PAGO (ID_TIPO_PAGO)
on delete restrict on update restrict;
alter table PAGO
add constraint FK_PAGO_TRAMITE_P_TRAMITE foreign key (ID_TRAM)
references TRAMITE (ID_TRAM)
on delete restrict on update restrict;
alter table PERSONAL
add constraint FK_PERSONAL_TIPOPERSO_TIPO_PER foreign key (ID_TIPO_PER)
references TIPO_PERSONAL (ID_TIPO_PER)
on delete restrict on update restrict;
alter table REPORTE_INCIDENTE
add constraint FK_REPORTE_PERSONAL_PERSONAL foreign key (ID_PER)
references PERSONAL (ID_PER)
on delete restrict on update restrict;

alter table REPORTE_INCIDENTE
add constraint FK_REPORTE_TIPOINCID_TIPO_INC foreign key (ID_TIPO_INCI)
references TIPO_INCIDENTE (ID_TIPO_INCI)
on delete restrict on update restrict;

alter table TRAMITE
add constraint FK_TRAMITE_CLIENTE_T_CLIENTE foreign key (ID_CLIEN)
references CLIENTE (ID_CLIEN)
on delete restrict on update restrict;

alter table TRAMITE
add constraint FK_TRAMITE_DIFUNTO_T_DIFUNTO foreign key (ID_DIFU)
references DIFUNTO (ID_DIFU)
on delete restrict on update restrict;

alter table TRAMITE
add constraint FK_TRAMITE_ESTRUCTUR_ESTRUCTU foreign key (ID_ESTRUC)
references ESTRUCTURA (ID_ESTRUC)
on delete restrict on update restrict;

alter table TRAMITE
add constraint FK_TRAMITE_PERSONAL_PERSONAL foreign key (ID_PER)
references PERSONAL (ID_PER)
on delete restrict on update restrict;

alter table TRAMITE
add constraint FK_TRAMITE_TIPOTRAMI_TIPO_TRA foreign key (ID_TIPO_TRAM)
references TIPO_TRAMITE (ID_TIPO_TRAM)
on delete restrict on update restrict;

alter table UBICACION
add constraint FK_UBICACIO_CANTON_UB_CANTON foreign key (ID_CAN) references CANTON (ID_CAN)
on delete restrict on update restrict;

alter table UBICACION
add constraint FK_UBICACIO_PROVINCIA_PROVINCI foreign key (ID_PRO) references PROVINCIA (ID_PRO)
on delete restrict on update restrict;


--crear funcion para listar entidades
-- Función para listar las entidades
CREATE OR REPLACE FUNCTION listar_entidades()
RETURNS TABLE(table_name text) AS $$
BEGIN
    RETURN QUERY 
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public';
END; $$ 
LANGUAGE plpgsql;

-- Función para listar los atributos de una entidad
CREATE OR REPLACE FUNCTION listar_atributos(entidad text)
RETURNS TABLE(column_name text) AS $$
BEGIN
    RETURN QUERY 
    SELECT column_name 
    FROM information_schema.columns 
    WHERE table_name = entidad;
END; $$ 
LANGUAGE plpgsql;

















