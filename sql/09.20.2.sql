SELECT PHIEUDAT.MaBooking, NgayDenDukien, NgayDiDuKien, Kieuphong, SLPhong,MaPT
FROM PHIEUDAT
    JOIN PHIEUTHUE ON PHIEUDAT.MaBooking=PHIEUTHUE.MaBooking
    JOIN PHONG ON PHIEUTHUE.Maphong=PHONG.Maphong
    JOIN LOAIPHONG ON PHONG.MaLP=LOAIPHONG.MaLP
    JOIN CHITIETPHONGDAT ON PHIEUDAT.MaBooking=CHITIETPHONGDAT.MaBooking
        AND LOAIPHONG.MaLP=CHITIETPHONGDAT.MaLP
        ORDER BY MaBooking