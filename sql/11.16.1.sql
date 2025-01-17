-- 1. In ra danh sách các sách chỉ lấy (MaSach,TenSach) do Nhà xuất bản Giáo Dục xuất bản. 

SELECT MaSach, TenSach
FROM tSach
WHERE MaNXB = 'NXB05';

-- 2. In ra danh sách các sách có tên bắt đầu là “Ngày”. 

SELECT MaSach, TenSach
FROM tSach
WHERE TenSach LIKE N'Ngày%';

-- 3. In ra danh sách các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục có giá từ 100.000 đến 150.000. 

SELECT MaSach, TenSach
FROM tSach
WHERE MaNXB = 'NXB05' AND DonGiaBan BETWEEN 100000 AND 150000;

-- 4. In ra danh sách các các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục hoặc Nhà  Xuất Bản Trẻ sản xuất có giá từ 90.000 đến 140.000. 

SELECT MaSach, TenSach
FROM tSach
WHERE (MaNXB = 'NXB05' OR MaNXB = 'NXB02') AND DonGiaBan BETWEEN 90000 AND 140000;

-- 5. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2014 và ngày 31/12/2014. 

SELECT hdb.SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE NgayBan IN ('2014-01-01', '2014-12-31')
GROUP BY hdb.SoHDB;

-- 6. In ra các số hóa đơn, trị giá hóa đơn trong tháng 4/2014, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần). 

SELECT hdb.SoHDB, NgayBan, SUM(SLBan * DonGiaBan) AS TriGia
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE NgayBan BETWEEN '2014-04-01' AND '2014-04-30'
GROUP BY hdb.SoHDB, NgayBan
ORDER BY NgayBan ASC, TriGia DESC;

-- 7. In ra danh sách các khách hàng (MaKH, TenKH) đã mua hàng trong ngày 10/4/2014. 

SELECT DISTINCT kh.MaKH, kh.TenKH
FROM tKhachHang kh
JOIN tHoaDonBan hdb ON kh.MaKH = hdb.MaKH
WHERE NgayBan = '2014-04-10';

-- 8. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Trần Huy” lập trong ngày “11/8/2014” 

SELECT hdb.SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
JOIN tNhanVien nv ON hdb.MaNV = nv.MaNV
WHERE nv.TenNV = N'Trần Huy' AND NgayBan = '2014-08-11'
GROUP BY hdb.SoHDB;

-- 9. In ra danh sách các sách (MaSach,TenSach) được khách hàng có tên “Nguyễn Đình Sơn” mua trong tháng 8/2014. 

SELECT DISTINCT s.MaSach, s.TenSach
FROM tSach s
JOIN tChiTietHDB cthdb ON s.MaSach = cthdb.MaSach
JOIN tHoaDonBan hdb ON cthdb.SoHDB = hdb.SoHDB
JOIN tKhachHang kh ON hdb.MaKH = kh.MaKH
WHERE kh.TenKH = N'Nguyễn Đình Sơn' AND NgayBan BETWEEN '2014-08-01' AND '2014-08-31';

-- 10. Tìm các số hóa đơn đã mua sách “Cấu trúc dữ liệu và giải thuật”  

SELECT DISTINCT hdb.SoHDB
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE s.TenSach = N'Cấu trúc dữ liệu và giải thuật';

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “S01” hoặc “S02”, mỗi sản phẩm mua với số lượng từ 10 đến 20. 

SELECT DISTINCT hdb.SoHDB
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE (s.MaSach = 'S01' OR s.MaSach = 'S02') AND SLBan BETWEEN 10 AND 20;

-- 12. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “S10” và “S11”, mỗi sản phẩm mua với số lượng từ 5 đến 10. 

SELECT DISTINCT hdb.SoHDB
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE (s.MaSach = 'S10' OR s.MaSach = 'S11') AND SLBan BETWEEN 5 AND 10

-- 13. In ra danh sách các sách không bán được. 

SELECT MaSach, TenSach
FROM tSach
WHERE MaSach NOT IN (SELECT MaSach FROM tChiTietHDB);

