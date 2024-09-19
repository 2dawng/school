internal class bai1
{
    public static void run()
    {
        PhanSo ps1 = new PhanSo();
        PhanSo ps2 = new PhanSo();

        // Nhập hai phân số
        Console.WriteLine("Nhập phân số thứ nhất:");
        ps1.NhapPhanSo();

        Console.WriteLine("Nhập phân số thứ hai:");
        ps2.NhapPhanSo();

        // In hai phân số trước khi rút gọn
        Console.WriteLine("\nPhân số thứ nhất trước khi rút gọn:");
        ps1.InPhanSo();

        Console.WriteLine("Phân số thứ hai trước khi rút gọn:");
        ps2.InPhanSo();

        // Rút gọn và in phân số
        ps1.RutGon();
        ps2.RutGon();

        Console.WriteLine("\nPhân số thứ nhất sau khi rút gọn:");
        ps1.InPhanSo();

        Console.WriteLine("Phân số thứ hai sau khi rút gọn:");
        ps2.InPhanSo();

        // Tính tổng, hiệu, tích, thương
        PhanSo tong = ps1.Cong(ps2);
        PhanSo hieu = ps1.Tru(ps2);
        PhanSo tich = ps1.Nhan(ps2);
        PhanSo thuong = ps1.Chia(ps2);

        // In kết quả
        Console.WriteLine("\nTổng hai phân số:");
        tong.InPhanSo();

        Console.WriteLine("Hiệu hai phân số:");
        hieu.InPhanSo();

        Console.WriteLine("Tích hai phân số:");
        tich.InPhanSo();

        Console.WriteLine("Thương hai phân số:");
        thuong.InPhanSo();

        // Dừng màn hình để xem kết quả
        Console.WriteLine("\nNhấn Enter để kết thúc...");
        Console.ReadLine();
    }

}
