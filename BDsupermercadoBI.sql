CREATE DATABASE [BDSupermercadoBI]
USE [BDSupermercadoBI]


/*llena*/
CREATE TABLE tblCARGo(
	intCodigo_CARG int IDENTITY(1,1) NOT NULL,
	strNombre_CARG varchar(50) NOT NULL,
	intSalario_CARG int NOT NULL,
    CONSTRAINT [PK_tblCARGo] PRIMARY KEY (intCodigo_CARG)
) 
/*llena*/
CREATE TABLE tblCIUDad(
	intCodigo_CIUD int IDENTITY(1,1) NOT NULL,
	strNombre_CIUD varchar(50) NOT NULL,
	blnActivo_CIUD bit NOT NULL,
	intCodigo_DEPA int NOT NULL,
 CONSTRAINT [PK_tblCIUDad] PRIMARY KEY (intCodigo_CIUD)
 )
 
CREATE TABLE tblCLIEnte(
	strDocumento_CLIE varchar(20) NOT NULL,
	strNombre_CLIE varchar(50) NOT NULL,
	strPrimerApellido_CLIE varchar(50) NOT NULL,
	strSegundoApellido_CLIE varchar(50) NULL,
	strDireccion_CLIE varchar(200) NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY (strDocumento_CLIE) 
)

CREATE TABLE tblCOntactoPRoveedor(
	intCodigo_COPR int IDENTITY(1,1) NOT NULL,
	strNombre_COPR varchar(50) NOT NULL,
	strApellidos_COPR varchar(200) NOT NULL,
	strTelefono_COPR varchar(20) NOT NULL,
	strCargo_COPR varchar(50) NOT NULL,
	strDocumento_PROV varchar(20) NOT NULL,
 CONSTRAINT [PK_tblCOntactoPRoveedor] PRIMARY KEY (intCodigo_COPR)
 )
 /*llena*/
CREATE TABLE tblDEPArtamento(
	intCodigo_DEPA int IDENTITY(1,1) NOT NULL,
	strNombre_DEPA varchar(50) NOT NULL,
	blnActivo_DEPA bit NOT NULL,
	intCodigo_PAIS int NOT NULL,
 CONSTRAINT [PK_tblDEPArtamento] PRIMARY KEY  (intCodigo_DEPA)
 )

CREATE TABLE tblDEtalleDEvolucion(
	intCodigo_DEDE int IDENTITY(1,1) NOT NULL,
	intCodigo_DEVO int NOT NULL,
	intCodigo_PROD int NOT NULL,
	intCantidad_DEDE int NOT NULL,
	intValorUnitario_DEDE int NOT NULL,
 CONSTRAINT [PK_tblDEtalleDEvolucion] PRIMARY KEY (intCodigo_DEDE) 
)

CREATE TABLE tblDEtalleFActura(
	intCodigo_DEFA int IDENTITY(1,1) NOT NULL,
	intNumero_FACT int NOT NULL,
	intCodigo_PROD int NOT NULL,
	intCantidad_DEFA int NOT NULL,
	intValorUnitario_DEFA int NOT NULL,
 CONSTRAINT [PK_tblDEtalleFActura] PRIMARY KEY (intCodigo_DEFA)
 )

CREATE TABLE tblDEtalleFacturaCompra(
	intCodigo_DEFC int IDENTITY(1,1) NOT NULL,
	intNumero_FACO int NOT NULL,
	intCodigo_PROD int NOT NULL,
	intCantidad_DEFC int NOT NULL,
	intValorUnitario_DEFC int NOT NULL,
 CONSTRAINT [PK_tblDEtalleFacturaCompra] PRIMARY KEY (intCodigo_DEFC)
)

CREATE TABLE tblDEVOlucion(
	intCodigo_DEVO int IDENTITY(1,1) NOT NULL,
	strDocumento_CLIE varchar(20) NOT NULL,
	intNumero_FACT int NOT NULL,
	dtmFecha_DEVO datetime NOT NULL,
	intCodigo_EMCA int NOT NULL,
 CONSTRAINT [PK_tblDEVOlucion] PRIMARY KEY (intCodigo_DEVO) 
)