-- 14. In ra danh sách các sách không bán được trong năm 2014. 

SELECT MaSach, TenSach
FROM tSach
WHERE MaSach NOT IN (SELECT MaSach FROM tChiTietHDB WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014));

-- 15. In ra danh sách các sách của NXB Giáo Dục không bán được trong năm 2014. 

SELECT MaSach, TenSach
FROM tSach
WHERE MaNXB = 'NXB05' AND MaSach NOT IN (SELECT MaSach FROM tChiTietHDB WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014));

-- 16. Tìm số hóa đơn đã mua tất cả các sách của NXB Giáo Dục. 

SELECT hdb.SoHDB
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE s.MaNXB = 'NXB05'
GROUP BY hdb.SoHDB
HAVING COUNT(DISTINCT s.MaSach) = (SELECT COUNT(DISTINCT MaSach) FROM tSach WHERE MaNXB = 'NXB05');

-- 17. Có bao nhiêu đầu sách khác nhau được bán ra trong năm 2014. 

SELECT COUNT(DISTINCT MaSach)
FROM tChiTietHDB
WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014);

-- 18. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu? 

SELECT MAX(TriGia) AS TriGiaCaoNhat, MIN(TriGia) AS TriGiaThapNhat
FROM (SELECT SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
      FROM tChiTietHDB cthdb
      JOIN tSach s ON cthdb.MaSach = s.MaSach
      GROUP BY SoHDB) AS temp;

-- 19. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2014 là bao nhiêu? 

SELECT AVG(TriGia) AS TriGiaTrungBinh
FROM (SELECT SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
      FROM tChiTietHDB cthdb
      JOIN tSach s ON cthdb.MaSach = s.MaSach
      WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014)
      GROUP BY SoHDB) AS temp;

-- 20. Tính doanh thu bán hàng trong năm 2014. 

SELECT SUM(TriGia) AS DoanhThu
FROM (SELECT SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
      FROM tChiTietHDB cthdb
      JOIN tSach s ON cthdb.MaSach = s.MaSach
      WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014)
      GROUP BY SoHDB) AS temp;

-- 21. Tìm số hóa đơn có trị giá cao nhất trong năm 2014. 

SELECT TOP 1 SoHDB, TriGia
FROM (
    SELECT SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
    FROM tChiTietHDB cthdb
    JOIN tSach s ON cthdb.MaSach = s.MaSach
    WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014)
    GROUP BY SoHDB
) AS temp
ORDER BY TriGia DESC

-- 22. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2014. 

SELECT TOP 1 kh.TenKH, TriGia
FROM tKhachHang kh
JOIN tHoaDonBan hdb ON kh.MaKH = hdb.MaKH
JOIN (
    SELECT SoHDB, SUM(SLBan * DonGiaBan) AS TriGia
    FROM tChiTietHDB cthdb
    JOIN tSach s ON cthdb.MaSach = s.MaSach
    WHERE SoHDB IN (SELECT SoHDB FROM tHoaDonBan WHERE YEAR(NgayBan) = 2014)
    GROUP BY SoHDB
) AS temp ON hdb.SoHDB = temp.SoHDB

-- 23. In ra danh sách 3 khách hàng (MaKH, TenKH) có doanh số cao nhất. 

SELECT TOP 3 kh.MaKH, kh.TenKH, SUM(SLBan * DonGiaBan) AS DoanhSo
FROM tKhachHang kh
JOIN tHoaDonBan hdb ON kh.MaKH = hdb.MaKH
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
GROUP BY kh.MaKH, kh.TenKH
ORDER BY DoanhSo DESC

-- 24. In ra danh sách các sách có giá bán bằng 1 trong 3 mức giá cao nhất. 

SELECT MaSach, TenSach
FROM tSach
WHERE DonGiaBan IN (
    SELECT TOP 3 DonGiaBan
    FROM tSach
    ORDER BY DonGiaBan DESC
)

-- 25. In ra danh sách các sách do NXB Giáo Dục sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm). 

SELECT MaSach, TenSach
FROM tSach
WHERE MaNXB = 'NXB05' AND DonGiaBan IN (
    SELECT TOP 3 DonGiaBan
    FROM tSach
    ORDER BY DonGiaBan DESC
)

