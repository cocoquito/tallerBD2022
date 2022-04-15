/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     8/4/2022 11:21:26 p. m.                      */
/*==============================================================*/


drop table if exists ALMACENEQUIPOS;

drop table if exists ALMACENREPUESTOS;

drop table if exists ASIGNACIONTRABAJOS;

drop table if exists AUTOS;

drop table if exists CATEGORIACLI;

drop table if exists CLIENTE;

drop table if exists CONTACTOSPROV;

drop table if exists COTIZACION;

drop table if exists FACTURACION;

drop table if exists HERRAMIENTASMENORES;

drop table if exists MARCADOINGRESO;

drop table if exists PAGOPROVEEDORES;

drop table if exists PEDIDOEQUIPOS;

drop table if exists PEDIDOHERRMEN;

drop table if exists PEDIDOREPUESTOS;

drop table if exists PEDIDOREPUESTOSPROV;

drop table if exists PERSONAL;

drop table if exists PROVEEDORES;

drop table if exists RECEPCION;

drop table if exists SUCURSALES;

drop table if exists SUELDO;

drop table if exists TELEFCLIENTE;

drop table if exists TELEFEMPLEADOS;

drop table if exists TELEFPROVEEDOR;

drop table if exists TIPOEQUIPOS;

drop table if exists TIPOHERRAMIENTAS;

drop table if exists TIPOREPARACION;

drop table if exists TIPOREPUESTOS;

drop table if exists TITULARAUTO;

drop table if exists TRABAJO;

drop table if exists TURNO;

/*==============================================================*/
/* Table: ALMACENEQUIPOS                                        */
/*==============================================================*/
create table ALMACENEQUIPOS
(
   IDEQUIPO             int not null,
   IDTIPOEQ             int,
   NOMEQUIPO            varchar(65),
   CAPACIDADEQ          varchar(65),
   MARCAEQ              varchar(99),
   primary key (IDEQUIPO)
);

/*==============================================================*/
/* Table: ALMACENREPUESTOS                                      */
/*==============================================================*/
create table ALMACENREPUESTOS
(
   ID_REP               int not null,
   NOMREP               varchar(97),
   MARCAREP             varchar(96),
   COSTOREP             float(8,2),
   CANTRP               int,
   OBSREPUESTOS         varchar(200),
   primary key (ID_REP)
);

/*==============================================================*/
/* Table: ASIGNACIONTRABAJOS                                    */
/*==============================================================*/
create table ASIGNACIONTRABAJOS
(
   IDEQTRABA            int not null,
   CODPERSONAL          int,
   IDTURNO              int,
   IDTRABAJO            int,
   MESET                int,
   YEARET               int,
   primary key (IDEQTRABA)
);

/*==============================================================*/
/* Table: AUTOS                                                 */
/*==============================================================*/
create table AUTOS
(
   PLACAAUTO            varchar(15) not null,
   MODELO               varchar(23),
   ANIO                 int,
   COLOR                varchar(65),
   TIPO                 varchar(76),
   PROCEDENCIA          varchar(78),
   MARCAAUTOMOV         varchar(65),
   primary key (PLACAAUTO)
);

/*==============================================================*/
/* Table: CATEGORIACLI                                          */
/*==============================================================*/
create table CATEGORIACLI
(
   CODCAT               int not null,
   IDCAJA               int,
   IDCLIENTE            int,
   primary key (CODCAT)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   IDCLIENTE            int not null,
   CEDULACLIENTE        int,
   PLACAAUTO            varchar(15),
   primary key (IDCLIENTE)
);

/*==============================================================*/
/* Table: CONTACTOSPROV                                         */
/*==============================================================*/
create table CONTACTOSPROV
(
   IDPROVEEDOR          int,
   NOMBRECONTACTO       varchar(54),
   APELLCONTC           varchar(65),
   EMAILCONTC           varchar(87),
   TELEFCNTC            int
);

/*==============================================================*/
/* Table: COTIZACION                                            */
/*==============================================================*/
create table COTIZACION
(
   IDCOTIZ              int not null,
   IDRECEP              int,
   TIPOSERV             varchar(98),
   CONFIRMACLI          bool,
   FECHACOTIZ           date,
   IMPORTECOTIZADO      float(8,2),
   primary key (IDCOTIZ)
);

/*==============================================================*/
/* Table: FACTURACION                                           */
/*==============================================================*/
create table FACTURACION
(
   IDCAJA               int not null,
   IDTRABAJO            int,
   CODPERSONAL          int,
   FECHAREG             date,
   TOTALTRANSAC         float(8,2),
   primary key (IDCAJA)
);

