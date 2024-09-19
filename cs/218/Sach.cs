class Sach
{
    //  Sách(mã sách, tên sách, tên tg, số lượng)
    private string maSach;
    private string tenSach;
    private string tenTG;
    private int soLuong;

    public void nhap()
    {
        Console.Write("Nhap ma sach: ");
        maSach = Console.ReadLine();
        Console.Write("Nhap ten sach: ");
        tenSach = Console.ReadLine();
        Console.Write("Nhap ten tac gia: ");
        tenTG = Console.ReadLine();
        Console.Write("Nhap so luong: ");
        soLuong = int.Parse(Console.ReadLine());
    }

    public int getSoLuong()
    {
        return soLuong;
    }


}