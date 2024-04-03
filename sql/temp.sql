1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.
SELECT MaSV, HoSV, TenSV, HocBong
FROM DSSinhVien
ORDER BY MaSV

2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh
FROM DSSinhVien
ORDER BY Phai

3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
SELECT HoSV, TenSV, NgaySinh, HocBong
FROM DSSinhVien
ORDER BY NgaySinh ,HocBong DESC

4. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
SELECT HoSV, TenSV, MaKhoa, NoiSinh, HocBong
FROM DSSinhVien
WHERE HocBong>=150000 AND NoiSinh=N'Hà Nội'

5. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
SELECT MaSV, NgaySinh, Phai, MaKhoa
FROM DSSinhVien
WHERE HocBong>=80000 AND HocBong <=150000

6. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
SELECT MaMH, TenMH, SoTiet
FROM DMMonHoc
WHERE SoTiet>30 AND SoTiet <45

7. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
SELECT HoSV, TenSV, YEAR(GETDATE())-YEAR(NgaySinh) AS Tuoi, TenKhoa
FROM DSSinhVien JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
WHERE YEAR(GETDATE())-YEAR(NgaySinh) BETWEEN 20 AND 25

8. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
SELECT MaSV, Phai, MaKhoa, CASE WHEN HocBong >500000 THEN N'Học bổng cao' ELSE N'Mức trung bình' END AS MucHocBong
FROM DSSinhVien

9. Cho biết tổng số sinh viên của toàn trường
SELECT COUNT(MaSV) AS SoSinhVien
FROM DSSinhVien


10. Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT COUNT(*) AS TongSinhVien, SUM(CASE WHEN Phai = N'Nữ' THEN 1 ELSE 0 END) AS TongSinhVienNu
FROM DSSinhVien

11. Cho biết tổng số sinh viên của từng khoa.
SELECT TenKhoa, COUNT(*) AS TongSinhVien
FROM DSSinhVien JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
GROUP BY TenKhoa;

12. Cho biết số lượng sinh viên học từng môn. Đếm số lượng sinh viên học từng môn
SELECT TenMH, COUNT(DISTINCT MaSV) AS SoLuongSinhVien
FROM KetQua JOIN DMMonHoc ON KetQua.MaMH = DMMonHoc.MaMH
GROUP BY TenMH

13. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng kq)
SELECT COUNT(DISTINCT MaMH) AS SoLuongMonDaHoc
FROM KetQua;

14. Cho biết tổng số học bổng của mỗi khoa.
SELECT TenKhoa, SUM(HocBong) AS TongSoHocBong
FROM DSSinhVien JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
GROUP BY TenKhoa;

15. Cho biết học bổng cao nhất của mỗi khoa.
SELECT TenKhoa, Max(HocBong) AS HocBongCaoNhat
FROM DSSinhVien JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
GROUP BY TenKhoa;

16. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
SELECT TenKhoa, SUM(CASE WHEN Phai = N'Nam' THEN 1 ELSE 0 END) AS SinhVienNam, SUM(CASE WHEN Phai = N'Nữ' THEN 1 ELSE 0 END) AS SinhVienNu
FROM DSSinhVien JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
GROUP BY TenKhoa;

17. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
SELECT YEAR(NgaySinh) AS NamSinh
FROM DSSinhVien
GROUP BY YEAR(NgaySinh)
HAVING COUNT(*) = 2;

18. Cho biết những sinh viên thi lại trên 2 lần.
SELECT MaSV
FROM KetQua
WHERE LanThi > 2

19. Đưa ra điểm trung bình của sinh viên có mã ‘A06’
SELECT AVG(Diem) AS DiemTrungBinh
FROM KetQua
WHERE MaSV = 'A06';

20. Thống kê số học sinh học cho mỗi môn học
SELECT TenMH, COUNT(DISTINCT MaSV) AS SoLuongHocSinh
FROM KetQua JOIN DMMonHoc ON KetQua.MaMH = DMMonHoc.MaMH
GROUP BY TenMH;

