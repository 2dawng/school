using System;

namespace TUAN2
{
    internal class bai2
    {
        public static void run()
        {
            Console.WriteLine("Nhap he so a: ");
            double a = double.Parse(Console.ReadLine());

            Console.WriteLine("Nhap he so b: ");
            double b = double.Parse(Console.ReadLine());

            Console.WriteLine("Nhap he so c: ");
            double c = double.Parse(Console.ReadLine());

            if (a == 0)
            {
                Console.WriteLine("He so a phai khac 0");
                return;
            }


            // Tinh delta
            double delta = b * b - 4 * a * c;

            Console.WriteLine("Delta = {0}", delta);

            // Bien luan va giai phuong trinh
            if (delta > 0)
            {
                // Phuong trinh co 2 nghiem phan biet
                double x1 = (-b + Math.Sqrt(delta)) / (2 * a);
                double x2 = (-b - Math.Sqrt(delta)) / (2 * a);
                Console.WriteLine("Phuong trinh co 2 nghiem phan biet:");
                Console.WriteLine("x1 = {0}", x1);
                Console.WriteLine("x2 = {0}", x2);
            }
            else if (delta == 0)
            {
                // Phuong trinh co nghiem kep
                double x = -b / (2 * a);
                Console.WriteLine("Phuong trinh co nghiem kep:");
                Console.WriteLine("x = {0}", x);
            }
            else
            {
                // Phuong trinh vo nghiem
                Console.WriteLine("Phuong trinh vo nghiem");
            }

            Console.ReadLine();
        }
    }
}
