-- 1. Tạo view in ra danh sách các sách của nhà xuất bản giáo dục nhập trong năm 2021 

-- CREATE VIEW cau1 AS
-- SELECT tSach.* FROM tSach
-- JOIN tChiTietHDN ON tSach.MaSach = tChiTietHDN.MaSach
-- JOIN tHoaDonNhap ON tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
-- JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
-- WHERE YEAR(NgayNhap)=2021 AND TenNXB=N'NXB Giáo Dục'

-- SELECT * FROM cau1

-- 2. Tạo view thống kê các sách không bán được trong năm 2021 

-- CREATE VIEW cau2 AS
-- SELECT tSach.* 
-- FROM tSach
-- LEFT JOIN tChiTietHDB ON tSach.MaSach = tChiTietHDB.MaSach
-- LEFT JOIN tHoaDonBan ON tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
-- WHERE YEAR(NgayBan) = 2014

-- SELECT * FROM cau2

-- 3. Tạo view thống kê 10 khách hàng có tổng tiền tiêu dùng cao nhất trong năm 2021 

-- CREATE VIEW cau3 AS
-- SELECT TOP 10 tKhachHang.*, SUM(tChiTietHDB.SLBan * tSach.DonGiaBan) AS TongTien
-- FROM tKhachHang
-- JOIN tHoaDonBan ON tKhachHang.MaKH = tHoaDonBan.MaKH
-- JOIN tChiTietHDB ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
-- JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach
-- WHERE YEAR(NgayBan) = 2014
-- GROUP BY tKhachHang.MaKH, tKhachHang.TenKH, tKhachHang.DiaChi, tKhachHang.DienThoai,tKhachHang.GioiTinh
-- ORDER BY TongTien DESC

-- SELECT * FROM cau3

-- 4. Tạo view thống kê số lượng sách bán ra trong năm 2021 và số lượng sách nhập trong năm 2021 và chênh lệch giữa hai số lượng này ứng với mỗi đầu sách 

-- CREATE VIEW cau4 AS
-- SELECT
--     tSach.MaSach,
--     tSach.TenSach,
--     ISNULL(SUM(tChiTietHDB.SLBan),0)AS SoLuongBan,
--     ISNULL( (
--         SELECT SUM(tChiTietHDN.SLNhap)
--     FROM tChiTietHDN
--         JOIN tHoaDonNhap ON tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
--     WHERE YEAR(tHoaDonNhap.NgayNhap) = 2014 AND tChiTietHDN.MaSach = tSach.MaSach
--     ),0) AS SoLuongNhap,
--     ISNULL(SUM(tChiTietHDB.SLBan),0)-ISNULL( (
--         SELECT SUM(tChiTietHDN.SLNhap)
--     FROM tChiTietHDN
--         JOIN tHoaDonNhap ON tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
--     WHERE YEAR(tHoaDonNhap.NgayNhap) = 2014 AND tChiTietHDN.MaSach = tSach.MaSach
--     ),0) AS ChenhLech
-- FROM tSach
--     JOIN tChiTietHDB ON tSach.MaSach = tChiTietHDB.MaSach
--     JOIN tHoaDonBan ON tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
-- WHERE YEAR(NgayBan) = 2014
-- GROUP BY tSach.MaSach, tSach.TenSach;

-- SELECT * FROM cau4;

-- 5. Tạo view đưa ra những thông tin hóa đơn và tổng tiền của hóa đơn đó trong ngày 16/11/2021 

CREATE VIEW cau5 AS
SELECT tHoaDonBan.*, SUM(tChiTietHDB.SLBan * tSach.DonGiaBan) AS TongTien
FROM tHoaDonBan
JOIN tChiTietHDB ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach
-- WHERE NgayBan = '2014-08-11'
GROUP BY tHoaDonBan.SoHDB, NgayBan, MaKH, MaNV




-- SELECT * FROM cau5



-- 6.  Tạo view đưa ra doanh thu bán hàng của từng tháng trong năm 2014, những tháng không có doanh thu thì ghi là 0. 




-- 7.  Tạo view đưa ra doanh thu bán hàng theo ngày, và tổng doanh thu cho mỗi tháng (dùng roll up) 




-- 8. Tạo view đưa ra danh sách 3 khách hàng có tiền tiêu dùng cao nhất 




-- 9. Tạo view đưa ra 10 đầu sách được tiêu thụ nhiều nhất trong năm 2022 và số lượng tiêu thụ mỗi đầu sách. 




-- 10. Tạo view SachGD đưa ra danh sách các sách  với các thông tin MaSach,TenSach, tên thể loại, tổng số lượng nhập, tổng số lượng bán, số lượng tồn do Nhà xuất bản Giáo Dục xuất bản. 




-- 11. Tạo view KhachVip đưa ra khách hàng gồm thông tin MaKH, TenKH, địa chỉ, điện thoại cho những khách hàng đã mua hàng với tổng tất cả các trị giá hóa đơn trong năm hiện tại lớn hơn 30.000.000 




-- 12. Tạo view đưa ra số hóa đơn, trị giá các hóa đơn và tổng toàn bộ trị giá của các hoa đơn do nhân viên có tên “Trần Huy” lập trong tháng hiện tại 




-- 13. Tạo view đưa thông tin các các sách còn tồn  




-- 14. Tạo view đưa ra danh sách các sách không bán được trong năm 2014. 




-- 15. Tạo view đưa ra danh sách các sách của NXB Giáo Dục không bán được trong năm 2014. 




-- 16. Tạo view đưa ra các thông tin về sách và số lượng từng sách được bán ra trong năm 2014. 




-- 17. Tạo view đưa ra họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2014. 




-- 18. Tạo view đưa ra danh sách 3 nhân viên (MaKH, TenKH) có doanh số cao nhất của năm hiện tại. 




-- 19. Tạo view đưa ra danh sách sách và số lượng nhập của mỗi nhà xuất bản trong năm hiện tại 


/*

SELECT * FROM tSach
order by MaSach


SELECT * FROM tNhaCungCap

SELECT * FROM tNhanVien

SELECT * FROM tKhachHang

SELECT * FROM tNhaXuatBan

SELECT * FROM tTheLoai

SELECT * FROM tHoaDonNhap

SELECT * FROM tHoaDonBan

SELECT * FROM tChiTietHDN

SELECT * FROM tChiTietHDB

DROP VIEW cau5


*/