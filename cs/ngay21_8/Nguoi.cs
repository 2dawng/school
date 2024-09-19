class Nguoi
{
    private string hoTen;
    private string maSo;
    private int namSinh;
    private bool gioiTinh;// 0 = nu, 1 = nam

    public Nguoi()
    {
        this.hoTen = "";
        this.maSo = "";
        this.namSinh = 0;
        this.gioiTinh = false;
    }
    public Nguoi(string hoTen, string maSo, int namSinh, bool gioiTinh)
    {
        this.hoTen = hoTen;
        this.maSo = maSo;
        this.namSinh = namSinh;
        this.gioiTinh = gioiTinh;
    }

    public void nhap()
    {
        Console.Write("Nhap ho ten: ");
        this.hoTen = Console.ReadLine();
        Console.Write("Nhap ma so: ");
        this.maSo = Console.ReadLine();
        Console.Write("Nhap nam sinh: ");
        this.namSinh = int.Parse(Console.ReadLine());
        string temp;
        do
        {
            Console.Write("Nhap gioi tinh: ");
            temp = Console.ReadLine();
        }
        while (temp != "nam" && temp != "nu");
        this.gioiTinh = temp == "nam" ? true : false;
    }

    public void xuat()
    {
        Console.WriteLine("Ho ten: " + this.hoTen);
        Console.WriteLine("Ma so: " + this.maSo);
        Console.WriteLine("Nam sinh: " + this.namSinh);
        Console.WriteLine("Gioi tinh: " + (this.gioiTinh ? "Nam" : "Nu"));
    }

}
public int getNamSinh()
{
    return this.namSinh;
}

}