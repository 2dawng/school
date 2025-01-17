-- 1. Tạo trường thành tiền (ThanhTien) cho bảng tChitietHDB, tạo trigger cập nhật tự động cho trường này biết ThanhTien=SLBan*DonGiaBan


-- create TRIGGER ThanhTien on [dbo].[tChiTietHDB]
-- for insert, update AS
-- BEGIN
--     UPDATE tChiTietHDB SET ThanhTien=inserted.SLBan*DonGiaBan
--     from inserted JOIN tSach on inserted.MaSach=tSach.MaSach
--         JOIN tChiTietHDB on inserted.SoHDB=tChiTietHDB.SoHDB
--             AND inserted.MaSach=tChiTietHDB.MaSach
-- END



-- 2. Thêm trường đơn giá (DonGia) cho bảng chi tiết hóa đơn bán, cập nhật dữ liệu cho trường này mỗi khi thêm, sửa bản ghi vào bảng chi tiết hóa đơn bán.


-- ALTER TABLE tChiTietHDB
-- ADD DonGia MONEY;

-- CREATE TRIGGER DonGia on tChiTietHDB
-- FOR INSERT, UPDATE AS
-- BEGIN
--     UPDATE tChiTietHDB SET DonGia=tSach.DonGiaBan
--     FROM inserted JOIN tSach ON inserted.MaSach=tSach.MaSach
--         JOIN tChiTietHDB ON inserted.SoHDB=tChiTietHDB.SoHDB
--             AND inserted.MaSach=tChiTietHDB.MaSach
-- END



-- 3. Thêm trường số lượng hóa đơn vào bảng khách hàng và cập nhật tự động cho trường này mỗi khi thêm hóa đơn




-- 4. Thêm trường số sản phẩm vào bảng hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm chi tiết hóa đơn


-- ALTER TABLE tHoaDonBan
-- ADD SoSanPham INT;

-- CREATE TRIGGER SoSanPham ON tChiTietHDB
-- FOR INSERT AS
-- BEGIN
--     UPDATE tHoaDonBan
--     SET SoSanPham = (SELECT SUM(SLBan) FROM tChiTietHDB WHERE tChiTietHDB.SoHDB = tHoaDonBan.SoHDB)
--     FROM tHoaDonBan
--     WHERE tHoaDonBan.SoHDB IN (SELECT SoHDB FROM inserted)
-- END





-- 5.Thêm trường số sản phẩm vào bảng hóa đơn bán, cập nhật tự động cho trường này mỗi khi xóa chi tiết hóa đơn

-- CREATE TRIGGER SoSanPham_Delete ON tChiTietHDB
-- FOR DELETE AS
-- BEGIN
--     UPDATE tHoaDonBan
--     SET tHoaDonBan.SoSanPham = (SELECT SUM(SLBan)
--     FROM tChiTietHDB
--     WHERE tChiTietHDB.SoHDB = tHoaDonBan.SoHDB)
--     FROM tHoaDonBan
--     WHERE tHoaDonBan.SoHDB IN (SELECT SoHDB
--     FROM deleted)
-- END



-- 6.Thêm trường số sản phẩm vào bảng hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm, sửa, xóa chi tiết hóa đơn




-- 7. Thêm trường tổng tiền cho hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm chi tiết hóa đơn

-- ALTER TABLE tHoaDonBan
-- ADD TongTien MONEY;

-- CREATE TRIGGER TongTien ON tChiTietHDB
-- FOR INSERT AS
-- BEGIN
--     UPDATE tHoaDonBan
-- SET TongTien=(SELECT SLBan*DonGiaBan from tChiTietHDB
-- JOIN tSach ON tChiTietHDB.MaSach=tSach.MaSach
--  where tChiTietHDB.SoHDB=tHoaDonBan.SoHDB )
-- end



-- 8. Thêm trường số lượng hóa đơn vào bảng khách hàng và cập nhật tự động cho trường này mỗi khi thêm, sửa, xóa hóa đơn

-- ALTER TABLE tKhachHang
-- ADD SoLuongHoaDon INT;

-- CREATE TRIGGER SoLuongHoaDon ON tHoaDonBan
-- FOR INSERT, UPDATE, DELETE AS
-- BEGIN
--     UPDATE tKhachHang
--     SET SoLuongHoaDon = (SELECT COUNT(*)
--     FROM tHoaDonBan
--     WHERE tHoaDonBan.MaKH = tKhachHang.MaKH)
--     FROM tKhachHang
--     WHERE tKhachHang.MaKH IN (SELECT MaKH
--     FROM inserted)
-- END


-- 9. Thêm trường số sản phẩm vào bảng hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm, xóa, sửa chi tiết hóa đơn




-- 10. Thêm trường tổng tiền cho hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm, xóa, sửa chi tiết hóa đơn




-- 11. Số lượng trong bảng Sách là số lượng tồn kho, cập nhật tự động dữ liệu cho trường này mỗi khi nhập hay bán sách




-- 12. Thêm trường Tổng tiền tiêu dùng cho bảng khách hàng, cập nhật thông tin cho trường này.




-- 13. Thêm trường Số đầu sách cho bảng nhà cung cấp, cập nhật tự động số đầu sách nhà cung cấp cung cấp cho cửa hàng




-- 14. Thêm trường Số lượng sách và Tổng tiền hàng vào bảng nhà cung cấp, cập nhật dữ liệu cho trường này mỗi khi nhập hàng.




-- 15.Tạo trigger trên bảng thoadonban thực hiện xóa các chi tiết hóa đơn mỗi khi xóa hóa đơn





/*

select * FROM tChiTietHDB

SELECT * FROM tHoaDonBan