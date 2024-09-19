-- 1. Tạo view DSHS10A1 gồm thông tin Mã học sinh, họ tên, giới tính (là “Nữ” nếu Nu=1,
-- ngược lại là “Nam”), các điểm Toán, Lý, Hóa, Văn của các học sinh lớp 10A1
CREATE VIEW DSHS10A1
AS
    SELECT DSHS.MAHS, HO, TEN,
        CASE WHEN  NU=1 then N'Nữ' ELSE N'Nam' END AS GioiTinh,
        TOAN, LY, HOA, VAN
    FROM DSHS
        JOIN DIEM ON DSHS.MAHS=DIEM.MAHS
    WHERE MALOP='10A1'

-- 2. Tạo login TranThanhPhong, tạo user TranThanhPhong cho TranThanhPhong trên CSDL
-- QLHocSinh

exec sp_addlogin TranThanhPhong, 1234
exec sp_adduser TranThanhPhong, TranThanhPhong

-- Phân quyền Select trên view DSHS10A1 cho TranThanhPhong

grant select on DSHS10A1 to TranThanhPhong

-- Đăng nhập TranThanhPhong để kiểm tra

-- Tạo login PhamVanNam, tạo PhamVanNam cho PhamVanNam trên CSDL QLHocSinh

exec sp_addlogin PhamVanNam, 1234
exec sp_adduser PhamVanNam, PhamVanNam

-- Đăng nhập PhamVanNam để kiểm tra
-- Tạo view DSHS10A2 tương tự như câu 1

CREATE VIEW DSHS10A2
AS
    SELECT DSHS.MAHS, HO, TEN,
        CASE WHEN  NU=1 then N'Nữ' ELSE N'Nam' END AS GioiTinh,
        TOAN, LY, HOA, VAN
    FROM DSHS
        JOIN DIEM ON DSHS.MAHS=DIEM.MAHS
    WHERE MALOP='10A2'

-- Phân quyền Select trên view DSHS10A2 cho PhamVanNam

grant select on DSHS10A2 to PhamVanNam

-- Đăng nhập PhamVanNam để kiểm tra 


-- 3. Tạo view báo cáo Kết thúc năm học gồm các thông tin: Mã học sinh, Họ và tên, Ngày sinh,
-- Giới tính, Điểm Toán, Lý, Hóa, Văn, Điểm Trung bình, Xếp loại, Sắp xếp theo xếp loại (chọn
-- 1000 bản ghi đầu). Trong đó:
-- Điểm trung bình (DTB) = ((Toán + Văn)*2 + Lý + Hóa)/6)
-- Cách thức xếp loại như sau:
-- - Xét điểm thấp nhất (DTN) của các 4 môn
-- - Nếu DTB>5 và DTN>4 là “Lên Lớp”, ngược lại là lưu ban

CREATE VIEW KetThucNamHoc
AS
    SELECT TOP 1000
        DSHS.MAHS, HO, TEN, NGAYSINH,
        CASE WHEN NU = 1 THEN N'Nữ' ELSE N'Nam' END AS GioiTinh,
        TOAN, LY, HOA, VAN,
        ((TOAN + VAN) * 2 + LY + HOA) / 6.0 AS DTB,
        CASE 
        WHEN ((TOAN + VAN) * 2 + LY + HOA) / 6.0 > 5
            AND LEAST(TOAN, LY, HOA, VAN) > 4 
        THEN N'Lên Lớp'
        ELSE N'Lưu Ban'
    END AS XepLoai
    FROM
        DSHS JOIN DIEM ON DSHS.MAHS = DIEM.MAHS
    ORDER BY 
    XepLoai


-- 4. Tạo view danh sách HOC SINH XUAT SAC bao gồm các học sinh có DTB>=8.5 và
-- DTN>=8 với các trường: Lop, Mahs, Hoten, Namsinh (năm sinh), Nu, Toan, Ly, Hoa, Van,
-- DTN, DTB

CREATE VIEW HocSinhXuatSac
AS
    SELECT MALOP, DSHS.MAHS, HO, TEN, YEAR(NGAYSINH) AS NamSinh,
        NU, TOAN, LY, HOA, VAN,
        LEAST(TOAN, LY, HOA, VAN) AS DTN,
        ((TOAN + VAN) * 2 + LY + HOA) / 6.0 AS DTB
    FROM DSHS
        JOIN DIEM ON DSHS.MAHS=DIEM.MAHS
    WHERE LEAST(TOAN, LY, HOA, VAN) >= 8
        AND ((TOAN + VAN) * 2 + LY + HOA) / 6.0 >= 8.5;


-- 5. Tạo view danh sách HOC SINH DAT THU KHOA KY THI bao gồm các học sinh xuất
-- sắc có DTB lớn nhất với các trường: Lop, Mahs, Hoten, Namsinh, Nu, Toan, Ly, Hoa, Van,
-- DTB

CREATE VIEW HocSinhDatThuKhoakhiThi
AS
    SELECT TOP 1 WITH TIES
        MALOP, DSHS.MAHS, HO, TEN, YEAR(NGAYSINH) AS NamSinh,
        NU, TOAN, LY, HOA, VAN,
        ((TOAN + VAN) * 2 + LY + HOA) / 6.0 AS DTB
    FROM DSHS
        JOIN DIEM ON DSHS.MAHS=DIEM.MAHS
    ORDER BY DTB DESC