21. Đưa ra danh sách sinh viên gồm mã sinh viên, họ và tên, ngày sinh, tên khoa học, điểm trung bình
SELECT DSSinhVien.MaSV, HoSV, TenSV, NgaySinh, TenKhoa, AVG(Diem) AS DiemTrungBinh
FROM DSSinhVien
JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
GROUP BY DSSinhVien.MaSV, HoSV, TenSV, NgaySinh, TenKhoa

22. Đưa ra danh sách sinh viên xuất sắc gồm mã sinh viên, họ và tên, ngày sinh, tên khoa học, điểm trung bình với điểm trunh bình >=9.0
SELECT DSSinhVien.MaSV, HoSV, TenSV, NgaySinh, TenKhoa, AVG(Diem) AS DiemTrungBinh
FROM DSSinhVien
    JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
    JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
GROUP BY DSSinhVien.MaSV, HoSV, TenSV, NgaySinh, TenKhoa
HAVING AVG(Diem) >= 9;

23. Cho biết thông tin của các sinh viên, gồm: Mã sinh viên,tên sinh viên, Phái, Mã khoa, Điểm lần 1 môn có mã 01 (nếu có).
SELECT SV.MaSV, TenSV, Phai, MaKhoa, Diem
FROM DSSinhVien SV
LEFT JOIN KetQua ON SV.MaSV = KetQua.MaSV AND MaMH = '01' AND LanThi=1;

24. Thêm trường TinhTrang (tình trạng) vào bảng kết quả. Cập nhật dữ liệu cho trường này biết rằng nếu điểm trung bình (điểm trung bình được tính như câu 2.3) <4 ghi 0, từ 4 đến dưới 5.5 ghi 1, còn lại không ghi (null).
ALTER TABLE KetQua
ADD TinhTrang INT

UPDATE KetQua
SET TinhTrang = CASE
WHEN Diem < 4 THEN 0
WHEN Diem >= 4 AND Diem < 5.5 THEN 1
ELSE NULL
END;

25. Xoá tất cả những sinh viên chưa dự thi môn nào.
DELETE FROM DSSinhVien
WHERE MaSV NOT IN (SELECT DISTINCT MaSV
FROM KetQua);

26. Xóa những môn mà không có sinh viên học.
DELETE FROM DMMonHoc
WHERE MaMH NOT IN (SELECT DISTINCT MaMH
FROM KetQua);

27. Thêm vào bảng khoa cột Siso, cập nhật sỉ số vào khoa từ dữ liệu sinh viên.
ALTER TABLE DMKhoa ADD Siso INT;
UPDATE DMKhoa
SET Siso = (SELECT COUNT(*)
FROM DSSinhVien
WHERE MaKhoa = DMKhoa.MaKhoa);

28. Tăng thêm 1 điểm cho các sinh viên vớt lần 2. Nhưng chỉ tăng tối đa là 5 điểm
UPDATE KetQua
SET Diem = CASE WHEN LanThi = 2 AND Diem+1 <= 5 THEN Diem + 1
ELSE Diem
END;

29. Tăng học bổng lên 100000 cho những sinh viên có điểm trung bình là 6.5 trở lên
UPDATE DSSinhVien
SET HocBong = 100000
WHERE MaSV IN (SELECT MaSV
FROM KetQua
GROUP BY MaSV
HAVING AVG(Diem) >= 6.5);

30. Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rớt ở lần 1
UPDATE DSSinhVien
SET HocBong = 0
WHERE MaSV IN (
SELECT MaSV
FROM KetQua
WHERE LanThi = 1
GROUP BY MaSV
HAVING COUNT(*) = 2 AND SUM(CASE WHEN Diem < 5 THEN 1 ELSE 0 END) = 2
);


SELECT * FROM DSSinhVien

SELECT * FROM DMKhoa

SELECT * FROM DMMonHoc

SELECT * FROM KetQua