create database [QuanLyDiemTruongDaiHoc]
USE [QuanLyDiemTruongDaiHoc]
GO
/****** Object:  Table [dbo].[BoMon]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoMon]
(
	[MaBoMon] [varchar](10) NOT NULL,
	[TenBoMon] [nvarchar](200) NULL,
	[TenTiengAnh] [varchar](200) NULL,
	[MaKhoa] [varchar](10) NULL,
	[TruongBoMon] [varchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	CONSTRAINT [pk_BoMon] PRIMARY KEY CLUSTERED 
(
	[MaBoMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuongTrinhDaoTao]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuongTrinhDaoTao]
(
	[MaCTDT] [varchar](25) NOT NULL,
	[TenCTDT] [nvarchar](200) NULL,
	[TenCTDTTiengAnh] [varchar](200) NULL,
	[MaKhoa] [varchar](10) NULL,
	[NganhApDung] [nvarchar](200) NULL,
	[KhoaHocApDung] [varchar](10) NULL,
	CONSTRAINT [pk_ChuongTrinhDaoTao] PRIMARY KEY CLUSTERED 
(
	[MaCTDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDT_HocPhan]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDT_HocPhan]
(
	[MaCTDT] [varchar](25) NOT NULL,
	[MaHocPhan] [varchar](25) NOT NULL,
	[KyHoc] [int] NULL,
	CONSTRAINT [pk_CTDT_HocPhan] PRIMARY KEY CLUSTERED 
(
	[MaCTDT] ASC,
	[MaHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien]
(
	[MaGiangVien] [varchar](10) NOT NULL,
	[HoDem] [nvarchar](35) NULL,
	[Ten] [nvarchar](35) NULL,
	[MaBoMon] [varchar](10) NULL,
	[NgaySinh] [date] NULL,
	[HocHam] [nvarchar](20) NULL,
	[HocVi] [nvarchar](20) NULL,
	[ChucDanh] [nvarchar](20) NULL,
	[DienThoai] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	CONSTRAINT [pk_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocPhan]
(
	[MaHocPhan] [varchar](25) NOT NULL,
	[TenHocPhan] [nvarchar](200) NULL,
	[TenTiengAnh] [nvarchar](200) NULL,
	[MaBoMon] [varchar](10) NULL,
	[SoTinChi] [int] NULL,
	[TrongSoDiemQuaTrinh] [float] NULL,
	[TrongSoDiemThiKTHP] [float] NULL,
	CONSTRAINT [pk_HocPhan] PRIMARY KEY CLUSTERED 
(
	[MaHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocPhanTienQuyet]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocPhanTienQuyet]
(
	[MaHocPhan] [varchar](25) NOT NULL,
	[MaHocPhanTienQuyet] [varchar](25) NOT NULL,
	[RangBuoc] [bit] NULL,
	CONSTRAINT [pk_HocPhanTienQuyet] PRIMARY KEY CLUSTERED 
(
	[MaHocPhan] ASC,
	[MaHocPhanTienQuyet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa]
(
	[MaKhoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](200) NULL,
	[TenTiengAnh] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Website] [ntext] NULL,
	CONSTRAINT [pk_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop]
(
	[MaLop] [varchar](25) NOT NULL,
	[TenLop] [nvarchar](200) NULL,
	[MaKhoa] [varchar](10) NULL,
	[KhoaHoc] [varchar](10) NULL,
	CONSTRAINT [pk_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHocPhan]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHocPhan]
(
	[MaHocPhan] [varchar](25) NOT NULL,
	[MaLopHocPhan] [varchar](25) NOT NULL,
	[TenLopHocPhan] [nvarchar](200) NULL,
	[MaGiangVien] [varchar](10) NULL,
	[NamHoc] [varchar](20) NULL,
	[HocKy] [int] NULL,
	[DotHoc] [int] NULL,
	CONSTRAINT [pk_LopHocPhan] PRIMARY KEY CLUSTERED 
(
	[MaHocPhan] ASC,
	[MaLopHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHocPhan_SinhVien]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHocPhan_SinhVien]
(
	[MaHocPhan] [varchar](25) NOT NULL,
	[MaLopHocPhan] [varchar](25) NOT NULL,
	[MaSinhVien] [varchar](10) NOT NULL,
	[DiemQuaTrinh] [float] NULL,
	[DiemThiKTHP] [float] NULL,
	[DiemTKHP] [float] NULL,
	[DiemHeChu] [varchar](10) NULL,
	[LanHoc] [int] NULL,
	CONSTRAINT [pk_LopHocPhan_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaHocPhan] ASC,
	[MaLopHocPhan] ASC,
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 21/8/2024 3:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien]
(
	[MaSinhVien] [varchar](10) NOT NULL,
	[HoDem] [nvarchar](35) NULL,
	[Ten] [nvarchar](35) NULL,
	[MaCTDT] [varchar](25) NULL,
	[MaLop] [varchar](25) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](250) NULL,
	[DienThoai] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	CONSTRAINT [pk_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO