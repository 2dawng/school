-- 1. Cho biết những sinh viên thi lại trên 2 lần.

SELECT *
FROM DSSinhVien
WHERE MaSV=ANY(
SELECT MaSV
FROM KetQua
WHERE LanThi > 2)

-- 2. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0

SELECT *
FROM DSSinhVien
WHERE MaSV=ANY(
    SELECT MaSV
    FROM KetQua
    WHERE LanThi=1
    GROUP BY MaSV
    HAVING AVG(Diem)>7
)
    AND Phai='Nam'

-- 3. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.

SELECT *
FROM DSSinhVien
WHERE MaSV=ANY(
SELECT MaSV
FROM KetQua
WHERE LanThi = 1 AND Diem < 4
GROUP BY MaSV
HAVING COUNT(*) > 2
)

-- 4. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam

SELECT *
FROM DMKhoa
WHERE MaKhoa=ANY(
SELECT MaKhoa
FROM DSSinhVien
WHERE Phai='Nam'
GROUP BY MaKhoa
HAVING COUNT(*) > 2
)

-- 5. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.

SELECT *
FROM DMKhoa
WHERE MaKhoa=ANY(
SELECT MaKhoa
FROM DSSinhVien
WHERE HocBong BETWEEN 200000 AND 300000
GROUP BY MaKhoa
HAVING COUNT(*) > 2
)

-- 6. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1.

SELECT TenMH,
    SUM(CASE WHEN Diem >= 4 THEN 1 ELSE 0 END) AS SoSVDau,
    SUM(CASE WHEN Diem < 4 THEN 1 ELSE 0 END) AS SoSVRot
FROM KetQua
    JOIN DMMonHoc ON KetQua.MaMH=DMMonHoc.MaMH
WHERE LanThi = 1
GROUP BY TenMH

-- 7. Cho biết sinh viên nào có học bổng cao nhất.

SELECT *
FROM DSSinhVien
WHERE HocBong=ANY(
SELECT MAX(HocBong)
FROM DSSinhVien
)

-- 8. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.

SELECT *
FROM DSSinhVien
WHERE MaSV=(
SELECT MaSV
FROM KetQua
    JOIN DMMonHoc ON DMMonHoc.MaMH = KetQua.MaMH
WHERE TenMH = N'Cơ sở dữ liệu' AND LanThi = 1
    AND Diem = (SELECT MAX(Diem)
    FROM KetQua
    WHERE LanThi = 1 AND MaMH = DMMonHoc.MaMH))


-- 9. Cho biết sinh viên khoa anh văn có tuổi lớn nhất.

SELECT TOP 1
    DSSinhVien.*
FROM DSSinhVien
    JOIN DMKhoa ON DSSinhVien.MaKhoa=DMKhoa.MaKhoa
WHERE TenKhoa = N'Anh văn'
ORDER BY ngaySinh ASC

-- 10. Cho biết khoa nào có đông sinh viên nhất.

SELECT *
FROM DMKhoa
WHERE MaKhoa=ANY(
SELECT TOP 1 WITH TIES
    MaKhoa
FROM DSSinhVien
GROUP BY MaKhoa
ORDER BY COUNT(*) DESC)

-- 11. Cho biết khoa nào có đông nữ nhất.

SELECT *
FROM DMKhoa
WHERE MaKhoa=ANY(
SELECT TOP 1 WITH TIES
    MaKhoa
FROM DSSinhVien
WHERE Phai = N'Nữ'
GROUP BY MaKhoa
ORDER BY COUNT(*) DESC)

-- 12. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.

SELECT *
FROM DMMonHoc
WHERE MaMH=ANY(
SELECT TOP 1 WITH TIES
    MaMH
FROM KetQua
WHERE LanThi = 1 AND Diem < 4
GROUP BY MaMH
ORDER BY COUNT(*) DESC)

-- 13. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn điểm thi văn phạm của sinh viên học khoa anh văn.

