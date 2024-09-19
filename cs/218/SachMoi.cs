class SachMoi : Sach
{
    private string qrCode;

    public new void nhap()
    {
        base.nhap();
        Console.Write("Nhap ma QR code: ");
        qrCode = Console.ReadLine();
    }
    public string getQrCode()
    {
        return qrCode;
    }

}