CREATE TABLE tblEMPLeado(
	strDocumento_EMPL varchar(20) NOT NULL,
	strNombre_EMPL varchar(50) NOT NULL,
	strPrimerApellido_EMPL varchar(50) NOT NULL,
	strSegundoApellido_EMPL varchar(50) NULL,
	strDireccion_EMPL varchar(200) NOT NULL,
	strTelefono_EMPL varchar(20) NOT NULL,
 CONSTRAINT [PK_tblEMPLeado] PRIMARY KEY (strDocumento_EMPL)
 )

CREATE TABLE tblEMpleadoCArgo(
	intCodigo_EMCA int IDENTITY(1,1) NOT NULL,
	strDocumento_EMPL varchar(20) NOT NULL,
	intCodigo_CARG int NOT NULL,
	dtmFechaInicio_EMCA datetime NOT NULL,
	dtmFechaFin_EMCA datetime NULL,
	intCodigo_SUCU int NOT NULL,
 CONSTRAINT [PK_tblEMpleadoCArgo] PRIMARY KEY (intCodigo_EMCA)
)

CREATE TABLE tblFACTura(
	intNumero_FACT int NOT NULL,
	strDocumento_CLIE varchar(20) NOT NULL,
	dtmFecha_FACT datetime NOT NULL,
	intCodigo_EMCA int NOT NULL,
 CONSTRAINT [PK_tblFACTura] PRIMARY KEY (intNumero_FACT)
)


CREATE TABLE tblFActuraCOmpra(
	intCodigo_FACO int NOT NULL,
	intCodigo_EMCA int NOT NULL,
	strDocumento_PROV varchar(20) NOT NULL,
	dtmFecha_FACO date NOT NULL,
	dtmFechaPago_FACO date NOT NULL,
 CONSTRAINT [PK_tblFActuraCOmpra] PRIMARY KEY (intCodigo_FACO)
)

CREATE TABLE tblNOtaCRedito(
	intNumero_CRED int NOT NULL,
	intCodigo_DEVO int NOT NULL,
	intValor_CRED int NOT NULL,
	dtmFechaValidez_CRED datetime NOT NULL,
 CONSTRAINT [PK_tblCREDito] PRIMARY KEY (intNumero_CRED) 
)
/*llena*/
CREATE TABLE tblPAIS(
	intCodigo_PAIS int IDENTITY(1,1) NOT NULL,
	strNombre_PAIS varchar(50) NOT NULL,
	blnActivo_PAIS bit NOT NULL,
 CONSTRAINT [PK_tblPAIS] PRIMARY KEY (intCodigo_PAIS)
)

CREATE TABLE tblPRODucto(
	intCodigo_PROD int IDENTITY(1,1) NOT NULL,
	strNombre_PROD varchar(50) NOT NULL,
	strDescripcion_PROD varchar(200) NULL,
	intCantidad_PROD int NOT NULL,
	intValorUnitario_PROD int NOT NULL,
	intCodigo_TIPR int NOT NULL,
 CONSTRAINT [PK_tblPRODucto] PRIMARY KEY CLUSTERED (intCodigo_PROD)
)

CREATE TABLE tblPRoductoPRoveedor(
	intCodigo_PRPR int IDENTITY(1,1) NOT NULL,
	strDocumento_PROV varchar(20) NOT NULL,
	intCodigo_PROD int NOT NULL,
	intValorUnitario_PRPR int NOT NULL,
	dtmFechaCotizacion_PRPR datetime NOT NULL,
	dtmFechaValidez_PRPR datetime NOT NULL,
 CONSTRAINT [PK_tblPRoductoPRoveedor] PRIMARY KEY (intCodigo_PRPR) 
)

CREATE TABLE tblPROVeedor(
	strDocumento_PROV varchar(20) NOT NULL,
	strNombre_PROV varchar(50) NOT NULL,
	strRazonSocial_PROV varchar(200) NOT NULL,
	strDireccion_PROV varchar(200) NOT NULL,
	strTelefono_PROV varchar(20) NOT NULL,
	strSitioWeb_PROV varchar(200) NULL,
 CONSTRAINT [PK_tblPROVeedor] PRIMARY KEY (strDocumento_PROV)
)

