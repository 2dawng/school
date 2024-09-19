-- -- 1. Tạo hàm có đầu vào là lộ trình, đầu ra là số xe, mã trọng tải, số lượng vận tải, ngày đi, ngày đến (SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen.)

-- CREATE FUNCTION cau1(@TenLoTrinh NCHAR(50))
-- RETURNS TABLE
-- AS 
-- RETURN
-- (
--     SELECT SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen
-- FROM ChiTietVanTai
--     JOIN LoTrinh ON ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
-- WHERE LoTrinh.TenLoTrinh = @TenLoTrinh
-- )

-- SELECT * FROM cau1(N'Hà Nội')

-- -- 2. Thiết lập hàm có đầu vào là số xe, đầu ra là thông tin về lộ trình

-- CREATE FUNCTION cau2(@SoXe INT)
-- RETURNS TABLE
-- AS
-- RETURN
-- (
--     SELECT LoTrinh.TenLoTrinh,DonGia,ThoiGianQD,ChiTietVanTai.*
-- FROM LoTrinh
--     JOIN ChiTietVanTai ON LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh
-- WHERE ChiTietVanTai.SoXe = @SoXe
-- )

-- SELECT * FROM cau2(333)

-- -- 3.Tạo hàm có đầu vào là trọng tải, đầu ra là các số xe có trọng tải quy định lớn hơn hoặc bằng trọng tải đó

-- CREATE FUNCTION cau3( @TrongTai INT)
-- RETURNS TABLE
-- AS
-- RETURN
-- (
--     SELECT ChiTietVanTai.*
--     FROM ChiTietVanTai
--     JOIN TrongTai ON ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
--     WHERE TrongTaiQD >= @TrongTai
-- )

-- SELECT * FROM cau3(5)

-- -- 4. Tạo hàm có đầu vào là trọng tải và mã lộ trình, đầu ra là số lượng xe có trọng tải quy định lớn hơn hoặc bằng trọng tải đó và thuộc lộ trình đó.

-- CREATE FUNCTION cau4 (@trongTai INT, @maLoiTrinh nvarchar(50)) 
-- RETURNS INT 
-- AS 
-- BEGIN
--     DECLARE @soLuong INT
--     SELECT @soLuong = count(Soxe)
--     FROM ChiTietVanTai
--         JOIN TrongTai ON ChiTietVanTai.MaTrongTai =TrongTai.MaTrongTai
--     WHERE TrongTaiQD >= @trongTai AND MaLoTrinh = @maLoiTrinh
--     RETURN @soLuong
-- END

-- SELECT dbo.cau4(5,'HN')

-- -- 5. Tạo thủ tục có đầu vào Mã lộ trình đầu ra là số lượng xe thuộc lộ trình đó.

-- CREATE PROCEDURE cau5
--     @MaLoTrinh nvarchar(20) ,
--     @SoLuong INT
-- OUTPUT
-- AS
-- BEGIN
--     SELECT @SoLuong =COUNT(SoXe)
--     FROM ChiTietVanTai
--     WHERE MaLoTrinh = @MaLoTrinh
-- END

-- DECLARE @SoLuong INT
-- EXEC cau5 'HN', @SoLuong OUTPUT
-- SELECT @SoLuong


-- -- 6. Tạo thủ tục có đầu vào là mã lộ trình, năm vận tải, đầu ra là số tiền theo mã lộ trình và năm vận tải đó

-- CREATE PROCEDURE cau6
--     @MaLoTrinh nvarchar(20),
--     @NamVT int,
--     @SoTien int OUTPUT
-- AS
-- BEGIN
--     SELECT @SoTien = SUM(DonGia * SoLuongVT)
--     FROM ChiTietVanTai
--         JOIN LoTrinh ON ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
--     WHERE ChiTietVanTai.MaLoTrinh = @MaLoTrinh
--         AND YEAR(NgayDi) = @NamVT
--         AND day(NgayDen)-day(NgayDi)<=ThoiGianQD
-- END

-- DECLARE @SoTien int
-- EXEC cau6 'PK', '2014', @SoTien OUTPUT
-- SELECT @SoTien

-- -- 7. Tạo thủ tục có đầu vào là số xe, năm vận tải, đầu ra là số tiền theo số xe và năm vận tải đó đó

-- CREATE PROCEDURE cau7 @SoXe int, @NamVT int, @SoTien int OUTPUT
-- AS
-- BEGIN
--  SELECT @SoTien = SUM(DonGia * SoLuongVT)
--     FROM ChiTietVanTai
--         JOIN LoTrinh ON ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
--     WHERE ChiTietVanTai.SoXe = @SoXe
--         AND YEAR(NgayDi) = @NamVT
--         AND day(NgayDen)-day(NgayDi)<=ThoiGianQD
-- END

-- DECLARE @SoTien int
-- EXEC cau7 333, 2014, @SoTien OUTPUT
-- SELECT @SoTien

-- -- 8. Tạo thủ tục có đầu vào là mã trọng tải, đầu ra là số lượng xe vượt quá trọng tải quy định của mã trọng tải đó.

-- CREATE PROCEDURE cau8 @MaTrongTai INT, @SoLuong INT OUTPUT
-- AS
-- BEGIN
--     SELECT @SoLuong = COUNT(SoXe)
--     FROM ChiTietVanTai
--     JOIN TrongTai ON ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
--     WHERE SoLuongVT > TrongTaiQD AND ChiTietVanTai.MaTrongTai = @MaTrongTai
-- END

-- DECLARE @SoLuong INT
-- EXEC cau8 50, @SoLuong OUTPUT
-- SELECT @SoLuong