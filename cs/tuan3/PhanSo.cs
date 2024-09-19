using System;

class PhanSo
{
    // Thuộc tính
    private int TuSo;  // Tử số
    private int MauSo; // Mẫu số

    // Hàm khởi tạo không tham số (tử số = 0, mẫu số = 1)
    public PhanSo()
    {
        TuSo = 0;
        MauSo = 1;
    }

    // Hàm khởi tạo có tham số
    public PhanSo(int tuSo, int mauSo)
    {
        TuSo = tuSo;
        MauSo = mauSo != 0 ? mauSo : 1; // Tránh chia cho 0
    }

    // Phương thức nhập phân số
    public void NhapPhanSo()
    {
        Console.Write("Nhập tử số: ");
        TuSo = int.Parse(Console.ReadLine());

        do
        {
            Console.Write("Nhập mẫu số (khác 0): ");
            MauSo = int.Parse(Console.ReadLine());
        } while (MauSo == 0); // Kiểm tra để đảm bảo mẫu số khác 0
    }

    // Phương thức in phân số
    public void InPhanSo()
    {
        if (MauSo == 1)
        {
            Console.WriteLine($"{TuSo}");
        }
        else
        {
            Console.WriteLine($"{TuSo}/{MauSo}");
        }
    }

    // Phương thức rút gọn phân số
    public void RutGon()
    {
        int ucln = UCLN(TuSo, MauSo);
        TuSo /= ucln;
        MauSo /= ucln;
    }

    // Phương thức tính tổng hai phân số
    public PhanSo Cong(PhanSo ps)
    {
        int tuSoMoi = TuSo * ps.MauSo + MauSo * ps.TuSo;
        int mauSoMoi = MauSo * ps.MauSo;
        PhanSo ketQua = new PhanSo(tuSoMoi, mauSoMoi);
        ketQua.RutGon();
        return ketQua;
    }

    // Phương thức tính hiệu hai phân số
    public PhanSo Tru(PhanSo ps)
    {
        int tuSoMoi = TuSo * ps.MauSo - MauSo * ps.TuSo;
        int mauSoMoi = MauSo * ps.MauSo;
        PhanSo ketQua = new PhanSo(tuSoMoi, mauSoMoi);
        ketQua.RutGon();
        return ketQua;
    }

    // Phương thức tính tích hai phân số
    public PhanSo Nhan(PhanSo ps)
    {
        int tuSoMoi = TuSo * ps.TuSo;
        int mauSoMoi = MauSo * ps.MauSo;
        PhanSo ketQua = new PhanSo(tuSoMoi, mauSoMoi);
        ketQua.RutGon();
        return ketQua;
    }

    // Phương thức tính thương hai phân số
    public PhanSo Chia(PhanSo ps)
    {
        int tuSoMoi = TuSo * ps.MauSo;
        int mauSoMoi = MauSo * ps.TuSo;
        PhanSo ketQua = new PhanSo(tuSoMoi, mauSoMoi);
        ketQua.RutGon();
        return ketQua;
    }

    // Hàm tìm ước chung lớn nhất (UCLN)
    private int UCLN(int a, int b)
    {
        while (b != 0)
        {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return Math.Abs(a);
    }
}