CREATE TABLE tblSUCUrsal(
	intCodigo_SUCU int IDENTITY(1,1) NOT NULL,
	strNombre_SUCU varchar(50) NOT NULL,
	strDireccion_SUCU varchar(50) NOT NULL,
	strTelefono_SUCU varchar(20) NOT NULL,
	strNit_SUPE varchar(20) NOT NULL,
	intCodigo_CIUD int NOT NULL,
 CONSTRAINT [PK_tblSUCUrsal] PRIMARY KEY (intCodigo_SUCU)
)

CREATE TABLE tblSUPErmercado(
	strNit_SUPE varchar(20) NOT NULL,
	strNombre_SUPE varchar(50) NOT NULL,
	strSitioWeb_SUPE varchar(200) NOT NULL,
 CONSTRAINT [PK_tblSUPErmercado] PRIMARY KEY (strNit_SUPE)
)

CREATE TABLE tblTELEfono(
	intCodigo_TELE int IDENTITY(1,1) NOT NULL,
	strNumero_TELE varchar(20) NOT NULL,
	strDocumento_CLIE varchar(20) NOT NULL,
	intCodigo_TITE int NOT NULL,
 CONSTRAINT [PK_tblTELEfono] PRIMARY KEY (intCodigo_TELE) 
)

CREATE TABLE tblTIpoPRoducto(
	intCodigo_TIPR int IDENTITY(1,1) NOT NULL,
	strNombre_TIPR varchar(50) NOT NULL,
	blnActivo_TIPR bit NOT NULL,
 CONSTRAINT [PK_tblTIpoPRoducto] PRIMARY KEY (intCodigo_TIPR) 
)

CREATE TABLE tblTIpoTElefono(
	intCodigo_TITE int IDENTITY(1,1) NOT NULL,
	strNombre_TITE varchar(50) NOT NULL,
	blnActivo_TITE bit NOT NULL,
 CONSTRAINT [PK_tblTIpoTElefono] PRIMARY KEY (intCodigo_TITE)
)

GO
ALTER TABLE tblCIUDad  WITH CHECK ADD  CONSTRAINT FK_tblCIUDad_tblDEPArtamento FOREIGN KEY(intCodigo_DEPA) REFERENCES tblDEPArtamento (intCodigo_DEPA)
ALTER TABLE tblCIUDad CHECK CONSTRAINT FK_tblCIUDad_tblDEPArtamento
GO
ALTER TABLE tblCOntactoPRoveedor  WITH CHECK ADD  CONSTRAINT FK_tblCOntactoPRoveedor_tblPROVeedor FOREIGN KEY(strDocumento_PROV) REFERENCES tblPROVeedor (strDocumento_PROV)
ALTER TABLE tblCOntactoPRoveedor CHECK CONSTRAINT FK_tblCOntactoPRoveedor_tblPROVeedor
GO
ALTER TABLE tblDEPArtamento  WITH CHECK ADD  CONSTRAINT FK_tblDEPArtamento_tblPAIS FOREIGN KEY(intCodigo_PAIS) REFERENCES tblPAIS (intCodigo_PAIS)
ALTER TABLE tblDEPArtamento CHECK CONSTRAINT FK_tblDEPArtamento_tblPAIS
GO
ALTER TABLE tblDEtalleDEvolucion  WITH CHECK ADD  CONSTRAINT FK_tblDEtalleDEvolucion_tblDEVOlucion FOREIGN KEY(intCodigo_DEVO) REFERENCES  tblDEVOlucion (intCodigo_DEVO)
ALTER TABLE tblDEtalleDEvolucion CHECK CONSTRAINT FK_tblDEtalleDEvolucion_tblDEVOlucion
GO
ALTER TABLE tblDEtalleFActura  WITH CHECK ADD  CONSTRAINT FK_tblDEtalleFActura_tblFACTura FOREIGN KEY(intNumero_FACT) REFERENCES tblFACTura (intNumero_FACT)
ALTER TABLE tblDEtalleFActura CHECK CONSTRAINT FK_tblDEtalleFActura_tblFACTura
GO
ALTER TABLE tblDEtalleFActura   WITH CHECK ADD  CONSTRAINT FK_tblDEtalleFActura_tblPRODucto FOREIGN KEY(intCodigo_PROD) REFERENCES  tblPRODucto (intCodigo_PROD)
ALTER TABLE tblDEtalleFActura CHECK CONSTRAINT FK_tblDEtalleFActura_tblPRODucto
GO
ALTER TABLE tblDEtalleFacturaCompra   WITH CHECK ADD  CONSTRAINT FK_tblDEtalleFacturaCompra_tblFActuraCOmpra FOREIGN KEY(intNumero_FACO) REFERENCES  tblFActuraCOmpra (intCodigo_FACO)
ALTER TABLE tblDEtalleFacturaCompra CHECK CONSTRAINT FK_tblDEtalleFacturaCompra_tblFActuraCOmpra
GO
ALTER TABLE tblDEtalleFacturaCompra  WITH CHECK ADD  CONSTRAINT FK_tblDEtalleFacturaCompra_tblPRODucto FOREIGN KEY(intCodigo_PROD) REFERENCES tblPRODucto (intCodigo_PROD)
ALTER TABLE tblDEtalleFacturaCompra CHECK CONSTRAINT FK_tblDEtalleFacturaCompra_tblPRODucto
GO
ALTER TABLE tblDEVOlucion  WITH CHECK ADD  CONSTRAINT FK_tblDEVOlucion_tblCLIEnte FOREIGN KEY(strDocumento_CLIE) REFERENCES tblCLIEnte (strDocumento_CLIE)
ALTER TABLE tblDEVOlucion CHECK CONSTRAINT FK_tblDEVOlucion_tblCLIEnte
GO
ALTER TABLE tblDEVOlucion  WITH CHECK ADD  CONSTRAINT FK_tblDEVOlucion_tblEMpleadoCArgo FOREIGN KEY(intCodigo_EMCA) REFERENCES tblEMpleadoCArgo (intCodigo_EMCA)
ALTER TABLE tblDEVOlucion CHECK CONSTRAINT FK_tblDEVOlucion_tblEMpleadoCArgo
GO
ALTER TABLE tblEMpleadoCArgo  WITH CHECK ADD  CONSTRAINT FK_tblEMpleadoCArgo_tblCARGo FOREIGN KEY(intCodigo_CARG) REFERENCES tblCARGo (intCodigo_CARG)
ALTER TABLE tblEMpleadoCArgo CHECK CONSTRAINT FK_tblEMpleadoCArgo_tblCARGo
GO
ALTER TABLE tblEMpleadoCArgo  WITH CHECK ADD  CONSTRAINT FK_tblEMpleadoCArgo_tblEMPLeado FOREIGN KEY(strDocumento_EMPL) REFERENCES tblEMPLeado (strDocumento_EMPL)
ALTER TABLE tblEMpleadoCArgo CHECK CONSTRAINT FK_tblEMpleadoCArgo_tblEMPLeado
GO
ALTER TABLE tblEMpleadoCArgo  WITH CHECK ADD  CONSTRAINT FK_tblEMpleadoCArgo_tblSUCUrsal FOREIGN KEY(intCodigo_SUCU) REFERENCES tblSUCUrsal (intCodigo_SUCU)
ALTER TABLE tblEMpleadoCArgo CHECK CONSTRAINT FK_tblEMpleadoCArgo_tblSUCUrsal
GO
ALTER TABLE tblFACTura  WITH CHECK ADD  CONSTRAINT FK_tblFACTura_tblCLIEnte FOREIGN KEY(strDocumento_CLIE) REFERENCES tblCLIEnte (strDocumento_CLIE)
ALTER TABLE tblFACTura CHECK CONSTRAINT FK_tblFACTura_tblCLIEnte
GO
ALTER TABLE tblFACTura  WITH CHECK ADD  CONSTRAINT FK_tblFACTura_tblEMpleadoCArgo FOREIGN KEY(intCodigo_EMCA) REFERENCES tblEMpleadoCArgo (intCodigo_EMCA)
ALTER TABLE tblFACTura CHECK CONSTRAINT FK_tblFACTura_tblEMpleadoCArgo
GO
ALTER TABLE tblFActuraCOmpra  WITH CHECK ADD  CONSTRAINT FK_tblFActuraCOmpra_tblEMpleadoCArgo FOREIGN KEY(intCodigo_EMCA) REFERENCES tblEMpleadoCArgo (intCodigo_EMCA)
ALTER TABLE tblFActuraCOmpra CHECK CONSTRAINT FK_tblFActuraCOmpra_tblEMpleadoCArgo
GO
ALTER TABLE tblFActuraCOmpra  WITH CHECK ADD  CONSTRAINT FK_tblFActuraCOmpra_tblPROVeedor FOREIGN KEY(strDocumento_PROV) REFERENCES tblPROVeedor (strDocumento_PROV)
ALTER TABLE tblFActuraCOmpra CHECK CONSTRAINT FK_tblFActuraCOmpra_tblPROVeedor
GO
ALTER TABLE tblPRODucto  WITH CHECK ADD  CONSTRAINT FK_tblPRODucto_tblTIpoPRoducto FOREIGN KEY(intCodigo_TIPR) REFERENCES tblTIpoPRoducto (intCodigo_TIPR)
ALTER TABLE tblPRODucto CHECK CONSTRAINT FK_tblPRODucto_tblTIpoPRoducto
GO
ALTER TABLE tblPRoductoPRoveedor  WITH CHECK ADD  CONSTRAINT FK_tblPRoductoPRoveedor_tblPRODucto FOREIGN KEY(intCodigo_PROD) REFERENCES tblPRODucto (intCodigo_PROD)
ALTER TABLE tblPRoductoPRoveedor CHECK CONSTRAINT FK_tblPRoductoPRoveedor_tblPRODucto
GO
ALTER TABLE tblPRoductoPRoveedor  WITH CHECK ADD  CONSTRAINT FK_tblPRoductoPRoveedor_tblPROVeedor FOREIGN KEY(strDocumento_PROV) REFERENCES tblPROVeedor (strDocumento_PROV)
ALTER TABLE tblPRoductoPRoveedor CHECK CONSTRAINT FK_tblPRoductoPRoveedor_tblPROVeedor
GO
ALTER TABLE tblSUCUrsal  WITH CHECK ADD  CONSTRAINT FK_tblSUCUrsal_tblCIUDad FOREIGN KEY(intCodigo_CIUD) REFERENCES tblCIUDad (intCodigo_CIUD)
ALTER TABLE tblSUCUrsal CHECK CONSTRAINT FK_tblSUCUrsal_tblCIUDad
GO
ALTER TABLE tblSUCUrsal  WITH CHECK ADD  CONSTRAINT FK_tblSUCUrsal_tblSUPErmercado FOREIGN KEY(strNit_SUPE) REFERENCES tblSUPErmercado (strNit_SUPE)
ALTER TABLE tblSUCUrsal CHECK CONSTRAINT FK_tblSUCUrsal_tblSUPErmercado
GO
ALTER TABLE tblTELEfono  WITH CHECK ADD  CONSTRAINT FK_tblTELEfono_tblCLIEnte FOREIGN KEY(strDocumento_CLIE) REFERENCES tblCLIEnte (strDocumento_CLIE)
ALTER TABLE tblTELEfono CHECK CONSTRAINT FK_tblTELEfono_tblCLIEnte
GO
ALTER TABLE tblTELEfono  WITH CHECK ADD  CONSTRAINT FK_tblTELEfono_tblTIpoTElefono FOREIGN KEY(intCodigo_TITE) REFERENCES tblTIpoTElefono (intCodigo_TITE)
ALTER TABLE tblTELEfono CHECK CONSTRAINT FK_tblTELEfono_tblTIpoTElefono
GO
ALTER TABLE tblNOtaCRedito with CHECK add CONSTRAINT FK_tblNOtaCRedito_tblDEVOlucion FOREIGN KEY(intCodigo_DEVO) REFERENCES tblDEVOlucion (intCodigo_DEVO)
ALTER TABLE tblNOtaCRedito CHECK CONSTRAINT FK_tblNOtaCRedito_tblDEVOlucion
GO