SELECT KetQua.*, DMKhoa.TenKhoa, DMMonHoc.TenMH
FROM KetQua
    JOIN DMMonHoc ON KetQua.MaMH=DMMonHoc.MaMH
    JOIN DSSinhVien ON DSSinhVien.MaSV=KetQua.MaSV
    JOIN DMKhoa ON DMKhoa.MaKhoa=DSSinhVien.MaKhoa
WHERE TenMH=N'Văn phạm' AND TenKhoa!=N'Anh Văn' AND Diem>(
SELECT KetQua.Diem
    FROM KetQua
        JOIN DMMonHoc ON KetQua.MaMH=DMMonHoc.MaMH
        JOIN DSSinhVien ON DSSinhVien.MaSV=KetQua.MaSV
        JOIN DMKhoa ON DMKhoa.MaKhoa=DSSinhVien.MaKhoa
    WHERE TenMH=N'Văn phạm' AND TenKhoa=N'Anh Văn'
)

-- 14. Cho biết sinh viên có nơi sinh cùng với Hải.

SELECT *
FROM DSSinhVien
WHERE NoiSinh=ANY(
SELECT NoiSinh
FROM DSSinhVien
WHERE TenSV=N'Hải'
)

-- 15. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn

SELECT *
FROM DSSinhVien
WHERE HocBong > ALL (
    SELECT max(HocBong)
FROM DSSinhVien
    JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
WHERE DMKhoa.TenKhoa = N'Anh văn'
)


-- 16. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn

SELECT *
FROM DSSinhVien
WHERE HocBong > ANY (
    SELECT HocBong
FROM DSSinhVien
WHERE MaKhoa = (
        SELECT MaKhoa
FROM DMKhoa
WHERE TenKhoa = N'Anh văn'
    )
)


-- 17. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.

SELECT DSSinhVien.*
FROM KetQua
    JOIN DSSinhVien ON KetQua.MaSV=DSSinhVien.MaSV
WHERE LanThi = 2
    AND Diem > ALL (
    SELECT Diem
    FROM KetQua
        JOIN DMMonHoc ON DMMonHoc.MaMH=KetQua.MaMH
    WHERE LanThi = 1 AND TenMH=N'Cơ sở dữ liệu'
)


-- 18. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.

SELECT DSSinhVien.MaSV, HoSV, TenSV, KetQua.MaMH, KetQua.Diem
FROM KetQua
    JOIN(
    SELECT MaMH, MAX(Diem) AS maxd
    FROM KetQua
    GROUP BY MaMH) as a
    ON KetQua.MaMH=a.MaMH AND KetQua.Diem=a.maxd
    JOIN DSSinhVien ON DSSinhVien.MaSV=KetQua.MaSV

-- 19. Cho biết những khoa không có sinh viên học.

SELECT *
FROM DMKhoa
WHERE MaKhoa NOT IN (
    SELECT DISTINCT MaKhoa
FROM DSSinhVien
)

-- 20. Cho biết sinh viên chưa thi môn cơ sở dữ liệu.

SELECT *
FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT MaSV
FROM KetQua
WHERE MaMH = (SELECT MaMH
FROM DMMonHoc
WHERE TenMH = N'Cơ sở dữ liệu')
)


-- 21. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.

SELECT *
FROM DSSinhVien
WHERE MaSV=(
SELECT DISTINCT MaSV
FROM KetQua
WHERE LanThi = 2 AND MaSV NOT IN (
    SELECT MaSV
    FROM KetQua
    WHERE LanThi = 1
))


-- 22. Cho biết môn nào không có sinh viên khoa anh văn học.

SELECT *
FROM DMMonHoc
WHERE MaMH NOT IN (
    SELECT DISTINCT MaMH
FROM KetQua
WHERE MaSV IN (
        SELECT MaSV
FROM DSSinhVien
WHERE MaKhoa = (SELECT MaKhoa
FROM DMKhoa
WHERE TenKhoa = N'Anh văn')
    )
)


-- 23. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.