-- 26. Tính tổng số đầu sách do NXB Giáo Dục xuất bản. 

SELECT COUNT(*)
FROM tSach
WHERE MaNXB = 'NXB05'

-- 27. Tính tổng số sách của từng NXB. 

SELECT MaNXB, COUNT(*)
FROM tSach
GROUP BY MaNXB

-- 28. Với từng NXB, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm. 

SELECT MaNXB, MAX(DonGiaBan) AS DonGiaBanCaoNhat, MIN(DonGiaBan) AS DonGiaBanThapNhat, AVG(DonGiaBan) AS DonGiaBanTrungBinh
FROM tSach
GROUP BY MaNXB

-- 29. Tính doanh thu bán hàng mỗi ngày. 

SELECT NgayBan, SUM(SLBan * DonGiaBan) AS DoanhThu
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
GROUP BY NgayBan

-- 30. Tính tổng số lượng của từng sách bán ra trong tháng 10/2014. 

SELECT s.MaSach, s.TenSach, SUM(SLBan) AS TongSoLuong
FROM tSach s
JOIN tChiTietHDB cthdb ON s.MaSach = cthdb.MaSach
JOIN tHoaDonBan hdb ON cthdb.SoHDB = hdb.SoHDB
WHERE MONTH(NgayBan) = 10 AND YEAR(NgayBan) = 2014
GROUP BY s.MaSach, s.TenSach

-- 31. Tính doanh thu bán hàng của từng tháng trong năm 2014 (kể cả những tháng không có doanh thu, VD: Tháng 1: 0; Tháng 2: 12000000; Tháng 3: 0; Tháng ….) 

SELECT MONTH(NgayBan) AS Thang, SUM(SLBan * DonGiaBan) AS DoanhThu
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE YEAR(NgayBan) = 2014
GROUP BY MONTH(NgayBan)

-- 32. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau. 

SELECT hdb.SoHDB
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
GROUP BY hdb.SoHDB
HAVING COUNT(DISTINCT s.MaSach) >= 4

-- 33. Tìm hóa đơn có mua 3 sách do NXB Giáo Dục xuất bản (3 sách khác nhau). 

SELECT hdb.SoHDB
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE s.MaNXB = 'NXB05'
GROUP BY hdb.SoHDB
HAVING COUNT(DISTINCT s.MaSach) = 3

-- 34. Tìm khách hàng (MaKH, TenKH) có số lần mua hàng nhiều nhất. 

SELECT TOP 1 kh.MaKH, kh.TenKH, COUNT(hdb.SoHDB) AS SoLanMua
FROM tKhachHang kh
JOIN tHoaDonBan hdb ON kh.MaKH = hdb.MaKH
GROUP BY kh.MaKH, kh.TenKH
ORDER BY SoLanMua DESC

-- 35. Tháng mấy trong năm 2014, doanh số bán hàng cao nhất ? 

SELECT TOP 1 MONTH(NgayBan) AS Thang, SUM(SLBan * DonGiaBan) AS DoanhSo
FROM tHoaDonBan hdb
JOIN tChiTietHDB cthdb ON hdb.SoHDB = cthdb.SoHDB
JOIN tSach s ON cthdb.MaSach = s.MaSach
WHERE YEAR(NgayBan) = 2014
GROUP BY MONTH(NgayBan)

-- 36. Tìm sách có tổng số lượng bán ra thấp nhất trong năm 2014. 

SELECT TOP 1 s.MaSach, s.TenSach, SUM(SLBan) AS TongSoLuong
FROM tSach s
JOIN tChiTietHDB cthdb ON s.MaSach = cthdb.MaSach
JOIN tHoaDonBan hdb ON cthdb.SoHDB = hdb.SoHDB
WHERE YEAR(NgayBan) = 2014
GROUP BY s.MaSach, s.TenSach
ORDER BY TongSoLuong ASC

-- 37. Mỗi NXB, tìm sách (MaSach,TenSach) có giá bán cao nhất. 

