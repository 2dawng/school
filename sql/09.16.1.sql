-- 1. Tạo hàm với đầu vào là năm, đầu ra là danh sách nhân viên sinh vào năm đó

CREATE FUNCTION cau1(@Nam INT)
RETURNS TABLE
AS
RETURN(
    SELECT *
FROM tNhanVien
WHERE YEAR(NTNS)=@Nam
)

SELECT *
FROM cau1(1962)


-- 2. Tạo hàm với đầu vào là số thâm niên (số năm làm việc) đầu ra là danh sách nhân viên có thâm niên đó

CREATE FUNCTION cau2(@ThamNien INT)
RETURNS TABLE
AS
RETURN(
    SELECT *
FROM tNhanVien
WHERE YEAR(GETDATE())-YEAR(NgayBD)=@ThamNien
)

SELECT *
FROM cau2(29)

-- 3. Tạo hàm đầu vào là chức vụ đầu ra là những nhân viên cùng chức vụ đó

CREATE FUNCTION cau3(@ChucVu NVARCHAR(50))
RETURNS TABLE
AS
RETURN(
    SELECT tNhanVien.*
FROM tNhanVien
    JOIN tChiTietNhanVien ON tNhanVien.MaNV=tChiTietNhanVien.MaNV
WHERE ChucVu=@ChucVu
)

SELECT *
FROM cau3('NV')

-- 4. Tạo hàm đưa ra thông tin về nhân viên được tăng lương của ngày hôm nay (giả sử 3 năm lên lương 1 lần)

CREATE FUNCTION cau4()
RETURNS TABLE
AS
RETURN(
    SELECT *
FROM tNhanVien
WHERE (YEAR(GETDATE())-YEAR(NgayBD))%3=0
)

SELECT *
FROM cau4()

-- 5. Tạo Hàm xây dựng bảng lương của nhân viên gồm các thông tin sau:
-- - Lương = lương cơ bản * HSLuong + Phụ cấp (Giả sử lương cơ bản=1490000vnd (1.49tr))
-- - BHXH: 8%*lương (bảo hiểm xã hội)
-- - BHYT: 1,5% * lương (bảo hiểm y tế)
-- - BHTN: 1%* lương (Bảo hiểm thất nghiệp)
-- - Thuế TNCN (Thuế thu nhập cá nhân) được tính như sau:
-- Bậc      Thu nhập tháng      Số thuế phải nộp
-- 1        TN<=5tr             TN*5%
-- 2        5tr<TN<=10tr        TN*10%-0.25tr
-- 3        10tr<TN<=18tr       TN*15%-0.75tr
-- 4        18tr<TN<=32tr       TN*20%-1.65tr
-- 5        32tr<TN<=52tr       TN*25%-3.25tr
-- 6        52tr<TN<=80tr       TN*30%-5.85tr
-- 7        TN>80tr             TN*35%-9.85tr
-- Trong đó: TN= Lương - BHXH - BHYT - BHTN - 11tr (mức chịu thuế) - GTGC*4.4tr (Giảm trừ gia cảnh)
-- - Phụ cấp: Mức độ công việc là A thì phụ cấp 10tr, mức độ B là 8tr, mức độ C là 5tr
-- - Thực lĩnh: Lương – (BHXH+BHYT+BHTN + Thuế TNCN)

CREATE FUNCTION tinhluong(@MaNV INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Luong FLOAT,@ThuNhap FLOAT
    SELECT @Luong=(1490000*HSLuong)+
    CASE
        WHEN SUBSTRING(MucDoCV, 1, 1)='A' THEN 10000000
        WHEN SUBSTRING(MucDoCV, 1, 1)='B' THEN 8000000
        WHEN SUBSTRING(MucDoCV, 1, 1)='C' THEN 5000000
    END,
        @ThuNhap = @Luong-@Luong*(0.08+0.015+0.01)-11000000-(4400000*ISNULL(GTGC,0))
    FROM tChiTietNhanVien
    WHERE MaNV=@MaNV
    DECLARE @Thue FLOAT =
    CASE
        WHEN @ThuNhap <= 50000000 THEN @ThuNhap * 0.05
        WHEN @ThuNhap > 50000000 AND @ThuNhap <= 100000000 THEN(@ThuNhap * 0.1) -250000
        WHEN @ThuNhap > 100000000 AND @ThuNhap <= 180000000 THEN(@ThuNhap * 0.15) -750000
        WHEN @ThuNhap > 180000000 AND @ThuNhap <= 320000000 THEN(@ThuNhap * 0.2) -1650000
        WHEN @ThuNhap > 320000000 AND @ThuNhap <= 520000000 THEN(@ThuNhap * 0.25) -3250000
        WHEN @ThuNhap > 520000000 AND @ThuNhap <= 800000000 THEN(@ThuNhap * 0.3) -5850000
        WHEN @ThuNhap > 800000000 THEN(@ThuNhap * 0.35) -9850000
    END
    RETURN @Luong-(@Luong*(0.08+0.015+0.01))-@Thue
END

CREATE FUNCTION cau5()
RETURNS TABLE
AS
RETURN(
    SELECT *,
    dbo.tinhluong(MaNV) AS Luong
FROM tChiTietNhanVien
)

SELECT *
FROM cau5()

-- 6. Tạo thủ tục có đầu vào là mã phòng, đầu ra là số nhân viên của phòng đó và tên trưởng phòng

CREATE PROCEDURE cau6
    @MaPhong NVARCHAR(5),
    @SoNV INT OUTPUT,
    @TenTP NVARCHAR(50) OUTPUT
AS
BEGIN
    SELECT @SoNV=COUNT(MaNV)
    FROM tNhanVien
    WHERE MaPB=@MaPhong
    SELECT @TenTP=HO+' '+TEN
    FROM tNhanVien
        JOIN tPhongBan
        ON tNhanVien.MaNV=tPhongBan.TruongPhong
    WHERE tPhongBan.MaPB=@MaPhong
END

DECLARE @SoNV INT
DECLARE @TenTP NVARCHAR(50)
EXEC cau6 'KT', @SoNV OUTPUT, @TenTP OUTPUT
SELECT @SoNV AS SoNV, @TenTP AS TenTP


-- 7. Tạo thủ tục có đầu vào là mã phòng, tháng, năm, đầu ra là số tiền lương của phòng đó

CREATE PROCEDURE cau7
    @MaPhong NVARCHAR(5),
    @Thang INT,
    @Nam INT,
    @TongLuong FLOAT OUTPUT
AS
BEGIN
    SELECT @TongLuong=SUM(dbo.tinhluong(tChiTietNhanVien.MaNV))
    FROM tChiTietNhanVien
        JOIN tNhanVien
        ON tChiTietNhanVien.MaNV=tNhanVien.MaNV
    WHERE MaPB=@MaPhong AND MONTH(NgayBD)>=@Thang AND YEAR(NgayBD)>=@Nam
END

DECLARE @TongLuong FLOAT
EXEC cau7 'KT', 6, 1990, @TongLuong OUTPUT
SELECT @TongLuong AS TongLuong
