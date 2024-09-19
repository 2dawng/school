Console.Write("Nhap so mat hang dien tu: ");
int n = int.Parse(Console.ReadLine());
DienTu[] dienTu = new DienTu[n];

Dictionary<int, int> soLuong = new Dictionary<int, int>();

Console.WriteLine("\nNhap thong tin mat hang dien tu: ");

for (int i = 0; i < n; i++)
{
    Console.WriteLine("\nNhap mat hang thu " + (i + 1) + ": ");
    dienTu[i] = new DienTu();
    dienTu[i].nhap();

    int loai = dienTu[i].getLoaiHang();
    if (!soLuong.ContainsKey(loai))
    {
        soLuong.Add(loai, 0);
    }

    soLuong[loai] += dienTu[i].getSoLuong();
}

var sortedSoLuong = soLuong.OrderBy(x => x.Key);

int maxLoai = 0;
int maxCount = 0;

Console.WriteLine("\n");
foreach (var item in sortedSoLuong)
{
    if (item.Value > maxCount)
    {
        maxLoai = item.Key;
        maxCount = item.Value;
    }

    Console.WriteLine("So mat hang loai {0}: {1}", item.Key, item.Value);
}
Console.WriteLine("Loai ton kho nhieu nhat la {0} voi {1} mat hang", maxLoai, maxCount);

