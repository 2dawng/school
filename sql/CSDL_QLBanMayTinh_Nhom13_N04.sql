CREATE DATABASE [QUANLYBANMAYTINH]
USE [QUANLYBANMAYTINH]
GO
/****** Object:  Table [dbo].[BOPHAN]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOPHAN]
(
    [MABP] [varchar](10) NOT NULL,
    [TENBP] [nvarchar](20) NULL,
    [SDT] [char](15) NULL,
    [NGAYBATDAU] [date] NULL,
    [MANV] [varchar](15) NULL,
    CONSTRAINT [pk_BOPHAN_MABP] PRIMARY KEY CLUSTERED 
(
	[MABP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHDLINHKIEN]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHDLINHKIEN]
(
    [MAHD] [varchar](10) NULL,
    [MALK] [varchar](10) NULL,
    [SOLUONGBAN] [int] NULL,
    [GIABAN] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHDMAYTINH]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHDMAYTINH]
(
    [MAHD] [varchar](10) NULL,
    [MAMAY] [varchar](10) NULL,
    [SOLUONGBAN] [int] NULL,
    [GIABAN] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPNLINHKIEN]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPNLINHKIEN]
(
    [MAPN] [varchar](10) NULL,
    [MALK] [varchar](10) NULL,
    [SLNHAP] [int] NULL,
    [DONGIANHAP] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPNMAYTINH]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPNMAYTINH]
(
    [MAPN] [varchar](10) NULL,
    [MAMAY] [varchar](10) NULL,
    [SLNHAP] [int] NULL,
    [DONGIANHAP] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON]
(
    [MAHD] [varchar](10) NOT NULL,
    [NGAYBAN] [date] NULL,
    [CHIETKHAU] [float] NULL,
    [MAKH] [varchar](10) NULL,
    [MANV] [varchar](15) NULL,
    CONSTRAINT [pk_HOADON_MAHD] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG]
(
    [MAKH] [varchar](10) NOT NULL,
    [TEN] [nvarchar](30) NULL,
    [NGAYSINH] [date] NULL,
    [GIOITINH] [nvarchar](10) NULL,
    [DIACHI] [nvarchar](50) NULL,
    [EMAIL] [varchar](50) NULL,
    [SDT] [char](15) NULL,
    CONSTRAINT [pk_KHACHHANG_MAKH] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINHKIEN]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINHKIEN]
(
    [MALK] [varchar](10) NOT NULL,
    [TENLK] [nvarchar](20) NULL,
    [HANGSX] [nvarchar](20) NULL,
    [THONGSO] [text] NULL,
    [TGBAOHANH] [int] NULL,
    CONSTRAINT [pk_LINHKIEN_MALK] PRIMARY KEY CLUSTERED 
(
	[MALK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAYTINH]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAYTINH]
(
    [MAMAY] [varchar](10) NOT NULL,
    [TENMAY] [nvarchar](20) NULL,
    [HANGSX] [nvarchar](20) NULL,
    [THONGSO] [text] NULL,
    [TGBAOHANH] [int] NULL,
    CONSTRAINT [pk_MAYTINH_MAMAY] PRIMARY KEY CLUSTERED 
(
	[MAMAY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN]
(
    [MANV] [varchar](15) NOT NULL,
    [TEN] [nvarchar](30) NULL,
    [NGAYSINH] [date] NULL,
    [GIOITINH] [nvarchar](10) NULL,
    [HESOLUONG] [float] NULL,
    [LUONG] [float] NULL,
    [NGOAINGU] [nvarchar](20) NULL,
    [MABP] [varchar](10) NULL,
    CONSTRAINT [pk_NHANVIEN_MANV] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 09/04/2024 1:47:19 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAP]
(
    [MAPN] [varchar](10) NOT NULL,
    [NGAYNHAP] [date] NULL,
    [NHACUNGCAP] [nvarchar](20) NULL,
    [MANV] [varchar](15) NULL,
    CONSTRAINT [pk_PHIEUNHAP_MAPN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BOPHAN]
    ([MABP], [TENBP], [SDT], [NGAYBATDAU], [MANV])
VALUES
    (N'1601', N'Kĩ Thuật', N'0249173        ', CAST(N'2014-05-01' AS Date), N'1001')
GO
INSERT [dbo].[BOPHAN]
    ([MABP], [TENBP], [SDT], [NGAYBATDAU], [MANV])
VALUES
    (N'1602', N'Marketing', N'0724626        ', CAST(N'2014-03-05' AS Date), N'1004')
GO
INSERT [dbo].[BOPHAN]
    ([MABP], [TENBP], [SDT], [NGAYBATDAU], [MANV])
VALUES
    (N'1603', N'Thu Ngân', N'0824672        ', CAST(N'2016-05-04' AS Date), N'1007')
GO
INSERT [dbo].[BOPHAN]
    ([MABP], [TENBP], [SDT], [NGAYBATDAU], [MANV])
VALUES
    (N'1604', N'Xuất Nhập Khẩu', N'0248235        ', CAST(N'2016-05-16' AS Date), N'1003')
GO
INSERT [dbo].[BOPHAN]
    ([MABP], [TENBP], [SDT], [NGAYBATDAU], [MANV])
VALUES
    (N'1605', N'Nhân Sự', N'0821574        ', CAST(N'2015-12-06' AS Date), N'1002')
GO
INSERT [dbo].[BOPHAN]
    ([MABP], [TENBP], [SDT], [NGAYBATDAU], [MANV])
VALUES
    (N'1606', N'Sản Xuất', N'0147242        ', CAST(N'2015-10-11' AS Date), N'1005')
GO
INSERT [dbo].[CTHDLINHKIEN]
    ([MAHD], [MALK], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2001', N'6001', 1, 800000)
GO
INSERT [dbo].[CTHDLINHKIEN]
    ([MAHD], [MALK], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2002', N'6003', 2, 900000)
GO
INSERT [dbo].[CTHDLINHKIEN]
    ([MAHD], [MALK], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2003', N'6004', 3, 1000000)
GO
INSERT [dbo].[CTHDLINHKIEN]
    ([MAHD], [MALK], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2004', N'6005', 2, 600000)
GO
INSERT [dbo].[CTHDLINHKIEN]
    ([MAHD], [MALK], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2005', N'6004', 1, 1300000)
GO
INSERT [dbo].[CTHDLINHKIEN]
    ([MAHD], [MALK], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2006', N'6003', 3, 1500000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2001', N'4004', 1, 10000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2002', N'4001', 1, 20000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2003', N'4002', 2, 16000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2004', N'4004', 1, 30000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2005', N'4003', 1, 19000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2006', N'4003', 1, 43000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2007', N'4005', 2, 25000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2008', N'4006', 1, 20000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2009', N'4008', 1, 37000000)
GO
INSERT [dbo].[CTHDMAYTINH]
    ([MAHD], [MAMAY], [SOLUONGBAN], [GIABAN])
VALUES
    (N'2010', N'4009', 1, 23000000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5001', N'6004', 30, 200000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5002', N'6003', 50, 400000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5003', N'6001', 20, 300000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5004', N'6002', 35, 700000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5005', N'6007', 40, 300000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5006', N'6005', 45, 400000)
GO
INSERT [dbo].[CTPNLINHKIEN]
    ([MAPN], [MALK], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5007', N'6006', 25, 500000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5001', N'4001', 15, 7000000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5002', N'4004', 15, 10000000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5003', N'4002', 22, 11000000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5004', N'4003', 10, 13000000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5005', N'4009', 30, 6000000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5006', N'4010', 10, 8000000)
GO
INSERT [dbo].[CTPNMAYTINH]
    ([MAPN], [MAMAY], [SLNHAP], [DONGIANHAP])
VALUES
    (N'5007', N'4007', 20, 7000000)
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2001', CAST(N'2024-01-13' AS Date), 0.2, N'3001', N'1001')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2002', CAST(N'2023-04-22' AS Date), 0.1, N'3002', N'1001')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2003', CAST(N'2024-02-22' AS Date), 0.3, N'3003', N'1002')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2004', CAST(N'2023-04-11' AS Date), 0.2, N'3004', N'1002')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2005', CAST(N'2024-02-03' AS Date), 0.1, N'3005', N'1002')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2006', CAST(N'2023-07-05' AS Date), 0.4, N'3006', N'1003')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2007', CAST(N'2024-01-28' AS Date), 0.1, N'3006', N'1003')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2008', CAST(N'2023-12-19' AS Date), 0.2, N'3006', N'1003')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2009', CAST(N'2024-02-12' AS Date), 0.3, N'3007', N'1005')
GO
INSERT [dbo].[HOADON]
    ([MAHD], [NGAYBAN], [CHIETKHAU], [MAKH], [MANV])
VALUES
    (N'2010', CAST(N'2023-10-10' AS Date), 0.2, N'3008', N'1006')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3001', N'Nguyễn Văn Phúc', CAST(N'1994-05-12' AS Date), N'Nam', N'Hà Nội', N'NguyenVanPhuc@gmail.com', N'0183813        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3002', N'Phạm Văn Toàn', CAST(N'1995-06-14' AS Date), N'Nam', N'Bắc Ninh', N'PhamVanToan@gmail.com', N'2944729        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3003', N'Lê Văn Luyện', CAST(N'1996-03-28' AS Date), N'Nam', N'Thanh Hóa', N'levanluyen@gmail.com', N'2848728        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3004', N'Nguyễn Như Thảo', CAST(N'1993-11-22' AS Date), N'Nữ', N'Hà Nội', N'Nguyennhuthao@gmail.com', N'0284163        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3005', N'Vũ Như Quỳnh', CAST(N'1997-05-04' AS Date), N'Nữ', N'Hưng Yên', N'vunhuquynh@gmail.com', N'0197127        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3006', N'Lê Thu Linh', CAST(N'1993-11-01' AS Date), N'Nữ', N'Thanh Hóa', N'lethuminh@gmail.com', N'0131833        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3007', N'Lê Sơn Tùng', CAST(N'1994-04-02' AS Date), N'Nam', N'Hà Nội', N'lesontung@gmail.com', N'0444444        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3008', N'Vũ Quang Thịnh', CAST(N'1996-04-22' AS Date), N'Nam', N'Hưng Yên', N'vuquangthinh@gmail.com', N'0108471        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3009', N'Lê Hồng Sơn', CAST(N'1996-11-24' AS Date), N'Nam', N'Đà Nẵng', N'lehongson@gmail.com', N'0186442        ')
GO
INSERT [dbo].[KHACHHANG]
    ([MAKH], [TEN], [NGAYSINH], [GIOITINH], [DIACHI], [EMAIL], [SDT])
VALUES
    (N'3010', N'Hoàng Văn Đức', CAST(N'1995-05-14' AS Date), N'Nam', N'Bắc Ninh', N'hoangvanduc@gmail.com', N'0461173        ')
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6001', N'RAM', N'DELL', N'16G', 6)
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6002', N'CPU', N'INTEL', N'IBTEL CORE I5', 6)
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6003', N'GPU', N'NVIDIA', N'GTX 1660 SUPER', 6)
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6004', N'MainBoard', N'ASUS', N'H510', 6)
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6005', N'Ổ Cứng', N'SSD M2', N'500GB', 6)
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6006', N'Màn Hình', N'DELL', N'22INCH 75HZ', 6)
GO
INSERT [dbo].[LINHKIEN]
    ([MALK], [TENLK], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'6007', N'PSU', N'HP', N'400W', 6)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4001', N'HP 15-ay538', N'HP', N'RAM:16GB', 12)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4002', N'Dell Inspiron 5567', N'DELL', N'RAM:32GB', 24)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4003', N'HP 15-ay131TU', N'HP', N'RAM:32GB', 12)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4004', N'Dell Vostro 5468C', N'DELL', N'RAM:8GB', 24)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4005', N'Dell Vostro 5468', N'DELL', N'RAM:16GB', 12)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4006', N'MSI GS72 6QE', N'MSI', N'RAM:16GB', 12)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4007', N'MSI GP62 7RD', N'MSI', N'RAM:8GB', 24)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4008', N'Asus Gaming GL553VD', N'ASUS', N'RAM:16GB', 12)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4009', N'Asus Gaming 1718', N'ASUS', N'RAM:8GB', 24)
GO
INSERT [dbo].[MAYTINH]
    ([MAMAY], [TENMAY], [HANGSX], [THONGSO], [TGBAOHANH])
VALUES
    (N'4010', N'Acer Aspire VX5', N'ACER', N'RAM:32', 24)
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1001', N'Lê Đức Hùng', CAST(N'1993-09-08' AS Date), N'Nam', 2.1, 1000, N'Tiếng Anh', N'1601')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1002', N'Nguyễn Văn Đạt', CAST(N'1997-12-05' AS Date), N'Nam', 2.3, 1200, N'Tiếng Nhật', N'1601')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1003', N'Lê Thị An', CAST(N'1994-05-01' AS Date), N'Nữ', 1.5, 1500, N'Tiếng Anh', N'1601')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1004', N'Nguyễn Như Anh Tuấn', CAST(N'1993-02-06' AS Date), N'Nam', 2, 1300, N'Tiếng Hàn', N'1602')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1005', N'Đinh Công Mạnh', CAST(N'1994-10-06' AS Date), N'Nam', 2.01, 2000, N'Tiếng Hàn', N'1602')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1006', N'Vũ Thị Nhung', CAST(N'1996-11-05' AS Date), N'Nữ', 2.3, 900, N'Tiếng Anh', N'1603')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1007', N'Nhuyễn Thị Huệ', CAST(N'1994-03-11' AS Date), N'Nữ', 1.66, 1250, N'Tiếng Nhật', N'1603')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1008', N'Lê Thu Hằng', CAST(N'1997-02-13' AS Date), N'Nữ', 1.8, 1400, N'Tiếng Anh', N'1604')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1009', N'Chu Thị Kiều Trang', CAST(N'1996-02-22' AS Date), N'Nữ', 1.9, 1470, N'Tiếng Hàn', N'1605')
GO
INSERT [dbo].[NHANVIEN]
    ([MANV], [TEN], [NGAYSINH], [GIOITINH], [HESOLUONG], [LUONG], [NGOAINGU], [MABP])
VALUES
    (N'1010', N'Lê Văn Quang', CAST(N'1994-12-22' AS Date), N'Nam', 2.1, 1800, N'Tiếng Anh', N'1606')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5001', CAST(N'2020-10-13' AS Date), N'Phúc Anh', N'1001')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5002', CAST(N'2022-11-22' AS Date), N'Gia Hưng', N'1002')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5003', CAST(N'2021-05-21' AS Date), N'An Phát', N'1003')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5004', CAST(N'2020-01-02' AS Date), N'Nova Computer', N'1003')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5005', CAST(N'2021-03-05' AS Date), N'An Phát', N'1004')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5006', CAST(N'2021-04-14' AS Date), N'Phúc Anh', N'1009')
GO
INSERT [dbo].[PHIEUNHAP]
    ([MAPN], [NGAYNHAP], [NHACUNGCAP], [MANV])
VALUES
    (N'5007', CAST(N'2022-05-19' AS Date), N'Nova Computer', N'1010')
GO
ALTER TABLE [dbo].[BOPHAN]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[CTHDLINHKIEN]  WITH CHECK ADD  CONSTRAINT [fk_CTHDLINHKIEN_HOADON] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HOADON] ([MAHD])
GO
ALTER TABLE [dbo].[CTHDLINHKIEN] CHECK CONSTRAINT [fk_CTHDLINHKIEN_HOADON]
GO
ALTER TABLE [dbo].[CTHDLINHKIEN]  WITH CHECK ADD  CONSTRAINT [fk_CTHDLINHKIEN_LINHKIEN] FOREIGN KEY([MALK])
REFERENCES [dbo].[LINHKIEN] ([MALK])
GO
ALTER TABLE [dbo].[CTHDLINHKIEN] CHECK CONSTRAINT [fk_CTHDLINHKIEN_LINHKIEN]
GO
ALTER TABLE [dbo].[CTHDMAYTINH]  WITH CHECK ADD  CONSTRAINT [fk_CTHDMAYTINH_HOADON] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HOADON] ([MAHD])
GO
ALTER TABLE [dbo].[CTHDMAYTINH] CHECK CONSTRAINT [fk_CTHDMAYTINH_HOADON]
GO
ALTER TABLE [dbo].[CTHDMAYTINH]  WITH CHECK ADD  CONSTRAINT [fk_CTHDMAYTINH_MAYTINH] FOREIGN KEY([MAMAY])
REFERENCES [dbo].[MAYTINH] ([MAMAY])
GO
ALTER TABLE [dbo].[CTHDMAYTINH] CHECK CONSTRAINT [fk_CTHDMAYTINH_MAYTINH]
GO
ALTER TABLE [dbo].[CTPNLINHKIEN]  WITH CHECK ADD  CONSTRAINT [fk_CTPNLINHKIEN_LINHKIEN] FOREIGN KEY([MALK])
REFERENCES [dbo].[LINHKIEN] ([MALK])
GO
ALTER TABLE [dbo].[CTPNLINHKIEN] CHECK CONSTRAINT [fk_CTPNLINHKIEN_LINHKIEN]
GO
ALTER TABLE [dbo].[CTPNLINHKIEN]  WITH CHECK ADD  CONSTRAINT [fk_CTPNLINHKIEN_PHIEUNHAP] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PHIEUNHAP] ([MAPN])
GO
ALTER TABLE [dbo].[CTPNLINHKIEN] CHECK CONSTRAINT [fk_CTPNLINHKIEN_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CTPNMAYTINH]  WITH CHECK ADD  CONSTRAINT [fk_CTPNMAYTINH_MAYTINH] FOREIGN KEY([MAMAY])
REFERENCES [dbo].[MAYTINH] ([MAMAY])
GO
ALTER TABLE [dbo].[CTPNMAYTINH] CHECK CONSTRAINT [fk_CTPNMAYTINH_MAYTINH]
GO
ALTER TABLE [dbo].[CTPNMAYTINH]  WITH CHECK ADD  CONSTRAINT [fk_CTPNMAYTINH_PHIEUNHAP] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PHIEUNHAP] ([MAPN])
GO
ALTER TABLE [dbo].[CTPNMAYTINH] CHECK CONSTRAINT [fk_CTPNMAYTINH_PHIEUNHAP]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [fk_HOADON_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [fk_HOADON_KHACHHANG]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [fk_HOADON_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [fk_HOADON_NHANVIEN]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [fk_NHANVIEN_BOPHAN] FOREIGN KEY([MABP])
REFERENCES [dbo].[BOPHAN] ([MABP])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [fk_NHANVIEN_BOPHAN]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [fk_PHIEUNHAP_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [fk_PHIEUNHAP_NHANVIEN]
GO