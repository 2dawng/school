-- create table proc_logs(
-- log_id INT Identity primary key,
-- event_data XML NOT null,
-- changed_by sysname not null);
-- go
-- create trigger trg_proc_changes
-- on database 
-- for 
-- 	CREATE_PROCEDURE,
--     ALTER_PROCEDURE,
--     DROP_PROCEDURE
-- AS
-- BEGIN
--     SET NOCOUNT ON;
--     INSERT INTO proc_logs(
--         event_data,
--         changed_by
--     )
--     VALUES(
--         EVENTDATA(),
--         USER
--     );
--     END;
--     GO

-- GRANT Create PROCEDURE TO user_name

create proc Bai1 @shdb nvarchar(10), @trigia int output as
begin 
	select @trigia = sum(SLBan*DonGiaBan) 
	from tChiTietHDB as ct join tSach as s on s.MaSach = ct.MaSach
	where @shdb = SoHDB
end

declare @giatri int
exec Bai1 'HDB01', @giatri output
print @giatri

select * from proc_logs


exec sp_addlogin dawngg, 1
exec sp_adduser dawngg, dawngg

grant select, insert on proc_logs to dawngg
grant select, insert on tchitiethdb to dawngg
grant select, insert on tsach to dawngg

grant create procedure to dawngg

select * from proc_logs