/*==============================================================*/
/* Table: HERRAMIENTASMENORES                                   */
/*==============================================================*/
create table HERRAMIENTASMENORES
(
   CODHERRA             int not null,
   IDTIPOHERR           int,
   NOMHERRAMIENTA       varchar(100),
   MARCAAUTOMOVIL       varchar(65),
   CANTIDADHERR         int,
   primary key (CODHERRA)
);

/*==============================================================*/
/* Table: MARCADOINGRESO                                        */
/*==============================================================*/
create table MARCADOINGRESO
(
   IDREGISTROHORARIO    int not null,
   CODPERSONAL          int,
   IDTURNO              int,
   FECHA_HORARIO        date,
   HORAINGMANANA        time,
   HORASALTARDE         time,
   HORASTRABAJADAS      time,
   ATRASOS              time,
   primary key (IDREGISTROHORARIO)
);

/*==============================================================*/
/* Table: PAGOPROVEEDORES                                       */
/*==============================================================*/
create table PAGOPROVEEDORES
(
   IDEGRESO             int not null,
   IDPEDIDOREPP         int,
   IDPROVEEDOR          int,
   COMPRA               float(8,2),
   FECHACOMPRA          date,
   primary key (IDEGRESO)
);

/*==============================================================*/
/* Table: PEDIDOEQUIPOS                                         */
/*==============================================================*/
create table PEDIDOEQUIPOS
(
   ID_PEDEQUIPO         char(10) not null,
   IDTRABAJO            int,
   IDEQUIPO             int,
   FECHA_PEDEQ          date,
   FECHA_DEVEQ          date,
   primary key (ID_PEDEQUIPO)
);

/*==============================================================*/
/* Table: PEDIDOHERRMEN                                         */
/*==============================================================*/
create table PEDIDOHERRMEN
(
   CODPEDHM             int not null,
   CODHERRA             int,
   IDTRABAJO            int,
   FECHA                date,
   CANTHERRSOLICITADAS  int,
   primary key (CODPEDHM)
);

/*==============================================================*/
/* Table: PEDIDOREPUESTOS                                       */
/*==============================================================*/
create table PEDIDOREPUESTOS
(
   IDPEDREP             int not null,
   ID_REP               int,
   IDTRABAJO            int,
   FECHASALIDAREP       date,
   FECHAINGREP          date,
   REPUESTCLIENTE       varchar(124),
   primary key (IDPEDREP)
);

