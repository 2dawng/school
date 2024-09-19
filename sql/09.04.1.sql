-- 1. Tạo View danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên,
-- Tên sinh viên, Học bổng.

CREATE VIEW Bai1 AS
SELECT MaSV, HoSV, TenSV, HocBong
FROM DSSinhVien

-- 2. Tạo view Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.

CREATE VIEW Bai2 AS
SELECT HoSV, MaKhoa, NoiSinh, HocBong
FROM DSSinhVien
WHERE HocBong >= 150000 AND NoiSinh = N'Hà Nội'


-- 3. Tạo view liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông
-- tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.

CREATE VIEW Bai3 AS
SELECT MaSV, HoSV, TenSV, MaKhoa, Phai
FROM DSSinhVien
WHERE Phai=N'Nam' AND( MaKhoa = 'AV' OR MaKhoa = 'TH')

-- 4. Tạo view gồm những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên,
-- Tuổi, Tên khoa.

CREATE VIEW Bai4 AS
SELECT HoSV, TenSV, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, TenKhoa
FROM DSSinhVien
    JOIN DMKhoa ON DSSinhVien.MaKhoa = dmKhoa.MaKhoa
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) BETWEEN 20 AND 25


-- 5. Tạo view cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao”
-- nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”

CREATE VIEW Bai5 AS
SELECT MaSV, Phai, MaKhoa,
    CASE
        WHEN HocBong > 500000 THEN N'Học bổng cao'
        ELSE N'Mức trung bình'
    END AS HocBong
FROM DSSinhVien

-- 6. Tạo view đưa ra thông tin những sinh viên có học bổng lớn hơn bất kỳ học bổng của
-- sinh viên học khóa anh văn

CREATE VIEW Bai6 AS
SELECT *
FROM DSSinhVien
WHERE HocBong > ANY (
    SELECT HocBong
FROM DSSinhVien
WHERE MaKhoa = 'AV'
)


-- 7. Tạo view đưa ra thông tin những sinh viên đạt điểm cao nhất trong từng môn.

CREATE VIEW Bai7 AS
SELECT HoSV, TenSV, DSSinhVien.MaSV , TenMH, Diem
FROM KetQua
    JOIN DSSinhVien ON KetQua.MaSV = DSSinhVien.MaSV
    JOIN DMMonHoc ON KetQua.MaMH = DMMonHoc.MaMH
WHERE Diem >= ALL (
    SELECT Diem
FROM KetQua
WHERE MaMH = DMMonHoc.MaMH
)

-- 8. Tạo view đưa ra những sinh viên chưa thi môn cơ sở dữ liệu.

CREATE VIEW Bai8 AS
SELECT *
FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT MaSV
FROM KetQua
    JOIN DMMonHoc ON KetQua.MaMH = DMMonHoc.MaMH
WHERE TenMH = N'Cơ sở dữ liệu'
)

-- 9. Tạo view đưa ra thông tin những sinh viên không trượt môn nào.

CREATE VIEW Bai9 AS
SELECT *
FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT MaSV
FROM KetQua
WHERE Diem < 4
)