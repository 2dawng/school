-- 02 lệnh gồm select có điều kiện trên một bảng

-- 1. Liệt kê máy tính có thời gian bảo hành là 12 tháng 
SELECT *
FROM MAYTINH
WHERE TGBAOHANH=12

-- 2. In ra thông tin nhân viên nam có lương từ 1200 đến 1500
SELECT *
FROM NHANVIEN
WHERE GIOITINH=N'Nam' and LUONG between 1200 and 1500

-- 03 lệnh gồm SELECT có điều kiện trên hai bảng

-- 3. In ra thông tin nhân viên ở bộ phận kĩ thuật
SELECT NHANVIEN.*
FROM NHANVIEN join BOPHAN on NHANVIEN.MABP=BOPHAN.MABP
WHERE TENBP=N'kĩ thuật'

-- 4. In ra thông tin hóa đơn do nhân viên 'Lê Đức Hùng' lập
SELECT HOADON.*
FROM NHANVIEN join HOADON on NHANVIEN.MANV=HOADON.MANV
WHERE TEN= N'Lê Đức Hùng'

-- 5. Liệt kê tên khách hàng đã mua hàng trong ngày 22/4/2023
SELECT TEN, NGAYBAN
FROM KHACHHANG JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE NGAYBAN = '2023-04-22'

-- 02 câu lệnh gồm SELECT có WHERE và GROUP BY

-- 6. Liệt kê mã bộ phận,tên bộ phận và số lượng nhân viên có lương lớn hơn 1000 theo từng bộ phận. 
SELECT TENBP, BP.MABP, count(NV.MANV) as N'Số Lượng Nhân Viên'
FROM NHANVIEN NV join BOPHAN BP on NV.MABP=BP.MABP
WHERE LUONG>1000
GROUP BY TENBP,BP.MABP

-- 7. tổng số tiền bán được Những máy tính có giá > 15.000.000 theo từng máy tính
SELECT MT.MAMAY, TENMAY, SUM(SOLUONGBAN*GIABAN) as N'Tổng Tiền'
FROM MAYTINH MT join CTHDMAYTINH HDMT on MT.MAMAY=HDMT.MAMAY
WHERE GIABAN>15000000
GROUP BY MT.MAMAY,TENMAY

-- 03 câu lệnh gồm SELECT có WHERE, GROUP BY, HAVING

-- 8. Liệt kê tên bộ phận, mã bộ phận và lương trung bình của những nhân viên có ngoại ngữ là tiếng anh theo từng bộ phận nếu lương trung bình lớn hơn 1500.
SELECT TENBP, BP.MABP, AVG(LUONG) as N'Lương Trung Bình'
FROM NHANVIEN NV join BOPHAN BP on NV.MABP=BP.MABP
WHERE NGOAINGU=N'Tiếng Anh'
GROUP BY TENBP,BP.MABP
HAVING AVG(LUONG)>1500

-- 9. Liệt kê hãng sản xuất và số lượng máy tính theo từng hãng nếu thời gian bảo hành lớn hơn 12 tháng và số lượng máy tính lớn hơn hoặc bằng 2.
SELECT HANGSX
FROM MAYTINH
WHERE TGBAOHANH>12
GROUP BY HANGSX
HAVING count(MAMAY)>=2

-- 10. liệt kê linh kiện và tổng tiền nhập có số lượng nhập nhỏ hơn 45 với tổng tiền nhập lớn hơn 10.000.000
SELECT LK.MALK, TENLK, SUM(SLNHAP*DONGIANHAP) as N'Tổng Tiền Nhập'
FROM LINHKIEN LK join CTPNLINHKIEN PNLK on PNLK.MALK=LK.MALK
WHERE SLNHAP<45
GROUP BY LK.MALK, TENLK
HAVING SUM(SLNHAP*DONGIANHAP)>10000000

-- 02 câu lệnh gồm SELECT có WHERE, GROUP BY, HAVING và ORDER BY

