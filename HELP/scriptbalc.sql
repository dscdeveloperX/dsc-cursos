USE [DB_Balcon_Parametros]
GO
/****** Object:  Table [dbo].[AuditoriaParametros]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaParametros](
	[AuditoriaId] [bigint] IDENTITY(1,1) NOT NULL,
	[TablaNombre] [nvarchar](50) NOT NULL,
	[TablaId] [bigint] NULL,
	[Operacion] [nvarchar](10) NULL,
	[FechaHora] [datetime] NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[IpOrigen] [nvarchar](20) NULL,
	[ValorAnterior] [nvarchar](max) NULL,
	[ValorNuevo] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditoriaParametros_auditoria_id] PRIMARY KEY CLUSTERED 
(
	[AuditoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campo]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campo](
	[CampoId] [bigint] IDENTITY(1,1) NOT NULL,
	[ModeloId] [bigint] NOT NULL,
	[TipoValor] [nvarchar](10) NOT NULL,
	[Etiqueta] [nvarchar](200) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[TipoCampo] [nvarchar](50) NULL,
	[TipoDato] [nvarchar](50) NOT NULL,
	[TipoCalculado] [nvarchar](50) NULL,
	[NombreCalculo] [nvarchar](200) NULL,
	[ValoresCalculo] [nvarchar](200) NULL,
	[LongitudMinima] [int] NOT NULL,
	[LongitudMaxima] [int] NOT NULL,
	[OrdenSeccion] [int] NULL,
	[Seccion] [nvarchar](50) NOT NULL,
	[OrdenSubseccion] [int] NULL,
	[Subseccion] [nvarchar](50) NOT NULL,
	[OrdenCampo] [int] NOT NULL,
	[OrigenCombobox] [nvarchar](10) NULL,
	[OrigenEtiqueta] [nchar](20) NULL,
	[OrigenValores] [nvarchar](max) NULL,
	[OrigenCatalogo] [nchar](30) NULL,
	[CampoAS400] [nvarchar](150) NULL,
	[Obligatorio] [bit] NOT NULL,
	[PermiteEnmascaramiento] [bit] NOT NULL,
	[DatoSensible] [bit] NOT NULL,
 CONSTRAINT [PK_Campo] PRIMARY KEY CLUSTERED 
(
	[CampoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[CatalogoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Codigo] [nvarchar](256) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Complemento] [nvarchar](256) NULL,
	[Estado] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Catalogo] PRIMARY KEY CLUSTERED 
(
	[CatalogoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Correo]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correo](
	[CorreoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Asunto] [varchar](100) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[IsHtml] [bit] NOT NULL,
	[NumeroReitento] [int] NOT NULL,
	[Remitente] [nvarchar](100) NOT NULL,
	[CodigoProceso] [int] NULL,
 CONSTRAINT [PK_Correo] PRIMARY KEY CLUSTERED 
(
	[CorreoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formato]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formato](
	[FormatoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](40) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[TipoPersona] [varchar](1) NOT NULL,
	[TipoIdentificacion] [varchar](1) NOT NULL,
	[TipoCliente] [varchar](2) NOT NULL,
	[PersonaId] [bigint] NOT NULL,
	[ProductoId] [bigint] NULL,
	[indicadorGraba] [int] NULL,
	[IndicadorGrabaPersona] [int] NULL,
	[IndicadorGrabaProducto] [int] NULL,
 CONSTRAINT [PK_Formato] PRIMARY KEY CLUSTERED 
(
	[FormatoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormatoDetalle]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormatoDetalle](
	[FormatoDetalleId] [bigint] IDENTITY(1,1) NOT NULL,
	[FormatoId] [bigint] NOT NULL,
	[CampoId] [bigint] NOT NULL,
	[Etiqueta] [varchar](200) NOT NULL,
	[LongitudMinima] [int] NOT NULL,
	[LongitudMaxima] [int] NOT NULL,
	[Enmascarar] [bit] NOT NULL,
	[Visible] [bit] NOT NULL,
	[DependenciaVisibilidad] [varchar](50) NULL,
	[ReglaDependenciaVisibilidad] [varchar](10) NULL,
	[ValoresDependenciaVisibilidad] [varchar](max) NULL,
	[Requerido] [bit] NOT NULL,
	[DependenciaRequerido] [varchar](50) NULL,
	[ReglaDependenciaRequerido] [varchar](10) NULL,
	[ValoresDependenciaRequerido] [varchar](max) NULL,
	[Editable] [bit] NOT NULL,
	[DependenciaEditable] [varchar](50) NULL,
	[ReglaDependenciaEditable] [varchar](10) NULL,
	[ValoresDependenciaEditable] [varchar](max) NULL,
	[TipoValidacion] [nvarchar](50) NULL,
	[DependenciaValidacion] [varchar](50) NULL,
	[ReglaDependenciaValidacion] [varchar](10) NULL,
	[ValoresDependenciaValidacion] [varchar](max) NULL,
	[ValidacionRegex] [varchar](100) NULL,
	[ValidacionReglas] [varchar](100) NULL,
	[ValidacionRutina] [varchar](100) NULL,
	[ValidacionRutinaCampos] [varchar](100) NULL,
	[ComboboxPermiteNinguno] [bit] NULL,
	[TipoFiltro] [nchar](15) NULL,
	[DependenciaFiltro] [varchar](50) NULL,
	[ReglaDependenciaFiltro] [varchar](15) NULL,
	[ValoresDependenciaFiltro] [varchar](max) NULL,
	[TipoValorDefecto] [nchar](15) NULL,
	[DependenciaValorDefecto] [varchar](50) NULL,
	[ReglaDependenciaValorDefecto] [varchar](15) NULL,
	[ValoresDependenciaValorDefecto] [varchar](max) NULL,
	[AnchoColumna] [nvarchar](4) NOT NULL,
	[FormularioVisible] [bit] NOT NULL,
	[EtiquetaFormulario] [nvarchar](200) NULL,
	[AnchoColumnaFormulario] [nvarchar](4) NULL,
	[AnchoEtiquetaFormulario] [nvarchar](4) NULL,
 CONSTRAINT [PK_FormatoDetalle] PRIMARY KEY CLUSTERED 
(
	[FormatoDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MapaError]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapaError](
	[ErrorId] [bigint] IDENTITY(1,1) NOT NULL,
	[Servicio] [nvarchar](100) NOT NULL,
	[Codigo] [nvarchar](30) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[CodigoMensaje] [nvarchar](30) NOT NULL,
	[RequiereReintento] [bit] NOT NULL,
 CONSTRAINT [PK_MapaError] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[ModeloId] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[TipoModelo] [varchar](30) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[menuId] [varchar](10) NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[ModeloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonitorBalcon]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonitorBalcon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodPrd] [varchar](5) NOT NULL,
	[Fecha] [date] NULL,
	[Hora] [time](7) NULL,
	[CodEve] [varchar](20) NULL,
	[TipDoc] [varchar](1) NULL,
	[DocCli] [varchar](15) NULL,
	[Cuenta] [varchar](25) NULL,
	[CodOfiLogin] [varchar](5) NULL,
	[AgeOfiLogin] [varchar](3) NULL,
	[Ip] [varchar](20) NULL,
	[Referencia] [varchar](50) NULL,
	[NumComp] [varchar](15) NULL,
	[Canal] [varchar](4) NULL,
	[TarjCred] [varchar](15) NULL,
	[TipPrd] [varchar](2) NULL,
	[Produ] [varchar](2) NULL,
	[SubPrd] [varchar](2) NULL,
	[ValTran1] [decimal](15, 4) NULL,
	[ValTran2] [decimal](15, 4) NULL,
	[ValTran3] [decimal](15, 4) NULL,
	[Fecha1] [datetime] NULL,
	[Fecha2] [datetime] NULL,
	[Fecha3] [datetime] NULL,
	[Trama] [nvarchar](max) NULL,
	[TramaJson] [nvarchar](max) NULL,
	[FecReg] [datetime] NULL,
	[UsrReg] [varchar](40) NULL,
	[IpReg] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudCambio]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudCambio](
	[IdCambio] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioSolicitante] [varchar](50) NOT NULL,
	[UsuarioAprobador] [varchar](50) NULL,
	[FechaSolicitud] [datetime] NOT NULL,
	[FechaAprobacion] [datetime] NULL,
	[Estado] [varchar](20) NOT NULL,
	[Data] [varchar](max) NOT NULL,
	[Accion] [varchar](20) NOT NULL,
	[Funcionalidad] [varchar](100) NOT NULL,
	[DetallesDataAntes] [varchar](max) NULL,
	[DetallesDataDespues] [varchar](max) NULL,
	[TipoRol] [varchar](20) NULL,
	[IdentificadorFuncionalidad] [int] NOT NULL,
	[DescripcionFuncionalidad] [varchar](255) NULL,
	[IdentificadorCambio] [nvarchar](50) NULL,
	[DescripcionCambio] [nvarchar](100) NULL,
	[RazonRechazo] [nvarchar](255) NULL,
	[CorreoClienteSolicitud] [nvarchar](255) NULL,
	[CorreoEjecutivoSolicitud] [nvarchar](255) NULL,
	[AgenciaSolitud] [varchar](3) NULL,
	[AgenciaSolicitud] [varchar](3) NULL,
 CONSTRAINT [PK_SolicitudCambio] PRIMARY KEY CLUSTERED 
(
	[IdCambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_Catalogo]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_Catalogo](
	[CatalogoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
	[Codigo] [nvarchar](256) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Complemento] [nvarchar](256) NULL,
	[Estado] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatalogoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trama]    Script Date: 10/10/2024 06:24:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trama](
	[TramaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Servicio] [nvarchar](100) NOT NULL,
	[Estado] [nvarchar](10) NOT NULL,
	[FechaRequest] [datetime] NOT NULL,
	[TramaRequest] [nvarchar](max) NOT NULL,
	[FechaResponse] [datetime] NULL,
	[TramaResponse] [nvarchar](max) NULL,
	[TipoValor] [nvarchar](50) NOT NULL,
	[Valor] [nvarchar](100) NOT NULL,
	[Ip] [nvarchar](15) NOT NULL,
	[Usuario] [nvarchar](256) NOT NULL,
	[Hilo] [int] NOT NULL,
 CONSTRAINT [PK_Trama] PRIMARY KEY CLUSTERED 
(
	[TramaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditoriaParametros] ADD  DEFAULT ((0)) FOR [TablaId]
GO
ALTER TABLE [dbo].[AuditoriaParametros] ADD  DEFAULT (getdate()) FOR [FechaHora]
GO
ALTER TABLE [dbo].[Correo] ADD  CONSTRAINT [DF_Correo_CodigoProceso]  DEFAULT (NULL) FOR [CodigoProceso]
GO
ALTER TABLE [dbo].[Formato] ADD  DEFAULT ((1)) FOR [indicadorGraba]
GO
ALTER TABLE [dbo].[Formato] ADD  DEFAULT ((1)) FOR [IndicadorGrabaPersona]
GO
ALTER TABLE [dbo].[Formato] ADD  DEFAULT ((1)) FOR [IndicadorGrabaProducto]
GO
ALTER TABLE [dbo].[SolicitudCambio] ADD  DEFAULT ('0') FOR [AgenciaSolitud]
GO
ALTER TABLE [dbo].[SolicitudCambio] ADD  DEFAULT ('0') FOR [AgenciaSolicitud]
GO
ALTER TABLE [dbo].[AuditoriaParametros]  WITH CHECK ADD  CONSTRAINT [CK_AuditoriaParametros_Operacion] CHECK  (([Operacion]='DELETE' OR [Operacion]='UPDATE' OR [Operacion]='INSERT'))
GO
ALTER TABLE [dbo].[AuditoriaParametros] CHECK CONSTRAINT [CK_AuditoriaParametros_Operacion]
GO