SELECT tSach.MaNXB, MaSach, TenSach, DonGiaBan
FROM tSach
JOIN (
    SELECT MaNXB, MAX(DonGiaBan) AS MaxDonGiaBan
    FROM tSach
    GROUP BY MaNXB
) AS maxPrices ON tSach.MaNXB = maxPrices.MaNXB AND tSach.DonGiaBan = maxPrices.MaxDonGiaBan

-- 38. Giảm giá sách 10% cho các sách của NXB Giáo Dục  

UPDATE tSach
SET DonGiaBan = DonGiaBan * 0.9
WHERE MaNXB = 'NXB05'

-- 39. Thêm trưởng tổng tiền cho bảng tHoaDonBan rồi cập nhật tổng tiền của hóa đơn cho trường này. 

ALTER TABLE tHoaDonBan
ADD TongTien DECIMAL(18, 2);

UPDATE tHoaDonBan
SET TongTien = (
    SELECT SUM(SLBan * DonGiaBan)
    FROM tChiTietHDB cthdb
    JOIN tSach s ON cthdb.MaSach = s.MaSach
    WHERE cthdb.SoHDB = tHoaDonBan.SoHDB
)

-- 40. Giảm 10% trên tổng hóa đơn cho các hóa đơn có trị giá trên 500.000 trong tháng 9/2014 

UPDATE tHoaDonBan
SET TongTien = TongTien * 0.9
WHERE TongTien > 500000 AND SoHDB IN (
    SELECT SoHDB
    FROM tHoaDonBan
    WHERE MONTH(NgayBan) = 9 AND YEAR(NgayBan) = 2014
)

-- 41. Tính tổng số lượng sách nhập trong năm 2014 

SELECT SUM(SLNhap) AS TongSoLuong
FROM tChiTietHDN cthdn
JOIN tHoaDonNhap hdn ON cthdn.SoHDN = hdn.SoHDN
WHERE YEAR(NgayNhap) = 2014

-- 42. Tính tổng số lượng sách bán trong năm 2014 

SELECT SUM(SLBan) AS TongSoLuong
FROM tChiTietHDB cthdb
JOIN tHoaDonBan hdb ON cthdb.SoHDB = hdb.SoHDB
WHERE YEAR(NgayBan) = 2014

-- 43. Tính tổng tiền đã nhập trong năm 2014 

SELECT SUM(SLNhap * DonGiaNhap) AS TongTien
FROM tChiTietHDN cthdn
JOIN tSach s ON cthdn.MaSach = s.MaSach
JOIN tHoaDonNhap hdn ON cthdn.SoHDN = hdn.SoHDN
WHERE YEAR(NgayNhap) = 2014

-- 44. Xóa những hóa đơn do nhân viên "Trần Huy" lập (lưu ý xóa chi tiết hóa đơn trước) 

DELETE FROM tChiTietHDB
WHERE SoHDB IN (
    SELECT SoHDB
    FROM tHoaDonBan
    WHERE MaNV = (
        SELECT MaNV
        FROM tNhanVien
        WHERE TenNV = N'Trần Huy'
    )
)

DELETE FROM tHoaDonBan
WHERE MaNV = (
    SELECT MaNV
    FROM tNhanVien
    WHERE TenNV = N'Trần Huy'
)

-- 45. Đổi tên "NXB Thăng Long" thành "NXB Văn học"

UPDATE tNhaXuatBan
SET TenNXB = N'NXB Văn học'
WHERE TenNXB = N'NXB Thăng Long'

-- 46. Đưa ra thông tin toàn bộ sách, nếu sách được bán trong năm 2014 thì đưa ra SL bán

SELECT s.MaSach, s.TenSach, s.MaNXB, s.DonGiaBan, SUM(SLBan) AS SLBan
FROM tSach s
LEFT JOIN tChiTietHDB cthdb ON s.MaSach = cthdb.MaSach
LEFT JOIN tHoaDonBan hdb ON cthdb.SoHDB = hdb.SoHDB
WHERE YEAR(NgayBan) = 2014
GROUP BY s.MaSach, s.TenSach, s.MaNXB, s.DonGiaBan
