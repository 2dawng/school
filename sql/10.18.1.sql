CREATE PROCEDURE GetSoBanThang
    @CLBID NVARCHAR(10),
    @GoalCount INT OUTPUT
AS
BEGIN
    SELECT @GoalCount = count(TRANDAU_GHIBAN.GhiBanID) - count(case when TRANDAU_GHIBAN.VaoLuoiNha = 1 then 1 end)
    FROM TRANDAU_GHIBAN
        JOIN TRANDAU ON TRANDAU.TranDauID = TRANDAU_GHIBAN.TranDauID
    WHERE @CLBID = CLBNha OR @CLBID = CLBKhach
END
GO

DECLARE @GoalCount INT
EXEC GetSoBanThang '111', @GoalCount OUTPUT
SELECT @GoalCount


CREATE PROCEDURE GetCauThuList
    @CLBID CHAR(20)
AS
BEGIN
    SELECT
        CauThuID,
        HoVaTen,
        ViTri,
        QuocTich,
        SoAo
    FROM CAUTHU
    WHERE CauLacBoID = @CLBID
END
GO

EXEC GetCauThuList '104'


ALTER TABLE CAULACBO
ADD SoTranDau INT DEFAULT 0;
GO

CREATE TRIGGER trg_UpdateSoTranDau
ON TRANDAU
AFTER INSERT, DELETE
AS
BEGIN
    UPDATE CAULACBO
    SET SoTranDau = (
        SELECT COUNT(*)
    FROM TRANDAU
    WHERE TRANDAU.CLBNha = CAULACBO.CauLacBoID
        OR TRANDAU.CLBKhach = CAULACBO.CauLacBoID
    )
    WHERE CAULACBO.CauLacBoID IN (SELECT CLBNha
        FROM INSERTED)
        OR CAULACBO.CauLacBoID IN (SELECT CLBNha
        FROM DELETED)
        OR CAULACBO.CauLacBoID IN (SELECT CLBKhach
        FROM INSERTED)
        OR CAULACBO.CauLacBoID IN (SELECT CLBKhach
        FROM DELETED);
END
GO



CREATE VIEW MU_View
AS
    SELECT
        clb.CauLacBoID,
        clb.TenCLB,
        ct.HoVaTen,
        svd.TenSan,
        td.NgayThiDau,
        tgb.ThoiDiemGhiBan
    FROM
        CAULACBO clb
        JOIN CAUTHU ct ON clb.CauLacBoID = ct.CauLacBoID
        JOIN TRANDAU td ON clb.CauLacBoID = td.CLBNha OR clb.CauLacBoID = td.CLBKhach
        JOIN SANVANDONG svd ON td.SanVanDongID = svd.SanVanDongID
        JOIN TRANDAU_GHIBAN tgb ON td.TranDauID = tgb.TranDauID
    WHERE 
    clb.TenCLB = 'Manchester United';
GO



exec sp_addlogin NguyenTranHaiDang, 1234
exec sp_adduser NguyenTranHaiDang, NguyenTranHaiDang

grant select on CAUTHU to NguyenTranHaiDang


CREATE PROCEDURE DeleteUnusedCLB
AS
BEGIN
    DECLARE @UnusedCauLacBoID CHAR(20);

    SELECT @UnusedCauLacBoID = clb.CauLacBoID
    FROM CAULACBO clb
        LEFT JOIN CAUTHU ct ON clb.CauLacBoID = ct.CauLacBoID
        LEFT JOIN TRANDAU td1 ON clb.CauLacBoID = td1.CLBNha
        LEFT JOIN TRANDAU td2 ON clb.CauLacBoID = td2.CLBKhach
        LEFT JOIN TRANDAU_GHIBAN tgb ON clb.CauLacBoID = tgb.CauLacBoID
    WHERE ct.CauLacBoID IS NULL
        AND td1.CLBNha IS NULL
        AND td2.CLBKhach IS NULL
        AND tgb.CauLacBoID IS NULL;

    IF @UnusedCauLacBoID IS NOT NULL
    BEGIN
        DELETE FROM CAULACBO
        WHERE CauLacBoID = @UnusedCauLacBoID;
        AND TenCLB = "Manchester United";
END
END
GO

EXEC DeleteUnusedCLB;









-- /*

drop PROCEDURE

SELECT *
from caulacbo

select *
from trandau

select *
from

select *
from CAUTHU