-- 11 . Đưa ra máy tính có thời gian bảo hành lớn hơn 6 tháng bán được nhiều nhất với tổng tiền bán được phải Lớn hơn 40.000.000
SELECT TOP(1) With ties
    MT.MAMAY, TENMAY, SUM(SOLUONGBAN*GIABAN) as N'Tổng Tiền Bán', SUM(SOLUONGBAN)
FROM MAYTINH MT join CTHDMAYTINH HDMT on HDMT.MAMAY=MT.MAMAY
WHERE TGBAOHANH>6
GROUP BY MT.MAMAY,TENMAY
HAVING SUM(SOLUONGBAN*GIABAN)>40000000
ORDER BY SUM(SOLUONGBAN)

-- 12. Liệt kê tên ngoại ngữ và số lượng nhân viên theo từng ngoại ngữ nếu số lượng nhân viên trên 25 tuổi lớn hơn 2 và sắp xếp tăng dần theo số lượng nhân viên.
SELECT NGOAINGU, count(MANV) as N'SL Nhân Viên'
FROM NHANVIEN
WHERE YEAR(GETDATE())- YEAR(NGAYSINH)>25
GROUP BY NGOAINGU
HAVING count(MANV)>1
ORDER BY count(MANV)

-- 02 câu lệnh gồm SELECT có WHERE, GROUP BY,HAVING và truy vấn con

-- 13. cho biết địa chỉ, số khách hàng ở địa chỉ đó sao cho có nhiều hơn 1 khách hàng và các khách hàng chưa từng mua linh Kiện 'MainBoard'
SELECT DIACHI, COUNT(MAKH) as N'Số Khách Hàng'
FROM KHACHHANG
WHERE MAKH NOT IN
(  SELECT KH.MAKH
FROM KHACHHANG KH
    join HOADON HD on HD.MAKH=KH.MAKH
    join CTHDLINHKIEN HDLK on HDLK.MAHD=HD.MAHD
    join LINHKIEN LK on LK.MALK=HDLK.MALK
WHERE NOT TENLK='MainBoard' )
GROUP BY DIACHI
HAVING COUNT(MAKH)>1

-- 14. Liệt kê tên bộ phận và số lượng nhân viên có lương lớn hơn lương trung bình của những nhân viên trong bộ phận ‘BP01’ theo từng bộ phận nếu số lượng nhân viên lớn hơn 1.
SELECT BP.MABP, TENBP, COUNT(NV.MANV) as N'Số nhân viên'
FROM NHANVIEN NV join BOPHAN BP on BP.MABP=NV.MABP
WHERE LUONG > (  SELECT AVG(LUONG)
FROM NHANVIEN NV
    join BOPHAN BP on BP.MABP=NV.MABP
WHERE BP.MABP='1603')
GROUP BY BP.MABP,TENBP
HAVING COUNT(NV.MANV)>1

-- 02 câu câu lệnh INSERT có điều kiện 

-- 15. Thêm một hóa đơn mới khi tổng số lượng sản phẩm bán ra lớn hơn hoặc bằng 5
INSERT INTO HOADON
    (MAHD, NGAYBAN, CHIETKHAU, MAKH, MANV)
SELECT '2011', GETDATE(), 0.15, '3009', '1007'
WHERE EXISTS (
    SELECT 1
FROM CTHDMAYTINH
GROUP BY MAHD
HAVING SUM(SOLUONGBAN) >= 5
);

-- 16. Thêm chi tiết hóa đơn mới vào bảng CTHDMAYTINH nếu Mã máy '4007' chưa được mua

INSERT INTO CTHDMAYTINH
    (MAHD, MAMAY, SOLUONGBAN, GIABAN)
SELECT '2010', '4007', 1, 15000000
WHERE NOT EXISTS (
    SELECT 1
FROM CTHDMAYTINH
WHERE MAMAY = '4007'
);

