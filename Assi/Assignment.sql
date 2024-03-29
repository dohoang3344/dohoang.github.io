USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 12/18/2019 11:22:06 AM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[controller_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_items]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_items](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[name] [nvarchar](150) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](150) NULL,
	[address] [nvarchar](500) NULL,
 CONSTRAINT [PK__Orders__46596229E1C8CF8F] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[detail] [nvarchar](255) NULL,
	[guarantee] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[product_price] [float] NOT NULL,
	[product_image] [nvarchar](255) NOT NULL,
	[product_quantity] [int] NULL,
	[import_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/18/2019 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[controller_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[controller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (1, N'Asus')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (2, N'MSI')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (3, N'Gigabyte')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (4, N'SamSung')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (5, N'Intel')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (6, N'HP')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (7, N'LG')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (8, N'AMD')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (9, N'Leopold')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (10, N'Logitech')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (11, N'Cooler Master')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (12, N'Kingston')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (13, N'SeaSonic')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (14, N'Cosair')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (15, N'Geforce')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (16, N'Lenovo')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (17, N'Razer')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (20, N'Microsoft')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (21, N'Apple')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (25, N'Huawei')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Laptop')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'CPU-Bộ Vi Xử Lý')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Ổ Cứng SSD')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Ổ Cứng HDD')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Mainboard-Bo Mạch Chủ')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (6, N'Bàn Phím-Chuột')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (7, N'PSU_Nguồn Máy Tính')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (8, N'Ram-Bộ Nhớ Trong')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (9, N'Case-Vỏ Máy Tính')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (10, N'VGA-Card Màn Hình')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (11, N'Màn Hình')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (17, N'Điện Thoại')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([customer_id], [username], [password], [name], [phone], [email], [address], [controller_id]) VALUES (1, N'hoang123tnv', N'hoang123', N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên', 1)
INSERT [dbo].[Customers] ([customer_id], [username], [password], [name], [phone], [email], [address], [controller_id]) VALUES (2, N'hoang123tnvn', N'hoang1', N'Đỗ Đức Hải', N'0912121212', N'mau1999@gmai.com', N'Hà Ðông', 2)
INSERT [dbo].[Customers] ([customer_id], [username], [password], [name], [phone], [email], [address], [controller_id]) VALUES (3, N'hoang123', N'1', N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên', 2)
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (1, 1, 2, 47978000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (2, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (2, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (2, 3, 1, 6399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (3, 4, 1, 5859000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (3, 15, 1, 20490000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (3, 18, 1, 4589000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (6, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (6, 14, 1, 6198000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (6, 21, 1, 8949000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (9, 19, 1, 5299000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (10, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (10, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (11, 3, 1, 6399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (11, 5, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (12, 8, 1, 42199000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (14, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (14, 3, 1, 6399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (15, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (18, 12, 3, 65997000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (19, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (19, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (21, 3, 2, 12798000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (21, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (25, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (25, 3, 2, 12798000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (26, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (4, 32, 1, 1699000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (4, 21, 1, 8949000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (22, 30, 2, 4118000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (22, 29, 1, 4799000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (5, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (5, 3, 1, 6399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (5, 5, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (7, 1, 1, 23989000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (7, 9, 1, 2990000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (7, 11, 1, 4399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (8, 9, 1, 2990000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (8, 12, 1, 21999000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (8, 15, 1, 20490000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (13, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (13, 3, 1, 6399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (16, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (16, 3, 1, 6399000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (17, 14, 1, 6198000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (17, 18, 1, 4589000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (20, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (20, 1, 2, 47978000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (23, 19, 0, 0)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (23, 2, 1, 25499000)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (24, 19, 0, 0)
INSERT [dbo].[Order_items] ([order_id], [product_id], [quantity], [list_price]) VALUES (24, 2, 2, 50998000)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (1, 2, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Hải', N'0987654321', N'haingu123@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (2, 2, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'mau1999@gmai.com', N'Hà Nam')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (3, 2, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Mẩu', N'0912128986', N'mau1999@gmai.com', N'Hà Tây')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (4, 3, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Duy Anh', N'0944444444', N'anh.doduy.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (5, 2, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Hải', N'0912121212', N'mau1999@gmai.com', N'Hà Ðông')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (6, 2, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Anh', N'0984935259', N'anh1999@gmai.com', N'Tổ 1,P.Hoàng Văn Thụ,Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (7, 2, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Hải', N'0912121212', N'mau1999@gmai.com', N'Hà Ðông')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (8, 3, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (9, 3, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-07' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (10, 2, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hải', N'0912121212', N'mau1999@gmai.com', N'Hà Ðông')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (11, 3, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (12, 3, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (13, 3, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (14, 3, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (15, 3, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (16, 3, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-08' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (17, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (18, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (19, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (20, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (21, 2, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hải', N'0912121212', N'mau1999@gmai.com', N'Hà Ðông')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (22, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (23, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (24, 3, CAST(N'2019-11-06' AS Date), CAST(N'2019-11-09' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (25, 2, CAST(N'2019-11-11' AS Date), CAST(N'2019-11-14' AS Date), N'Đỗ Đức Hải', N'0912121212', N'mau1999@gmai.com', N'Hà Ðông')
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [shipped_date], [name], [phone], [email], [address]) VALUES (26, 3, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-15' AS Date), N'Đỗ Đức Hoàng', N'0984935259', N'hoang.doduc.3@gmail.com', N'Thái Nguyên')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (1, N'- Case máy tính mới nhất của Asus có khả năng chịu va dập từ lực bên ngoài, mặt cường lực rất tốt', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (2, N'- Bộ vi xử lý Core i7-8750H
Chipset Intel® HM370
Bộ nhớ trong 8GB DDR4 (2666Mhz)
VGA NVidia GeForce® GTX 1650, 4GB GDDR5 Max Q
Ổ cứng 256GB NVMe PCIe SSD
Khả năng mở rộng lưu trữ:
SSD: 1x M.2 SSD Combo slot (NVMe PCIe Gen3 / SATA)', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (3, N'- Chip đồ họa: NVIDIA GeForce GTX 1660
- Bộ nhớ: 6GB GDDR5 ( 192-bit )
- GPU clock 1830 MHz (Reference Card is 1785 MHz)
- Nguồn phụ: 1 x 8-pin', N'Bảo hành 3 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (4, N'- Chuẩn mainboard: ATX
- Socket: AM4 , Chipset: X570
- Hỗ trợ RAM: DDR4 , tối đa 128GB
- Cổng cắm lưu trữ: 2 x M.2 SATA/NVMe; 8 x SATA 3 6Gb/s
- Cổng xuất hình: 1 x DisplayPort; 1 x HDMI', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (5, N'- Kích thước: 23.5"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Thời gian phản hồi: 4 ms', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (6, N'- 256GB SATA3 6Gb/s 2.5" (Read 550MB/s Write 500MB/s)', N'Bảo hành 1 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (7, N'- i7 8565 / 8GB RAM / 512GB SSD / 15.6" FHD / MX250 2GB / FP / Win 10 / Bạc', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (8, N'- 2.20GHz / 19.25MB / 14 Cores, 28 Threads / Socket P (LGA3647) (Intel Xeon Scalable)', N'Bảo hành 3 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (9, N'- Kích thước 251 x 545 x 552 mm ( W x D x H )Dạng case ATX Mid TowerThiết kế cho main ATX/micro ATX/Mini ITX/EATX (12”x10.9”)Ổ cứng 4 x Int x 2.5”/3.5” Combo Bay | 3 x Int x 2.5” Bay ', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (10, N'- HP 27x 3WL53AA – Đen- Kích thước: 27 inch- Tấm nền: TN- Độ phân giải: Full HD (1920x1080)- Tốc độ làm mới: 144Hz- Thời gian đáp ứng: 1ms- Cổng kết nối: HDMI 2.0 + Display Port 1.2- Phụ kiện: Cáp nguồn, Cáp HDMI', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (11, N'- Chủng loại 27MP59G-P
Kích Thước Màn Hình 27 INCH
Độ Sáng Màn Hình
250 cd/m²
Tỉ Lệ Tương Phản Động MEGA Mega
Độ Phân Giải Màn Hình 1920 x 1080
Thời Gian Đáp Ứng 5ms', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (12, N'- Ryzen7 3750H / 8GB RAM / 512GB SSD / 15.6" FHD / GTX 1650 4GB /Win 10', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (13, N'- 3900X 3.8 GHz (4.6GHz Max Boost) / 70MB Cache / 12 cores / 24 threads / 105W', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (14, N'- Công suất thực 1200W* Tiêu chuẩn 80Plus Platinum* Dây cáp dẹp, Full modular* Fan LED iRGB 16.8 triệu màu* Zero fan 140mm* 100% tụ Nhật* Công nghệ DPS G quản lý năng lượng thông minh* Cảnh báo tự động khi có sự cố về nguồn', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (15, N'- EVGA GeForce RTX 2080 BLACK EDITION GAMING (08G-P4-2081-KR)- Dung lượng bộ nhớ: 8GB GDDR6- Boost Clock: 1710 MHz- Băng thông: 256 bit- Kết nối: DisplayPort, USB Type-C, HDMI- Nguồn yêu cầu: 650W', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (16, N'- 2280 F8N 512GB (Read 1850MB/s Write 1500MB/s)', N'Bảo hành 1 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (17, N'- 3.0Ghz turbo up to 4.7 Ghz / 12MB / 8 Cores, 8 Threads / Socket 1151 / Coffee Lake', N'Bảo hành 3 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (18, N'- THERMALTAKE View 71 Tempered Glass Snow Edition (CA-1I7-00F6WN-00)- Kiểu case: Full Tower- Kích thước: 592 x 274 x 577 mm. Nặng 19.1kg- Cửa sổ kính cường lực 4*5mm, trái, phải, trên, trước.- Hỗ trợ main: Mini ITX, Micro ATX, ATX, E-ATX.', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (19, N'- HDD 3.5 Inch (Ổ cứng Desktop) Western Digital Caviar Black 4 TB
- 256MB cache
- SATA 6.0Gb/s (WD4005FZBX)
- Vòng quay: 7200rpm /
- Dung lượng bộ nhớ đệm (Cache): 256MB', N'Bảo hành 4 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (20, N'- Dung lượng: 512Gb
- Tốc độ đọc (SSD): 3500MB/s
- Tốc độ ghi (SSD): 2300MB/s
- Chuẩn giao tiếp: PCIE
- Kích thước: M2.2280', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (21, N'- Dung lượng: 10TB
- Kích thước: 3.5"
- Kết nối: SATA 3
- Tốc độ vòng quay: 7200RPM', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (23, N'- Sản phẩm Card đồ họa VGA 
Hãng sản xuất Inno3D
Engine đồ họa NVIDIA® GeForce RTX™ 2080 Ti
Chuẩn Bus PCI-E 3.0
CUDA Cores 4352 
Xung Nhịp Nhân Đồ Họa 1695
Dung lượng bộ nhớ 11GB GDDR6
 Xung Nhịp bộ nhớ 14 GbplayPort 1.4, 1x USB-C
', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (24, N'- Bàn phím cơ Leopold FC660M PD Black Brown switchBàn phím cơ cao cấp của Hàn Quốc sử dụng công tắc cơ khí Cherry MX BrownĐộ bền công tắc lên tới 50 triệu lần bấmThiết kế nút bấm, mạch và lớp vỏ thông minh giúp cho cảm giác gõ phím tốt nhất', N'Bảo hành 3 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (25, N'- Được thiết kế dành cho fan hâm mộ của marvel - Điều khiển không dây 10 mét - Tuổi thọ pin 12 tháng - Kết nối có khả năng phát ngay sau khi cắm đơn giản', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (26, N'- Công suất: 750WChứng nhận: 80 PLUS GoldChuẩn nguồn: ATXKích thước: 160(L) x 150(B) x 86(H)mmCổng kết nối: (4+4pin) x 1 , 8PIN x 1 CPU, 12 sata, 4 ata, 4 PCI Express 6+2 pin', N'Bảo hành 3 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (27, N'- Ổ cứng WD Red 3TB WD30EFRX chuẩn kết nối SATA3 6Gb/s tốc độ ghi tới 147MB/s (max), bộ đệm 64MB Cache, tốc độ vòng quay 5400RPM. HDD WD Red hoạt động bền bỉ 24/7 tối ưu cho thiết bị lưu trữ mạng NAS từ 1 - 8 bay.', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (28, N'- Hãng sản xuất SILICON POWER
Chủng loại DDRAM 4 SILICON POWER 4GB/2400 UDIMM Heatsink 
Dung lượng 4GB
Kiểu Ram DDR4
Bus Ram hỗ trợ 2400Mhz', N'Bảo hành 3 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (29, N'- Ram Kingston HyperX Predator RGB- Dung lượng: 32GB (2x16GB)- Loại bộ nhớ: DDR4- Bus: 3200MHz- Đèn: RGB', N'Bảo hành 1 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (30, N'- Thiết kế mạch chuyển tiếp dòng 1 chiều dạng kép khai thác hiệu quả năng lượng PSU - Một đường +12V mạnh mẽ lên tới 48 Ample - Hỗ trợ hệ thống nhiều card đồ họa, đồ họa đa nhân - Cung cấp điện áp rất ổn định [chỉ sai số  3%] ', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (31, N'- Dung lượng: 2 x 8GB
- Thế hệ: DDR4
- Bus: 3000MHz
- Cas: 15', N'Bảo hành 2 năm theo hãng')
INSERT [dbo].[ProductDetail] ([product_id], [detail], [guarantee]) VALUES (32, N'- Case máy tính mới nhất của Asus có khả năng chịu va dập từ lực bên ngoài, mặt cường lực rất tốt', N'Bảo hành 2 năm theo hãng')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (1, N'Case Asus ROG Strix GL10CS-VN005X', 1, 9, 23989000, N'img/Hang1.jpg', 19, 21000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (2, N'Laptop MSI Gaming GF63 Thin 8SC 022VN ', 2, 1, 25499000, N'img/Hang2.jpeg', 17, 25000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (3, N'Vga Card Gigabyte GTX 1660 OC - 6GD', 3, 10, 6399000, N'img/Hang3.jpg', 18, 6000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (4, N'Mainboard Asus TUF GAMING X570-PLUS', 1, 5, 5859000, N'img/Hang4.jpg', 20, 5000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (5, N'Samsung 24"C24F390F Curved LED', 4, 11, 23989000, N'img/Hang5.jpg', 20, 23000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (6, N'SSD KINGFAST F10 ', 12, 3, 839000, N'img/Hang6.jpg', 20, 700000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (7, N'Laptop Asus S531FL-BQ192T ', 1, 1, 22999000, N'img/Hang7.png', 20, 22000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (8, N'CPU Intel Xeon Gold 5120 ', 5, 2, 42199000, N'img/Hang8.jpg', 20, 41000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (9, N'Case Asus TUF Gaming GT501VC ', 1, 9, 2990000, N'img/Hang9.jpeg', 20, 2000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (10, N'Màn hình HP 27"27X LED 144Hz', 6, 11, 5999000, N'img/Hang10.png', 20, 5000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (11, N'Màn hình LG 27"27MP59 LED IPS', 7, 11, 4399000, N'img/Hang11.jpg', 20, 3500000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (12, N'Laptop Asus Gaming FX505DT-AL003T', 1, 1, 21999000, N'img/Hang12.jpg', 20, 21000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (13, N'CPU AMD Ryzen 9', 8, 2, 13090000, N'img/Hang13.jpg', 20, 12000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (14, N'Nguồn Thermaltake Toughpower iRGB 1200W ', 5, 7, 6198000, N'img/Hang14.jpg', 19, 5000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (15, N'Vga Card EVGA GeForce RTX 2080 XC BLACK EDITION GAMING 8GB', 15, 10, 20490000, N'img/Hang15.jpg', 20, 19000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (16, N'SSD KINGFAST NVME M.2 ', 12, 3, 1999000, N'img/Hang16.jpeg', 20, 1800000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (17, N'CPU Intel Core i7-9700 ', 5, 2, 8799000, N'img/Hang17.jpeg', 20, 8000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (18, N'Case Thermaltake View 71 RGB Snow Edition', 1, 9, 4589000, N'img/Hang18.jpg', 20, 3500000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (19, N'HDD WD Caviar Black 4TB/7200 Sata3-WD4004FZWX', 1, 4, 5299000, N'img/Hang19.jpg', 0, 4000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (20, N'SSD Samsung 970 PRO 512BG PCIe NVMe 3.0x4', 4, 3, 6199000, N'img/Hang20.jpg', 20, 5199000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (21, N'HDD Seagate SkyHawk 10TB/7200 SATA 3.5"', 13, 4, 8949000, N'img/Hang21.png', 20, 8000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (22, N'Mainboad ASUS PRIME X299 - A', 1, 5, 6299000, N'img/Hang22.png', 20, 5000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (23, N'Vga Card Inno3D Geforce RTX 2080 Ti ICHILL', 15, 10, 30999000, N'img/Hang23.png', 20, 29000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (24, N'Bàn phím Leopold FC660M PD PBT Doubleshot Brown', 9, 6, 2749000, N'img/Hang24.jpeg', 20, 2000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (25, N'Mouse Logitech M238 Marvel Black Panther Wireless', 10, 6, 449000, N'img/Hang25.png', 20, 200000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (26, N'Nguồn máy tính Cooler Master V750 80 Plus Gold', 11, 7, 2900000, N'img/Hang26.jpg', 20, 1500000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (27, N'HDD Western Digital Caviar Red 3TB SATA 3 64MB Cache', 12, 4, 2790000, N'img/Hang27.jpeg', 20, 2000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (28, N'DDRAM 4 SILICON POWER 4GB/2400 UDIMM Heatsink', 13, 8, 599000, N'img/Hang28.jpeg', 20, 400000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (29, N'DDRam 4 Kingston HyperX Predator RGB 32GB/3200Mhz (2*16GB)', 12, 8, 4799000, N'img/Hang29.jpg', 20, 4000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (30, N'Nguồn SeaSonic 620W M12II EVO - 80 PLUS®BRONZE', 13, 7, 2059000, N'img/Hang30.jpg', 20, 1500000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (31, N'Ram Cosair 16GB/3000 (2x8G) - Dominator RGB', 14, 8, 3899000, N'img/Hang31.jpeg', 20, 3000000)
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [product_price], [product_image], [product_quantity], [import_price]) VALUES (32, N'Mainboard Asus PRIME EX-B365M-V', 1, 5, 1699000, N'img/Hang32.jpeg', 20, 1000000)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([controller_id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([controller_id], [name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Role] FOREIGN KEY([controller_id])
REFERENCES [dbo].[Role] ([controller_id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Role]
GO
ALTER TABLE [dbo].[Order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_items]  WITH CHECK ADD  CONSTRAINT [FK_Order_items_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_items] CHECK CONSTRAINT [FK_Order_items_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__customer__4CA06362] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__customer__4CA06362]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([brand_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
