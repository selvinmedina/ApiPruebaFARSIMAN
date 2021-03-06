USE [master]
GO
/****** Object:  Database [PruebaFARSIMAN]    Script Date: 07/04/2020 12:02:17 p. m. ******/
CREATE DATABASE [PruebaFARSIMAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaFARSIMAN', FILENAME = N'C:\Users\a\PruebaFARSIMAN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaFARSIMAN_log', FILENAME = N'C:\Users\a\PruebaFARSIMAN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PruebaFARSIMAN] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaFARSIMAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaFARSIMAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PruebaFARSIMAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaFARSIMAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaFARSIMAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PruebaFARSIMAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaFARSIMAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PruebaFARSIMAN] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaFARSIMAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaFARSIMAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaFARSIMAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaFARSIMAN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaFARSIMAN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaFARSIMAN] SET QUERY_STORE = OFF
GO
USE [PruebaFARSIMAN]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PruebaFARSIMAN]
GO
/****** Object:  Table [dbo].[tbColaboradores]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbColaboradores](
	[col_Id] [int] IDENTITY(1,1) NOT NULL,
	[col_Nombre] [nvarchar](50) NULL,
	[col_Apellido] [nvarchar](50) NULL,
	[col_UsuarioCrea] [int] NOT NULL,
	[col_FechaCrea] [datetime] NOT NULL,
	[col_DistanciaSucursal] [decimal](10, 2) NULL,
	[suc_Id] [int] NULL,
 CONSTRAINT [PK_tbColaboradores_col_Id] PRIMARY KEY CLUSTERED 
(
	[col_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPrecioKilometro]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPrecioKilometro](
	[pkm_id] [int] IDENTITY(1,1) NOT NULL,
	[pkm_Cantidad] [decimal](10, 2) NULL,
	[pkm_Precio] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[pkm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSucursales]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSucursales](
	[suc_Id] [int] IDENTITY(1,1) NOT NULL,
	[suc_Nombre] [nvarchar](50) NULL,
	[suc_UsuarioCrea] [int] NOT NULL,
	[suc_FechaCrea] [datetime] NOT NULL,
 CONSTRAINT [PK_tbSucursales_suc_Id] PRIMARY KEY CLUSTERED 
(
	[suc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTransportistas]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTransportistas](
	[trans_Id] [int] IDENTITY(1,1) NOT NULL,
	[trans_Nombre] [nvarchar](50) NULL,
	[trans_Apellido] [nvarchar](50) NULL,
	[trans_UsuarioCrea] [int] NOT NULL,
	[trans_FechaCrea] [datetime] NOT NULL,
	[trans_CantidadPorKilometro] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tbTransportistas_trans_Id] PRIMARY KEY CLUSTERED 
(
	[trans_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuarios]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuarios](
	[usu_Id] [int] IDENTITY(1,1) NOT NULL,
	[usu_NombreUsuario] [nvarchar](50) NULL,
	[usu_ApellidoUsuario] [nvarchar](50) NULL,
	[usu_FechaCrea] [datetime] NULL,
	[usu_FechaModifica] [datetime] NULL,
	[usu_Password] [varbinary](64) NULL,
	[usu_NombreUsuarioLogin] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbUsuarios_usu_Id] PRIMARY KEY CLUSTERED 
(
	[usu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbViajesColaborador]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbViajesColaborador](
	[viaj_Id] [int] IDENTITY(1,1) NOT NULL,
	[trans_Id] [int] NOT NULL,
	[col_Id] [int] NOT NULL,
	[viaj_Fecha] [datetime] NOT NULL,
	[viaj_UsuarioCrea] [int] NOT NULL,
 CONSTRAINT [PK_tbViajesColaborador_viaj_Id] PRIMARY KEY CLUSTERED 
(
	[viaj_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbColaboradores]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_tbColaboradores_suc_Id] FOREIGN KEY([suc_Id])
REFERENCES [dbo].[tbSucursales] ([suc_Id])
GO
ALTER TABLE [dbo].[tbColaboradores] CHECK CONSTRAINT [FK_tbSucursales_tbColaboradores_suc_Id]
GO
ALTER TABLE [dbo].[tbColaboradores]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbColaboradores_col_UsuarioCrea] FOREIGN KEY([col_UsuarioCrea])
REFERENCES [dbo].[tbUsuarios] ([usu_Id])
GO
ALTER TABLE [dbo].[tbColaboradores] CHECK CONSTRAINT [FK_tbUsuarios_tbColaboradores_col_UsuarioCrea]
GO
ALTER TABLE [dbo].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbSucursales_suc_UsuarioCrea] FOREIGN KEY([suc_UsuarioCrea])
REFERENCES [dbo].[tbUsuarios] ([usu_Id])
GO
ALTER TABLE [dbo].[tbSucursales] CHECK CONSTRAINT [FK_tbUsuarios_tbSucursales_suc_UsuarioCrea]
GO
ALTER TABLE [dbo].[tbTransportistas]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbTransportistas_trans_UsuarioCrea] FOREIGN KEY([trans_UsuarioCrea])
REFERENCES [dbo].[tbUsuarios] ([usu_Id])
GO
ALTER TABLE [dbo].[tbTransportistas] CHECK CONSTRAINT [FK_tbUsuarios_tbTransportistas_trans_UsuarioCrea]
GO
ALTER TABLE [dbo].[tbViajesColaborador]  WITH CHECK ADD  CONSTRAINT [FK_tbColaboradores_tbViajesColaborador_col_Id] FOREIGN KEY([col_Id])
REFERENCES [dbo].[tbColaboradores] ([col_Id])
GO
ALTER TABLE [dbo].[tbViajesColaborador] CHECK CONSTRAINT [FK_tbColaboradores_tbViajesColaborador_col_Id]
GO
ALTER TABLE [dbo].[tbViajesColaborador]  WITH CHECK ADD  CONSTRAINT [FK_tbTransportistas_tbViajesColaborador_trans_Id] FOREIGN KEY([trans_Id])
REFERENCES [dbo].[tbTransportistas] ([trans_Id])
GO
ALTER TABLE [dbo].[tbViajesColaborador] CHECK CONSTRAINT [FK_tbTransportistas_tbViajesColaborador_trans_Id]
GO
ALTER TABLE [dbo].[tbViajesColaborador]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbViajesColaborador_viaj_UsuarioCrea] FOREIGN KEY([viaj_UsuarioCrea])
REFERENCES [dbo].[tbUsuarios] ([usu_Id])
GO
ALTER TABLE [dbo].[tbViajesColaborador] CHECK CONSTRAINT [FK_tbUsuarios_tbViajesColaborador_viaj_UsuarioCrea]
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login]
(
     @usuario VARCHAR(100)
   , @password  VARCHAR(64)
)
AS
    BEGIN
    SELECT tu.usu_Id,
    tu.usu_NombreUsuario
    FROM dbo.tbUsuarios tu
     WHERE tu.usu_NombreUsuarioLogin = @usuario
              AND tu.usu_Password = HASHBYTES('SHA2_512', @password);
    END;
GO
/****** Object:  StoredProcedure [dbo].[Reporte]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Reporte]
(

/*******************************************************
 LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
*******************************************************/

     @fecha1        DATETIME
   , @fecha2        DATETIME
   , @transportista INT
)
AS
    BEGIN
        SELECT
        (
            SELECT
            (
                SELECT 
			 col.col_Id AS 'Id', 
                       col.col_Nombre + ' ' + col.col_Apellido AS 'NombreColaborador', 
                       col.col_DistanciaSucursal AS 'Distancia', 
                       tu.usu_NombreUsuario + ' ' + tu.usu_ApellidoUsuario AS 'NombreUsuarioViaje', 
                       tu.usu_Id AS 'IdUsuarioViaje', 
                       col.col_DistanciaSucursal * tt.trans_CantidadPorKilometro AS 'TotalPorColaborador'
                FROM dbo.tbViajesColaborador tvc
                     INNER JOIN [dbo].[tbColaboradores] col ON tvc.col_Id = col.col_Id
                     INNER JOIN dbo.tbUsuarios tu ON tvc.viaj_UsuarioCrea = tu.usu_Id
                     INNER JOIN dbo.tbTransportistas tt ON tvc.trans_Id = tt.trans_Id
                WHERE tvc.trans_Id = @transportista
                      AND tvc.viaj_Fecha BETWEEN @fecha1 AND @fecha2 FOR JSON AUTO
            ) AS 'Colaborador', 
            (
                SELECT JSON_QUERY(
                (
                    SELECT SUM(col.col_DistanciaSucursal * tt.trans_CantidadPorKilometro) AS 'TotalTransportista'
                    FROM [dbo].[tbColaboradores] col
                         INNER JOIN dbo.tbViajesColaborador tvc ON col.col_Id = tvc.col_Id
                         INNER JOIN dbo.tbTransportistas tt ON tvc.trans_Id = tt.trans_Id
                    WHERE tt.trans_Id = @transportista
                          AND tvc.viaj_Fecha BETWEEN @fecha1 AND @fecha2
                    GROUP BY tvc.trans_Id FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
                ))
            ) AS 'TotalTransportista' FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        ) AS 'json';
    END;
