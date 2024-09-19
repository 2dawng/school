class DienTu : QuanLyHang
{
    private int tgbh;
    public new void nhap()
    {
        base.nhap();
        do
        {
            Console.Write("Nhap thoi gian bao hanh: ");
            tgbh = int.Parse(Console.ReadLine());
        } while (tgbh < 0);
    }
    public new void xuat()
    {
        base.xuat();
        Console.WriteLine("Thoi gian bao hanh: " + tgbh + " thang");
    }
}