SELECT *
FROM DSSinhVien
WHERE MaKhoa = (SELECT MaKhoa
    FROM DMKhoa
    WHERE TenKhoa = N'Anh văn')
    AND MaSV NOT IN (
    SELECT MaSV
    FROM KetQua
    WHERE MaMH = (SELECT MaMH
    FROM DMMonHoc
    WHERE TenMH = N'Văn phạm')
)

-- 24. Cho biết những sinh viên không rớt môn nào.

SELECT *
FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT MaSV
FROM KetQua
WHERE Diem < 4
)


-- 25. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao giờ rớt.

SELECT *
FROM DSSinhVien
WHERE MaKhoa = (SELECT MaKhoa
    FROM DMKhoa
    WHERE TenKhoa = N'Anh văn')
    AND HocBong > 0
    OR MaSV NOT IN (
    SELECT MaSV
    FROM KetQua
    WHERE Diem < 4
)

-- 26. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít sinh viên nhận học bổng nhất.

-- Khoa có đông sinh viên nhận học bổng nhất
SELECT *
FROM DMKhoa
WHERE MaKhoa=ANY(
SELECT TOP 1 WITH TIES
    MaKhoa
FROM DSSinhVien
WHERE HocBong>0
GROUP BY MaKhoa
ORDER BY COUNT(*) DESC)

-- Khoa có ít sinh viên nhận học bổng nhất
SELECT *
FROM DMKhoa
WHERE MaKhoa=ANY(
SELECT MaKhoa
FROM DSSinhVien
WHERE HocBong=0 OR HocBong=NULL
)


-- 27. Cho biết 3 sinh viên có học nhiều môn nhất.

SELECT *
FROM DSSinhVien
WHERE MaSV=ANY(
SELECT TOP 3 WITH TIES
    MaSV
FROM KetQua
GROUP BY MaSV
ORDER BY COUNT(*) DESC)


-- 28. Cho biết những môn được tất cả các sinh viên theo học.

SELECT *
FROM DMMonHoc
WHERE NOT EXISTS (
    SELECT DISTINCT MaSV
FROM DSSinhVien
WHERE NOT EXISTS (
        SELECT 1
FROM KetQua
WHERE KetQua.MaMH = DMMonHoc.MaMH AND KetQua.MaSV = DSSinhVien.MaSV
    )
)


-- 29. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.

SELECT DISTINCT DSSinhVien.*
FROM DSSinhVien
    JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
WHERE KetQua.MaMH =ANY (
    SELECT MaMH
FROM KetQua
WHERE MaSV = 'A02'
)

-- 30. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học.

SELECT DISTINCT DSSinhVien.*
FROM DSSinhVien
    JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
WHERE KetQua.MaMH IN (
    SELECT MaMH
    FROM KetQua
    WHERE MaSV = 'A02'
)
    AND DSSinhVien.MaSV != 'A02'
    AND NOT EXISTS (
    SELECT 1
    FROM KetQua
    WHERE KetQua.MaSV = 'A02'
        AND NOT EXISTS (
        SELECT 1
        FROM KetQua
        WHERE KetQua.MaMH = KetQua.MaMH
            AND KetQua.MaSV = DSSinhVien.MaSV
    )
)

-- 31. Tạo một bảng mới tên sinhvien-ketqua: gồm: MASV, HoSV, TenSV, SoMonHoc. Sau đó Thêm dữ liệu vào bảng này dựa vào dữ liệu đã có.

CREATE TABLE sinhvien_ketqua
(
    MASV VARCHAR(50),
    HoSV NVARCHAR(100),
    TenSV NVARCHAR(100),
    SoMonHoc INT
)

INSERT INTO sinhvien_ketqua
    (MASV, HoSV, TenSV, SoMonHoc)
SELECT DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, COUNT(KetQua.MaMH) AS SoMonHoc
FROM DSSinhVien
    LEFT JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
GROUP BY DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV

-- 32. Thêm vào bảng khoa cột Siso, cập nhật sỉ số vào khoa từ dữ liệu sinh viên.

ALTER TABLE DMKhoa
ADD Siso INT

UPDATE DMKhoa
SET Siso = (
    SELECT COUNT(*)
FROM DSSinhVien
WHERE DSSinhVien.MaKhoa = DMKhoa.MaKhoa
)