GO
/****** Object:  StoredProcedure [dbo].[tbViajesColaborador_Insert]    Script Date: 07/04/2020 12:02:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tbViajesColaborador_Insert]
(

/*******************************************************
 LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
*******************************************************/

     @trans_Id INT
   , @col_Id          INT
   , @fecha DATETIME
   , @viaj_UsuarioCrea INT
)
AS
    BEGIN
        BEGIN TRAN;
        BEGIN TRY

/******
 Insert
******/

INSERT INTO [dbo].[tbViajesColaborador]
           ([trans_Id]
           ,[col_Id]
           ,[viaj_Fecha]
           ,[viaj_UsuarioCrea])
     VALUES
           (@trans_Id
           ,@col_Id
           ,@fecha
           ,@viaj_UsuarioCrea)

            COMMIT TRAN;
            SELECT CAST(SCOPE_IDENTITY() AS INT) AS 'Id', 
                   '' AS 'MensajeError';
        END TRY
        BEGIN CATCH

/*****
 Error
*****/

            ROLLBACK TRAN;
            SELECT CAST(-1 AS INT) AS 'Id', 
                   ERROR_MESSAGE() AS 'MensajeError';
        END CATCH;
    END;
GO
USE [master]
GO
ALTER DATABASE [PruebaFARSIMAN] SET  READ_WRITE 
GO