-- 02 câu lệnh UPDATE có điều kiện

-- 17. Tăng lương của những nhân viên trong bộ phận ‘1602’ lên 10%.
UPDATE NHANVIEN 
SET LUONG = LUONG * 1.1 
WHERE MABP = '1602'

-- 18. Cập nhật thời gian bảo hành của máy tính hãng ‘DELL’ lên 24 tháng nếu thời gian bảo hành hiện tại nhỏ hơn 24 tháng.
UPDATE MAYTINH 
SET TGBAOHANH = 24 
WHERE HANGSX = 'DELL' AND TGBAOHANH < 24

-- 02 câu lệnh DELETE có điều kiện

-- 19. Xóa những chi tiết hóa đơn linh kiện có số lượng bán <2 
DELETE FROM CTHDLINHKIEN 
WHERE SOLUONGBAN<2

-- 20. Xóa những chi tiết hóa đơn máy tính có giá bán <20.000.000
DELETE FROM CTHDMAYTINH 
WHERE GIABAN<20000000


-- 21. Chọn ra nhân viên có doanh số bán hàng cao nhất từ tháng 1 đến tháng 4 năm 2024
SELECT TOP 1 WITH TIES
    HOADON.MANV, NHANVIEN.TEN, SUM(TONGDOANHSO)-(SUM(TONGDOANHSO)*HOADON.CHIETKHAU) AS TONGDOANHSO
FROM (
                        SELECT MAHD, SUM(SOLUONGBAN * GIABAN) AS TONGDOANHSO
        FROM CTHDLINHKIEN
        GROUP BY MAHD
    UNION ALL
        SELECT MAHD, SUM(SOLUONGBAN * GIABAN) AS TONGDOANHSO
        FROM CTHDMAYTINH
        GROUP BY MAHD
) AS DOANHTHU
    JOIN HOADON ON DOANHTHU.MAHD=HOADON.MAHD
    JOIN NHANVIEN ON HOADON.MANV=NHANVIEN.MANV
WHERE MONTH(HOADON.NGAYBAN) BETWEEN 1 AND 4 AND YEAR(HOADON.NGAYBAN) = 2024
GROUP BY  HOADON.MANV, NHANVIEN.TEN, HOADON.CHIETKHAU
ORDER BY TONGDOANHSO DESC

    SELECT MAHD, SUM(SOLUONGBAN * GIABAN) AS TONGDOANHSO
    FROM CTHDLINHKIEN
    GROUP BY MAHD
UNION ALL
    SELECT MAHD, SUM(SOLUONGBAN * GIABAN) AS TONGDOANHSO
    FROM CTHDMAYTINH
    GROUP BY MAHD



SELECT TOP 1 WITH TIES DOANHSONHANVIEN.MANV, NHANVIEN.TEN, NHANVIEN.LUONG*NHANVIEN.HESOLUONG, DOANHSONHANVIEN.TONGDOANHSO AS LUONGTONG
FROM
(
SELECT  HOADON.MANV, SUM(DOANHSO) AS TONGDOANHSO
FROM (
        SELECT MAHD, SUM(SOLUONGBAN * GIABAN) AS DOANHSO
        FROM CTHDLINHKIEN
        GROUP BY MAHD
    UNION ALL
        SELECT MAHD, SUM(SOLUONGBAN * GIABAN) AS DOANHSO
        FROM CTHDMAYTINH
        GROUP BY MAHD
) AS DOANHSOHOADON
    JOIN HOADON ON HOADON.MAHD=DOANHSOHOADON.MAHD
GROUP BY HOADON.MANV
ORDER BY TONGDOANHSO DESC) AS DOANHSONHANVIEN
JOIN NHANVIEN ON DOANHSONHANVIEN.MANV=NHANVIEN.MANV
ORDER BY LUONGTONG 

select * from HOADON
SELECT * FROM CTHDLINHKIEN