-- 33. Tăng thêm 1 điểm cho các sinh viên vớt lần 2. Nhưng chỉ tăng tối đa là 5 điểm

UPDATE KetQua
SET Diem = 
    CASE
        WHEN LanThi = 2 THEN
            CASE
                WHEN Diem <= 4 THEN Diem + 1
                ELSE Diem
            END
        ELSE Diem
    END

-- 34. Tăng học bổng lên 100000 cho những sinh viên có điểm trung bình là 6.5 trở lên

UPDATE DSSinhVien
SET HocBong = HocBong + 100000
WHERE MaSV IN (
    SELECT MaSV
FROM KetQua
GROUP BY MaSV
HAVING AVG(Diem) >= 6.5
)

-- 35. Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rớt ở lần 1

UPDATE DSSinhVien
SET HocBong = 0
WHERE MaSV IN (
    SELECT MaSV
FROM KetQua
WHERE LanThi = 1
GROUP BY MaSV
HAVING COUNT(CASE WHEN Diem < 4 THEN 1 END) >= 2
)

-- 36. Xoá tất cả những sinh viên chưa dự thi môn nào.

DELETE FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT DISTINCT MaSV
FROM KetQua
)

-- 37. Xóa những môn mà không có sinh viên học.

DELETE FROM DMMonHoc
WHERE MaMH NOT IN (
    SELECT DISTINCT MaMH
FROM KetQua
)

-- 38. Danh sách sinh viên không bi rớt môn nào

SELECT *
FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT DISTINCT MaSV
FROM KetQua
WHERE Diem < 4
)

-- 39. Danh sách sinh viên học môn văn phạm và môn cơ sở dữ liệu

SELECT *
FROM DSSinhVien
WHERE MaSV IN (
    SELECT MaSV
    FROM KetQua
    WHERE MaMH = (SELECT MaMH
    FROM DMMonHoc
    WHERE TenMH = N'Văn phạm')
)
    AND MaSV IN (
    SELECT MaSV
    FROM KetQua
    WHERE MaMH = (SELECT MaMH
    FROM DMMonHoc
    WHERE TenMH = N'Cơ sở dữ liệu')
)

-- 40. Trong mỗi sinh viên cho biết môn có điểm thi lớn nhất. Thông tin gồm: mã sinh viên, tên sinh viên, tên môn, điểm.

SELECT DSSinhVien.MaSV, HoSV, TenSV, TenMH , MAX(Diem) AS DiemMax
FROM DSSinhVien
    JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
    JOIN DMMonHoc ON KetQua.MaMH = DMMonHoc.MaMH
GROUP BY DSSinhVien.MaSV, HoSV, TenSV, TenMH


-- 41. Danh sách sinh viên: Không rớt lần 1 hoặc ,Không học môn văn phạm

SELECT *
FROM DSSinhVien
WHERE MaSV NOT IN (
    SELECT MaSV
    FROM KetQua
    WHERE LanThi = 1 AND Diem < 4
)
    OR MaSV NOT IN (
    SELECT MaSV
    FROM KetQua
    WHERE MaMH = (SELECT MaMH
    FROM DMMonHoc
    WHERE TenMH = N'Văn phạm')
)

-- 42. Danh sách những sinh viên khoa có 2 sinh viên nữ trở lên

SELECT MaKhoa, TenKhoa
FROM DMKhoa
WHERE MaKhoa IN (
    SELECT MaKhoa
FROM DSSinhVien
WHERE Phai = N'Nữ'
GROUP BY MaKhoa
HAVING COUNT(*) >= 2
)

-- 43. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.

SELECT NoiSinh
FROM DSSinhVien
GROUP BY NoiSinh
HAVING COUNT(*) > 2;

-- 44. Cho biết những môn nào có trên 3 sinh viên dự thi.

SELECT TenMH
FROM DMMonHoc
WHERE MaMH IN (
    SELECT MaMH
FROM KetQua
GROUP BY MaMH
HAVING COUNT(DISTINCT MaSV) > 3
);
