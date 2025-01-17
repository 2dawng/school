-- 1. Viết truy vấn tạo bảng doanh thu (tDoanhThu) gồm các trường
-- Table: tDoanhThu
-- Tên trường  Kiểu dữ liệu    Diễn giải
-- MaDK        Short Text      Mã đăng ký
-- LoaiPhong   Short Text      Loại phòng
-- SoNgayO     Number          Số ngày ở
-- ThucThu     Number          Thực thu

-- CREATE TABLE tDoanhThu
-- (
--     MaDK NVARCHAR(10) NOT NULL,
--     LoaiPhong NVARCHAR(10) NOT NULL,
--     SoNgayO INT,
--     ThucThu DECIMAL(10,2)
-- );


-- 2. Tạo Trigger tính tiền và điền tự động vào bảng tDoanhThu như sau:
-- Các trường lấy thông tin từ các bảng và các thông tin sau:
-- Trong đó:
-- (a) Số Ngày Ở= Ngày Ra – Ngày Vào
-- (b) ThucThu: Tính theo yêu cầu sau:
-- Nếu Số Ngày ở <10 Thành tiền = Đơn Giá * Số ngày ở
-- Nếu 10 <=Số Ngày ở <30 Thành Tiền = Đơn Giá* Số Ngày ở * 0.95 (Giảm5%)
-- Nếu Số ngày ở >= 30 Thành Tiền = Đơn Giá* Số Ngày ở * 0.9 (Giảm10%)

-- CREATE TRIGGER trg_TinhTien
-- ON tDangKy
-- FOR INSERT, UPDATE AS
-- BEGIN
--     DECLARE @MaDK VARCHAR(10);
--     DECLARE @NgayVao DATE;
--     DECLARE @NgayRa DATE;
--     DECLARE @SoNgayO INT;
--     DECLARE @LoaiPhong VARCHAR(10);
--     DECLARE @DonGia DECIMAL(10,2);
--     DECLARE @ThucThu DECIMAL(10,2);

--     SELECT @MaDK = MaDK, @NgayVao = NgayVao, @NgayRa = NgayRa, @LoaiPhong = LoaiPhong
--     FROM inserted;

--     SELECT @DonGia = DonGia
--     FROM tLoaiPhong
--     WHERE LoaiPhong = @LoaiPhong;

--     SELECT @SoNgayO = DATEDIFF(DAY, @NgayVao, @NgayRa);

--     IF @SoNgayO < 10
--         SET @ThucThu = @DonGia * @SoNgayO;
--     ELSE IF @SoNgayO < 30
--         SET @ThucThu = @DonGia * @SoNgayO * 0.95;
--     ELSE
--         SET @ThucThu = @DonGia * @SoNgayO * 0.9;

--     INSERT INTO tDoanhThu
--         (MaDK, LoaiPhong, SoNgayO, ThucThu)
--     VALUES(@MaDK, @LoaiPhong, @SoNgayO, @ThucThu);
-- END;



-- 3. Thêm trường DonGia vào bảng tDangKy, tạo trigger cập nhật tự động cho trường này.

-- ALTER TABLE tDangKy
-- ADD DonGia DECIMAL(10,2);

-- CREATE TRIGGER trg_CapNhatDonGia
-- ON tDangKy
-- FOR INSERT, UPDATE AS
-- BEGIN
--     DECLARE @MaDK VARCHAR(10);
--     DECLARE @LoaiPhong VARCHAR(10);
--     DECLARE @DonGia DECIMAL(10,2);

--     SELECT @MaDK = MaDK, @LoaiPhong = LoaiPhong
--     FROM inserted;

--     SELECT @DonGia = DonGia
--     FROM tLoaiPhong
--     WHERE LoaiPhong = @LoaiPhong;

--     UPDATE tDangKy
--     SET DonGia = @DonGia
--     WHERE MaDK = @MaDK;
-- END;


-- 4. Thêm trường tổng tiêu dùng (TongTieuDung) và bảng khách hàng và tính tự động tổng
-- tiền khách hàng đã trả cho khách sạn mỗi khi thêm, sửa, xóa bản tDangKy

-- ALTER TABLE tDangKy
-- ADD TongTieuDung DECIMAL(10,2);

-- CREATE TRIGGER trg_TinhTongTieuDung
-- ON tDangKy
-- FOR INSERT, UPDATE, DELETE AS
-- BEGIN
--     DECLARE @MaDK VARCHAR(10);
--     DECLARE @TongTieuDung DECIMAL(10,2);

--     IF EXISTS(SELECT *
--     FROM inserted)
--     BEGIN
--         SELECT @MaDK = MaDK
--         FROM inserted;

--         SELECT @TongTieuDung = SUM(ThucThu)
--         FROM tDoanhThu
--         WHERE MaDK = @MaDK;

--         UPDATE tDangKy
--         SET TongTieuDung = @TongTieuDung
--         WHERE MaDK = @MaDK;
--     END
--     ELSE
--     BEGIN
--         SELECT @MaDK = MaDK
--         FROM deleted;

--         SELECT @TongTieuDung = SUM(ThucThu)
--         FROM tDoanhThu
--         WHERE MaDK = @MaDK;

--         UPDATE tDangKy
--         SET TongTieuDung = @TongTieuDung
--         WHERE MaDK = @MaDK;
--     END
-- END;
