USE [master]
GO
/****** Object:  Database [dbs_sistema_academico]    Script Date: 14/09/2023 6:40:12 p. m. ******/
CREATE DATABASE [dbs_sistema_academico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sistema_academico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\sistema_academico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sistema_academico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\sistema_academico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbs_sistema_academico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbs_sistema_academico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbs_sistema_academico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbs_sistema_academico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbs_sistema_academico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbs_sistema_academico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbs_sistema_academico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbs_sistema_academico] SET  MULTI_USER 
GO
ALTER DATABASE [dbs_sistema_academico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbs_sistema_academico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbs_sistema_academico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbs_sistema_academico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbs_sistema_academico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbs_sistema_academico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbs_sistema_academico] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbs_sistema_academico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbs_sistema_academico]
GO
/****** Object:  Table [dbo].[tbl_calificaciones]    Script Date: 14/09/2023 6:40:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_calificaciones](
	[PkItem] [int] IDENTITY(1,1) NOT NULL,
	[FkItem_tbl_det_matricula] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Nota] [varchar](10) NOT NULL,
	[Concepto] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cursos]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cursos](
	[PkId] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Creditos] [varchar](10) NOT NULL,
	[FkId_tbl_estado] [int] NOT NULL,
	[Valor] [varchar](10) NOT NULL,
	[Contenidos] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_det_matriculas]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_det_matriculas](
	[PkItem] [int] IDENTITY(1,1) NOT NULL,
	[FkN_matricula_tbl_matricula] [int] NOT NULL,
	[FkId_tbl_cursos] [varchar](10) NOT NULL,
	[Valor] [varchar](10) NOT NULL,
	[FkId_tbl_estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estado]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estado](
	[PkId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Nomenclatura] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estrato]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estrato](
	[PkId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Nomenclatura] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estudiantes]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estudiantes](
	[PkId] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Contacto] [varchar](10) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Acudiente] [varchar](100) NOT NULL,
	[FKId_tbl_estrato] [int] NOT NULL,
	[FKId_tbl_sexo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_matriculas]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_matriculas](
	[PkN_matricula] [int] IDENTITY(1,1) NOT NULL,
	[FkId_tbl_estudiantes] [varchar](10) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Subtotal] [varchar](10) NOT NULL,
	[Iva] [varchar](10) NOT NULL,
	[Total] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkN_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sexo]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sexo](
	[PkId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Nomenclatura] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_cursos] ([PkId], [Nombre], [Creditos], [FkId_tbl_estado], [Valor], [Contenidos]) VALUES (N'C001', N'Big Data', N'4', 0, N'800000', N'Bases de datos, programación web')
GO
INSERT [dbo].[tbl_estado] ([PkId], [Nombre], [Nomenclatura]) VALUES (0, N'Activo', N'A')
INSERT [dbo].[tbl_estado] ([PkId], [Nombre], [Nomenclatura]) VALUES (1, N'Inactivo', N'I')
GO
INSERT [dbo].[tbl_estrato] ([PkId], [Nombre], [Nomenclatura]) VALUES (0, N'Estrato 1', N'E1')
INSERT [dbo].[tbl_estrato] ([PkId], [Nombre], [Nomenclatura]) VALUES (1, N'Estrato 2', N'E2')
INSERT [dbo].[tbl_estrato] ([PkId], [Nombre], [Nomenclatura]) VALUES (2, N'Estrato 3', N'E3')
GO
INSERT [dbo].[tbl_estudiantes] ([PkId], [Nombre], [Contacto], [Direccion], [Acudiente], [FKId_tbl_estrato], [FKId_tbl_sexo]) VALUES (N'1007843867', N'Juan Esteban Correa Manco', N'3104291494', N'Calle 84#76-17', N'Luz Estella Manco Durango', 2, 0)
INSERT [dbo].[tbl_estudiantes] ([PkId], [Nombre], [Contacto], [Direccion], [Acudiente], [FKId_tbl_estrato], [FKId_tbl_sexo]) VALUES (N'1007843868', N'Juan Esteban Correa Manco', N'3104291494', N'Calle 84#76-17', N'Luz Estella Manco Durango', 1, 1)
INSERT [dbo].[tbl_estudiantes] ([PkId], [Nombre], [Contacto], [Direccion], [Acudiente], [FKId_tbl_estrato], [FKId_tbl_sexo]) VALUES (N'1007843869', N'Juan Esteban Correa Manco', N'3104291494', N'Calle 84#76-17', N'Luz Estella Manco Durango', 0, 0)
GO
INSERT [dbo].[tbl_sexo] ([PkId], [Nombre], [Nomenclatura]) VALUES (0, N'Masculino', N'M')
INSERT [dbo].[tbl_sexo] ([PkId], [Nombre], [Nomenclatura]) VALUES (1, N'Femenino', N'F')
INSERT [dbo].[tbl_sexo] ([PkId], [Nombre], [Nomenclatura]) VALUES (2, N'Otro', N'O')
GO
ALTER TABLE [dbo].[tbl_calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_calificaciones_tbl_det_matriculas] FOREIGN KEY([FkItem_tbl_det_matricula])
REFERENCES [dbo].[tbl_det_matriculas] ([PkItem])
GO
ALTER TABLE [dbo].[tbl_calificaciones] CHECK CONSTRAINT [FK_tbl_calificaciones_tbl_det_matriculas]
GO
ALTER TABLE [dbo].[tbl_cursos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cursos_tbl_estado] FOREIGN KEY([FkId_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([PkId])
GO
ALTER TABLE [dbo].[tbl_cursos] CHECK CONSTRAINT [FK_tbl_cursos_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_det_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_matriculas_tbl_cursos] FOREIGN KEY([FkId_tbl_cursos])
REFERENCES [dbo].[tbl_cursos] ([PkId])
GO
ALTER TABLE [dbo].[tbl_det_matriculas] CHECK CONSTRAINT [FK_tbl_det_matriculas_tbl_cursos]
GO
ALTER TABLE [dbo].[tbl_det_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_matriculas_tbl_estado] FOREIGN KEY([FkId_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([PkId])
GO
ALTER TABLE [dbo].[tbl_det_matriculas] CHECK CONSTRAINT [FK_tbl_det_matriculas_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_det_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_matriculas_tbl_matriculas] FOREIGN KEY([FkN_matricula_tbl_matricula])
REFERENCES [dbo].[tbl_matriculas] ([PkN_matricula])
GO
ALTER TABLE [dbo].[tbl_det_matriculas] CHECK CONSTRAINT [FK_tbl_det_matriculas_tbl_matriculas]
GO
ALTER TABLE [dbo].[tbl_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_estudiantes_tbl_estrato] FOREIGN KEY([FKId_tbl_estrato])
REFERENCES [dbo].[tbl_estrato] ([PkId])
GO
ALTER TABLE [dbo].[tbl_estudiantes] CHECK CONSTRAINT [FK_tbl_estudiantes_tbl_estrato]
GO
ALTER TABLE [dbo].[tbl_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_estudiantes_tbl_sexo] FOREIGN KEY([FKId_tbl_sexo])
REFERENCES [dbo].[tbl_sexo] ([PkId])
GO
ALTER TABLE [dbo].[tbl_estudiantes] CHECK CONSTRAINT [FK_tbl_estudiantes_tbl_sexo]
GO
ALTER TABLE [dbo].[tbl_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_matriculas_tbl_estudiantes] FOREIGN KEY([FkId_tbl_estudiantes])
REFERENCES [dbo].[tbl_estudiantes] ([PkId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tbl_matriculas] CHECK CONSTRAINT [FK_tbl_matriculas_tbl_estudiantes]
GO
/****** Object:  StoredProcedure [dbo].[SP_consultarCurso]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Juan Correa>
-- Create date: <Create Date,,12/09/2023>
-- Description:	<Description,,Creación de consulta de datos cursos>
-- =============================================
Create PROCEDURE [dbo].[SP_consultarCurso]
@id varchar(10)
AS
BEGIN
	select *
	from tbl_cursos 
	where PkId=@id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_consultarEstrato]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Juan Correa>
-- Create date: <Create Date,,07/09/2023>
-- Description:	<Description,,Creación de consulta de datos estrato>
-- =============================================
create PROCEDURE [dbo].[SP_consultarEstrato]

AS
BEGIN

	SELECT * from tbl_estrato
END
GO
/****** Object:  StoredProcedure [dbo].[SP_consultarEstudiante]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Juan Correa>
-- Create date: <Create Date,,07/09/2023>
-- Description:	<Description,,Creación de consulta de datos estudiantes>
-- =============================================
CREATE PROCEDURE [dbo].[SP_consultarEstudiante]
@id varchar(10)
AS
BEGIN
	select *
	from tbl_estudiantes 
	where PkId=@id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_consultarSexo]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Juan Correa>
-- Create date: <Create Date,,07/09/2023>
-- Description:	<Description,,Creación de consulta de datos sexo>
-- =============================================
CREATE PROCEDURE [dbo].[SP_consultarSexo]

AS
BEGIN

	SELECT * from tbl_sexo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_guardarCurso]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Autor, Juan Correa>
-- Create date: <Creado, 12/09/2023>
-- Description: <Procedimiento guardar cursos>
-- =============================================
create procedure [dbo].[SP_guardarCurso]
@id varchar(10), @nombre varchar(100), @creditos varchar(10),@estado varchar(100),@valor varchar(10), @contenidos varchar(50)
as begin
	declare @busca int
	select @busca = (select count (*) from tbl_cursos where PkId = @id)
	if @busca = 1
		begin
				print 'Este curso se encuentra registrado'
			end
		if @busca = 0
			begin
				insert into tbl_cursos(PkId,Nombre,Creditos,FkId_tbl_estado,Valor,Contenidos)
				values (@id,@nombre,@creditos,@estado,@valor,@contenidos)
			end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_guardarEstudiante]    Script Date: 14/09/2023 6:40:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Autor, Juan Correa>
-- Create date: <Creado, 24/08/2023>
-- Description: <Procedimiento aprobar guardar estudiante>
-- =============================================
create procedure [dbo].[SP_guardarEstudiante]
@id varchar(10), @nombre varchar(100), @contacto varchar(10),@direccion varchar(100),@acudiente varchar(100), @estrato int, @sexo int
as begin
	declare @busca int
	select @busca = (select count (*) from tbl_estudiantes where PkId = @id)
	if @busca = 1
		begin
				print 'Este estudiante se encuentra registrado'
			end
		if @busca = 0
			begin
				insert into tbl_estudiantes (PkId,Nombre,Contacto,Direccion,Acudiente,FKId_tbl_estrato,FKId_tbl_sexo)
				values (@id,@nombre,@contacto,@direccion,@acudiente,@estrato,@sexo)
			end
end
GO
USE [master]
GO
ALTER DATABASE [dbs_sistema_academico] SET  READ_WRITE 
GO