/*==============================================================*/
/* Table: PEDIDOREPUESTOSPROV                                   */
/*==============================================================*/
create table PEDIDOREPUESTOSPROV
(
   IDPEDIDOREPP         int not null,
   ID_REP               int,
   FECHAPEDIDOREP       date,
   CANTIDADHERRM        int,
   primary key (IDPEDIDOREPP)
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL
(
   CODPERSONAL          int not null,
   NOMBREEMP            varchar(75),
   APELLIDOEMP          varchar(98),
   FECHA_NAC_PER        date,
   EDAD                 int,
   CEDULAEMP            int,
   SEXOPERS             varchar(15),
   CARGOEMP             varchar(78),
   SUELDO               float(8,2),
   FECHAING             date,
   FECHARET             date,
   DIRECCIONEMP         varchar(150),
   EMAILEMP             varchar(154),
   OBSEMP               varchar(150),
   primary key (CODPERSONAL)
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES
(
   IDPROVEEDOR          int not null,
   RAZONSOCIAL          varchar(125),
   DIRECCIONPROV        varchar(124),
   EMAILPROV            varchar(87),
   primary key (IDPROVEEDOR)
);

/*==============================================================*/
/* Table: RECEPCION                                             */
/*==============================================================*/
create table RECEPCION
(
   IDRECEP              int not null,
   CODPERSONAL          int,
   IDCLIENTE            int,
   OBSREP               varchar(125),
   FECHA_REC            date,
   primary key (IDRECEP)
);

/*==============================================================*/
/* Table: SUCURSALES                                            */
/*==============================================================*/
create table SUCURSALES
(
   IDSUCURSAL           int not null,
   IDPROVEEDOR          int,
   CONTACTO             varchar(125),
   DIRSUCURSAL          varchar(200),
   TELEFSUCURSAL        int,
   primary key (IDSUCURSAL)
);

/*==============================================================*/
/* Table: SUELDO                                                */
/*==============================================================*/
create table SUELDO
(
   IDSUELDO             int not null,
   IDREGISTROHORARIO    int,
   SUELDOGANADO         decimal(8,2),
   BONOSGANADOS         decimal(8,2),
   DESCUENTOSMES        decimal(8,2),
   TOTALGANADO          decimal(8,2),
   primary key (IDSUELDO)
);

/*==============================================================*/
/* Table: TELEFCLIENTE                                          */
/*==============================================================*/
create table TELEFCLIENTE
(
   CEDULACLIENTE        int,
   TELEFCLIENTE         int
);

/*==============================================================*/
/* Table: TELEFEMPLEADOS                                        */
/*==============================================================*/
create table TELEFEMPLEADOS
(
   CODPERSONAL          int,
   NUMTELEFEMP          int
);

/*==============================================================*/
/* Table: TELEFPROVEEDOR                                        */
/*==============================================================*/
create table TELEFPROVEEDOR
(
   IDPROVEEDOR          int,
   TELEFONO             char(10)
);

/*==============================================================*/
/* Table: TIPOEQUIPOS                                           */
/*==============================================================*/
create table TIPOEQUIPOS
(
   IDTIPOEQ             int not null,
   TIPOEQUIPO           varchar(95),
   primary key (IDTIPOEQ)
);

/*==============================================================*/
/* Table: TIPOHERRAMIENTAS                                      */
/*==============================================================*/
create table TIPOHERRAMIENTAS
(
   IDTIPOHERR           int not null,
   TIPOHERRAM           varchar(1024),
   primary key (IDTIPOHERR)
);

/*==============================================================*/
/* Table: TIPOREPARACION                                        */
/*==============================================================*/
create table TIPOREPARACION
(
   IDTIPOREPARACION     int not null,
   IDCOTIZ              int,
   REPARACIONASIG       varchar(124),
   OBSREPARAC           varchar(123),
   primary key (IDTIPOREPARACION)
);

/*==============================================================*/
/* Table: TIPOREPUESTOS                                         */
/*==============================================================*/
create table TIPOREPUESTOS
(
   IDTIPREP             int not null,
   ID_REP               int,
   TIPOREP              varchar(1024),
   primary key (IDTIPREP)
);

/*==============================================================*/
/* Table: TITULARAUTO                                           */
/*==============================================================*/
create table TITULARAUTO
(
   CEDULACLIENTE        int not null,
   NOMBRECLIENTE        varchar(55),
   APELLIDOCLIENTE      varchar(55),
   DIRECCIONCLIENTE     varchar(98),
   NACIONALIDAD         varchar(45),
   EMAILCLIENTE         varchar(140),
   NACIONALIDADCLI      varchar(56),
   primary key (CEDULACLIENTE)
);

/*==============================================================*/
/* Table: TRABAJO                                               */
/*==============================================================*/
create table TRABAJO
(
   IDTRABAJO            int not null,
   IDCOTIZ              int,
   FECHA_INICIO         date,
   FECHA_FIN            date,
   primary key (IDTRABAJO)
);

/*==============================================================*/
/* Table: TURNO                                                 */
/*==============================================================*/
create table TURNO
(
   IDTURNO              int not null,
   INICIO_TURNO         char(10),
   FIN_TURNO            char(10),
   primary key (IDTURNO)
);

alter table ALMACENEQUIPOS add constraint FK_ORDENA_A foreign key (IDTIPOEQ)
      references TIPOEQUIPOS (IDTIPOEQ) on delete restrict on update restrict;

alter table ASIGNACIONTRABAJOS add constraint FK_ASIGNADO foreign key (IDTURNO)
      references TURNO (IDTURNO) on delete restrict on update restrict;

alter table ASIGNACIONTRABAJOS add constraint FK_CUENTA_CON_UN foreign key (IDTRABAJO)
      references TRABAJO (IDTRABAJO) on delete restrict on update restrict;

alter table ASIGNACIONTRABAJOS add constraint FK_SE_ASIGNA_UN foreign key (CODPERSONAL)
      references PERSONAL (CODPERSONAL) on delete restrict on update restrict;

alter table CATEGORIACLI add constraint FK_ASIGNA foreign key (IDCAJA)
      references FACTURACION (IDCAJA) on delete restrict on update restrict;

alter table CATEGORIACLI add constraint FK_TIENE_UN_BENEFICIO foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE) on delete restrict on update restrict;

alter table CLIENTE add constraint FK_ES_UN foreign key (CEDULACLIENTE)
      references TITULARAUTO (CEDULACLIENTE) on delete restrict on update restrict;

alter table CLIENTE add constraint FK_TIENE_UN foreign key (PLACAAUTO)
      references AUTOS (PLACAAUTO) on delete restrict on update restrict;

alter table CONTACTOSPROV add constraint FK_LLAMAN_A foreign key (IDPROVEEDOR)
      references PROVEEDORES (IDPROVEEDOR) on delete restrict on update restrict;

alter table COTIZACION add constraint FK_SE_VA_A foreign key (IDRECEP)
      references RECEPCION (IDRECEP) on delete restrict on update restrict;

alter table FACTURACION add constraint FK_INFORMA_A foreign key (IDTRABAJO)
      references TRABAJO (IDTRABAJO) on delete restrict on update restrict;

alter table FACTURACION add constraint FK_TIENE_RESPONSABLE foreign key (CODPERSONAL)
      references PERSONAL (CODPERSONAL) on delete restrict on update restrict;

alter table HERRAMIENTASMENORES add constraint FK_CLASIFICA_EN foreign key (IDTIPOHERR)
      references TIPOHERRAMIENTAS (IDTIPOHERR) on delete restrict on update restrict;

alter table MARCADOINGRESO add constraint FK_ACOMPANA_A foreign key (IDTURNO)
      references TURNO (IDTURNO) on delete restrict on update restrict;

alter table MARCADOINGRESO add constraint FK_TIENE_QUE foreign key (CODPERSONAL)
      references PERSONAL (CODPERSONAL) on delete restrict on update restrict;

alter table PAGOPROVEEDORES add constraint FK_CANCELA_EL_PEDIDO_A foreign key (IDPROVEEDOR)
      references PROVEEDORES (IDPROVEEDOR) on delete restrict on update restrict;

alter table PAGOPROVEEDORES add constraint FK_SOLICITA_SU_PAGO_EN foreign key (IDPEDIDOREPP)
      references PEDIDOREPUESTOSPROV (IDPEDIDOREPP) on delete restrict on update restrict;

alter table PEDIDOEQUIPOS add constraint FK_SE_USARA foreign key (IDEQUIPO)
      references ALMACENEQUIPOS (IDEQUIPO) on delete restrict on update restrict;

alter table PEDIDOEQUIPOS add constraint FK_SOLICITA foreign key (IDTRABAJO)
      references TRABAJO (IDTRABAJO) on delete restrict on update restrict;

alter table PEDIDOHERRMEN add constraint FK_ATIENDE_SI_LO_TIENE foreign key (CODHERRA)
      references HERRAMIENTASMENORES (CODHERRA) on delete restrict on update restrict;

alter table PEDIDOHERRMEN add constraint FK_SOLICITA_LO_NECESARIO foreign key (IDTRABAJO)
      references TRABAJO (IDTRABAJO) on delete restrict on update restrict;

alter table PEDIDOREPUESTOS add constraint FK_ENCUENTRA_LO_NECESARIO foreign key (ID_REP)
      references ALMACENREPUESTOS (ID_REP) on delete restrict on update restrict;

alter table PEDIDOREPUESTOS add constraint FK_PRECISA_UN foreign key (IDTRABAJO)
      references TRABAJO (IDTRABAJO) on delete restrict on update restrict;

alter table PEDIDOREPUESTOSPROV add constraint FK_PRECISA foreign key (ID_REP)
      references ALMACENREPUESTOS (ID_REP) on delete restrict on update restrict;

alter table RECEPCION add constraint FK_ES_ATENDIDO_EN foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE) on delete restrict on update restrict;

