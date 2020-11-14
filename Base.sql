USE [master]
GO
/****** Object:  Database [Bodegas]    Script Date: 09/10/2020 16:11:51 ******/
CREATE DATABASE [Bodegas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bodegas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bodegas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Bodegas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bodegas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bodegas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bodegas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bodegas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bodegas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bodegas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bodegas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bodegas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bodegas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bodegas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bodegas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bodegas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bodegas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bodegas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bodegas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bodegas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bodegas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bodegas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bodegas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bodegas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bodegas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bodegas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bodegas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bodegas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bodegas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bodegas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bodegas] SET  MULTI_USER 
GO
ALTER DATABASE [Bodegas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bodegas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bodegas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bodegas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Bodegas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bodegas] SET QUERY_STORE = OFF
GO
USE [Bodegas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[cod_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[nit] [nchar](10) NULL,
	[telefono] [int] NULL,
	[direccion] [nchar](50) NULL,
	[credito] [int] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mostrarclientes]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mostrarclientes]
AS
SELECT        cod_cliente, nombres, apellidos, nit, telefono, direccion, credito, estado
FROM            dbo.Clientes
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[cod_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[n_proveedor] [varchar](70) NULL,
	[telefono] [int] NULL,
	[correo] [varchar](30) NULL,
 CONSTRAINT [PK_proveedores] PRIMARY KEY CLUSTERED 
(
	[cod_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mostrarproveedores]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[mostrarproveedores]
as
SELECT cod_proveedor ,n_proveedor,telefono,correo from proveedores
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[n_producto] [varchar](50) NULL,
	[unidad] [varchar](50) NULL,
	[stock] [int] NULL,
	[moneda] [nchar](20) NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mostrarproducto]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mostrarproducto]
AS
SELECT        id_producto, n_producto, unidad, stock, moneda, precio
FROM            dbo.Productos
GO
/****** Object:  View [dbo].[datosf]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[datosf]
AS
SELECT        cod_cliente, { fn CONCAT(nombres, apellidos) } AS Nombres, direccion, nit
FROM            dbo.Clientes
GO
/****** Object:  Table [dbo].[credito]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[credito](
	[id_cliente] [int] NULL,
	[nombre] [varchar](50) NULL,
	[moneda] [nchar](10) NULL,
	[credito] [int] NULL,
	[diferencia] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 09/10/2020 16:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[contraseña] [nvarchar](50) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (1, N'Juan', N'Perez', N'123456789 ', 23456789, N'1ra Ave. zona 10 Guatemala                        ', 1000, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (2, N'Maria', N'Luna', N'34534523  ', 98452345, N'1ra ave. zona 1 Capitalina                        ', 5000, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (3, N'Joel Humberto', N'Paiz Brol', N'37845261  ', 58673831, N'1ra calle f 2-08 la ceiba escuintla               ', 3000, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (4, N'Lorenzo', N'Aguirre', N'12345-9   ', 23456789, N'13va calle 2-09 colonia maestro                   ', 0, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (5, N'Luz Maria', N'CIfuentes de la vid', N'3423459-9 ', 45324312, N'1ra avenida zona 0 Guatemala                      ', 0, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (10, N'Luz', N'Noceda', N'123456-8  ', 45623596, N'Ciudad                                            ', 0, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (11, N'Amity', N'Blight', N'123456-9  ', 45821563, N'Ciudad                                            ', 0, 1)
GO
INSERT [dbo].[Clientes] ([cod_cliente], [nombres], [apellidos], [nit], [telefono], [direccion], [credito], [estado]) VALUES (12, N'Eda', N'Clawtorne', N'123456-7  ', 75849653, N'Ciudad                                            ', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[credito] ([id_cliente], [nombre], [moneda], [credito], [diferencia]) VALUES (3, N'Joel Humberto', N'Quetzales ', 1500, 0)
GO
INSERT [dbo].[credito] ([id_cliente], [nombre], [moneda], [credito], [diferencia]) VALUES (2, N'Maria', N'Dolares   ', 1500, 0)
GO
INSERT [dbo].[credito] ([id_cliente], [nombre], [moneda], [credito], [diferencia]) VALUES (1, N'Juan', N'PesoMX    ', 1500, 0)
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([id_producto], [n_producto], [unidad], [stock], [moneda], [precio]) VALUES (3, N'Maiz', N'Quintal', 12, N'Quetzal             ', 50.3)
GO
INSERT [dbo].[Productos] ([id_producto], [n_producto], [unidad], [stock], [moneda], [precio]) VALUES (4, N'Frijol', N'Kilo', 35, N'Quetzal             ', 23.5)
GO
INSERT [dbo].[Productos] ([id_producto], [n_producto], [unidad], [stock], [moneda], [precio]) VALUES (6, N'Arroz', N'Libra', 20, N'Quetzal             ', 6.5)
GO
INSERT [dbo].[Productos] ([id_producto], [n_producto], [unidad], [stock], [moneda], [precio]) VALUES (8, N'Aguacate', N'Libra', 100, N'Quetzal             ', 12)
GO
INSERT [dbo].[Productos] ([id_producto], [n_producto], [unidad], [stock], [moneda], [precio]) VALUES (1009, N'Concentrado Perro', N'Libra', 100, N'Dollares            ', 12)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedores] ON 
GO
INSERT [dbo].[proveedores] ([cod_proveedor], [n_proveedor], [telefono], [correo]) VALUES (1, N'Joel Humberto Paiz Brol', 58673831, N'arceusmaximo@gmail.com')
GO
INSERT [dbo].[proveedores] ([cod_proveedor], [n_proveedor], [telefono], [correo]) VALUES (2, N'Fabian Maltez', 54673823, N'fmaltez@gmail.com')
GO
INSERT [dbo].[proveedores] ([cod_proveedor], [n_proveedor], [telefono], [correo]) VALUES (5, N'Joselyn eunice Paiz Brol', 56453423, N'jeunice@gmail.com')
GO
INSERT [dbo].[proveedores] ([cod_proveedor], [n_proveedor], [telefono], [correo]) VALUES (6, N'Mariana Del valle', 56435678, N'Marianadvalle@yahoo.com')
GO
SET IDENTITY_INSERT [dbo].[proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id_usuario], [usuario], [contraseña]) VALUES (1, N'admin', N'1234hola')
GO
INSERT [dbo].[usuarios] ([id_usuario], [usuario], [contraseña]) VALUES (3, N'Juancarlos', N'1234')
GO
INSERT [dbo].[usuarios] ([id_usuario], [usuario], [contraseña]) VALUES (4, N'Joel', N'1234')
GO
INSERT [dbo].[usuarios] ([id_usuario], [usuario], [contraseña]) VALUES (5, N'Miqueas', N'1234')
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_estado]  DEFAULT ((0)) FOR [credito]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_estado_1]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[credito] ADD  CONSTRAINT [DF_credito_credito]  DEFAULT ((0)) FOR [credito]
GO
ALTER TABLE [dbo].[credito] ADD  CONSTRAINT [DF_credito_diferencia]  DEFAULT ((0)) FOR [diferencia]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado: 1 = activo
0= inactivo
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Clientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clientes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'datosf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'datosf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clientes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mostrarclientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mostrarclientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mostrarproducto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mostrarproducto'
GO
USE [master]
GO
ALTER DATABASE [Bodegas] SET  READ_WRITE 
GO
