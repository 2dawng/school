class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Chon bai 1-7: ");
        int player = Convert.ToInt32(Console.ReadLine());
        switch (player)
        {
            case 1:
                bai1 bai1 = new bai1();
                bai1.run();
                break;

            default:
                Console.WriteLine("Khong co bai nay");
                break;
        }
        Console.ReadLine();
    }
}