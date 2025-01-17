-- 1.	Theo dõi việc tạo bảng mới: Ghi lại thông tin khi một bảng mới được tạo trong cơ sở dữ liệu.
create TABLE proc_logs
(
    log_id INT Identity primary key,
    event_data XML NOT null,
    changed_by sysname not null,
    event_type nvarchar(50)
);
go
create trigger trg_proc_create
on database 
for 
    CREATE_TABLE
    -- ALTER_TABLE,
    -- DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO proc_logs
        (
        event_data,
        changed_by,
        event_type
        )
    VALUES(
            EVENTDATA(),
            USER,
            eventdata().value('(/EVENT_INSTANCE/EventType)[1]','varchar(100)')
    );
END;
GO



-- 2.	Theo dõi việc xóa bảng: Ghi log khi một bảng bị xóa khỏi cơ sở dữ liệu.

create trigger trg_proc_delete
on database 
for 
    -- CREATE_TABLE
    -- ALTER_TABLE,
    DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO proc_logs
        (
        event_data,
        changed_by,
        event_type
        )
    VALUES(
            EVENTDATA(),
            USER,
            eventdata().value('(/EVENT_INSTANCE/EventType)[1]','varchar(100)')
    );
END;
GO




-- 3.	Theo dõi việc sửa đổi bảng (CREATE, ALTER, DROP TABLE): Ghi lại các thay đổi cấu trúc của bảng như thêm, sửa, hoặc xóa cột.

create trigger trg_proc_alter
on database 
for 
    -- CREATE_TABLE
    ALTER_TABLE
    -- DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO proc_logs
        (
        event_data,
        changed_by,
        event_type
        )
    VALUES(
            EVENTDATA(),
            USER,
            eventdata().value('(/EVENT_INSTANCE/EventType)[1]','varchar(100)')
    );
END;
GO




-- 4.	Theo dõi việc tạo view (CREATE, ALTER, DROP VIEW): Ghi lại khi một view mới được tạo, được sửa, xóa trong cơ sở dữ liệu.

create trigger trg_proc_view
on database 
for 
    CREATE_VIEW,
    ALTER_VIEW,
    DROP_VIEW
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO proc_logs
        (
        event_data,
        changed_by,
        event_type
        )
    VALUES(
            EVENTDATA(),
            USER,
            eventdata().value('(/EVENT_INSTANCE/EventType)[1]','varchar(100)')
    );
END;
GO



-- 5.	Theo dõi việc tạo trigger mới (CREATE, ALTER, DROP TRIGGER): Ghi lại khi một trigger mới được tạo, được sửa, xóa trong hệ thống.

create trigger trg_proc_trigger
on database 
for 
    CREATE_TRIGGER,
    ALTER_TRIGGER,
    DROP_TRIGGER
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO proc_logs
        (
        event_data,
        changed_by,
        event_type
        )
    VALUES(
            EVENTDATA(),
            USER,
            eventdata().value('(/EVENT_INSTANCE/EventType)[1]','varchar(100)')
    );
END;
GO



-- 6.	Theo dõi việc cấp quyền (GRANT): Ghi lại khi quyền được cấp cho người dùng hoặc vai trò.




-- 7.	Theo dõi việc thu hồi quyền (REVOKE): Ghi lại khi quyền bị thu hồi từ người dùng hoặc vai trò.




-- 8.	Không cho phép xóa bảng SinhVien

create trigger trg_PreventDeleteSinhVien
on SinhVien
instead of delete
AS
BEGIN
    SET NOCOUNT ON;
    RAISERROR('Không thể xóa bảng SinhVien',16,1)
END;
GO




/*


create table a(
id int)

alter table a
    add num int


drop table a

use QuanLyDiemTruongDaiHocV3

SELECT * from sys.tables

SELECT * FROM proc_logs