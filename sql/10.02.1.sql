    -- 1. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update để tự động cập nhật điểm trung bình của học sinh khi thêm mới hay cập nhật bảng điểm
    -- Điểm trung bình= ((Toán +Văn)*2+Lý+Hóa)/6

    -- CREATE TRIGGER TinhDiemTrungBinh ON DIEM
    -- FOR INSERT, UPDATE AS
    -- BEGIN
    --     UPDATE DIEM 
    --     SET DTB=((TOAN+VAN)*2+LY+HOA)/6
    --     UPDATE DIEM
    --     SET XEPLOAI=
    --     case when DTB>=5 and
    --         TOAN>=4 and VAN>=4 and
    --         LY>=4 and HOA>=4 
    --         then 'Len lop'
    --     else 'Luu ban'
    --     end
    -- END

    -- drop TRIGGER TinhDiemTrungBinh


    -- 2. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update để tự động xếp loại học sinh, cách thức xếp loại như sau
    -- - Nếu Điểm trung bình>=5 là lên lớp, ngược lại là lưu ban

    -- CREATE TRIGGER XepLoaiHocSinh ON DIEM
    -- FOR INSERT, UPDATE AS 
    -- BEGIN
    --     UPDATE DIEM
    --     SET XEPLOAI=
    --     case when DTB>=5 then 'Len lop'
    --     else 'Luu ban'
    --     end
    -- END

    -- drop trigger XepLoaiHocSinh



    -- 3. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update để tự động xếp loại học sinh, cách thức xếp loại như sau
    -- - Xét điểm thấp nhất (DTN) của các 4 môn
    -- - Nếu DTB>=5 và DTN>=4 là “Lên Lớp”, ngược lại là lưu ban

    -- CREATE TRIGGER XepLoaiHocSinh1 ON DIEM
    -- FOR INSERT, UPDATE AS 
    -- BEGIN
    --     UPDATE DIEM
    --     SET XEPLOAI=
    --     case when DTB>=5 and TOAN>=4 and VAN>=4 and LY>=4 and HOA>=4 then 'Len lop'
    --     else 'Luu ban'
    --     end
    -- END



    -- 4. Viết một trigger xóa tự động bản ghi về điểm học sinh khi xóa dữ liệu học sinh đó trong DSHS

    --     CREATE TRIGGER XoaDiem on DSHS
    --     FOR DELETE AS
    --     BEGIN
    --         DELETE FROM DIEM
    --         WHERE MAHS IN (SELECT MAHS
    --         FROM DELETED)
    --     END