alter table RECEPCION add constraint FK_ES_PARTE_DE foreign key (CODPERSONAL)
      references PERSONAL (CODPERSONAL) on delete restrict on update restrict;

alter table SUCURSALES add constraint FK_TAMBIEN_ESTAN_SUS foreign key (IDPROVEEDOR)
      references PROVEEDORES (IDPROVEEDOR) on delete restrict on update restrict;

alter table SUELDO add constraint FK_HORAS_TRAB foreign key (IDREGISTROHORARIO)
      references MARCADOINGRESO (IDREGISTROHORARIO) on delete restrict on update restrict;

alter table TELEFCLIENTE add constraint FK_CUENTA_CON foreign key (CEDULACLIENTE)
      references TITULARAUTO (CEDULACLIENTE) on delete restrict on update restrict;

alter table TELEFEMPLEADOS add constraint FK_ES_DE foreign key (CODPERSONAL)
      references PERSONAL (CODPERSONAL) on delete restrict on update restrict;

alter table TELEFPROVEEDOR add constraint FK_TIENE_CONTACTO foreign key (IDPROVEEDOR)
      references PROVEEDORES (IDPROVEEDOR) on delete restrict on update restrict;

alter table TIPOREPARACION add constraint FK_RELATIONSHIP_33 foreign key (IDCOTIZ)
      references COTIZACION (IDCOTIZ) on delete restrict on update restrict;

alter table TIPOREPUESTOS add constraint FK_SON_PARTE_DE foreign key (ID_REP)
      references ALMACENREPUESTOS (ID_REP) on delete restrict on update restrict;

alter table TRABAJO add constraint FK_PROCEDE_A foreign key (IDCOTIZ)
      references COTIZACION (IDCOTIZ) on delete restrict on update restrict;

