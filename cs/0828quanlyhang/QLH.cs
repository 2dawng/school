class QuanLyHang
{
    private string maHang;
    private string tenHang;
    private string xuatXu;
    private int loaiHang;
    private int soLuong;

    public QuanLyHang()
    {
        maHang = "";
        tenHang = "";
        xuatXu = "";
        loaiHang = 0;
        soLuong = 0;
    }
    public QuanLyHang(string maHang, string tenHang, string xuatXu, int loaiHang)
    {
        this.maHang = maHang;
        this.tenHang = tenHang;
        this.xuatXu = xuatXu;
        this.loaiHang = loaiHang;
        this.soLuong = 0;

    }

    public void nhap()
    {
        Console.Write("Nhap ma hang: ");
        maHang = Console.ReadLine();
        Console.Write("Nhap ten hang: ");
        tenHang = Console.ReadLine();
        Console.Write("Nhap xuat xu: ");
        xuatXu = Console.ReadLine();
        do
        {
            Console.Write("Nhap loai hang: ");
            loaiHang = int.Parse(Console.ReadLine());
        }
        while (loaiHang < 1 || loaiHang > 3);
        do
        {
            Console.Write("Nhap so luong: ");
            soLuong = int.Parse(Console.ReadLine());
        }
        while (soLuong <= 0);
    }
    public void xuat()
    {
        Console.WriteLine("Ma hang: " + maHang);
        Console.WriteLine("Ten hang: " + tenHang);
        Console.WriteLine("Xuat xu: " + xuatXu);
        Console.WriteLine("Loai hang: " + loaiHang);
        Console.WriteLine("So luong: " + soLuong);


    }
    public int getLoaiHang()
    {
        return loaiHang;
    }
    public int getSoLuong()
    {
        return soLuong;
    }
}