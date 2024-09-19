Console.Write("Nhap so luong sach: ");
int n = int.Parse(Console.ReadLine());
SachMoi[] arr = new SachMoi[n];
for (int i = 0; i < n; i++)
{
    Console.WriteLine("\nNhap thong tin sach thu {0}:", i + 1);
    arr[i] = new SachMoi();
    arr[i].nhap();
}
Console.Write("\nNhap QRcode can tim kiem: ");
string qrcode = Console.ReadLine();
bool flag = false;
for (int i = 0; i < n; i++)
{
    if (arr[i].getQrCode() == qrcode)
    {
        Console.WriteLine("\nSach co ma QRcode {0} con {1} quyen", qrcode, arr[i].getSoLuong());
        flag = true;
        break;
    }
}
if (!flag)
{
    Console.WriteLine("\nKhong co sach co ma QRcode {0}", qrcode);

}