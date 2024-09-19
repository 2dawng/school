using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace TUAN2
{
    internal class bai6
    {

        struct Point
        {
            public double x;
            public double y;
        }

        public static void run()
        {
            Console.Write("Nhap so diem: ");
            int n = int.Parse(Console.ReadLine());

            // Nhập tọa độ các điểm
            Point[] points = new Point[n];
            for (int i = 0; i < n; i++)
            {
                Console.Write($"Nhap toa do diem {i + 1}: ");

                Console.WriteLine("x = ");
                points[i].x = double.Parse(Console.ReadLine());
                Console.WriteLine("y = ");
                points[i].y = double.Parse(Console.ReadLine());

            }



            // Tính độ dài đường gấp khúc
            double totalLength = 0;
            for (int i = 1; i < n; i++)
            {
                double x1 = points[i - 1].x;
                double y1 = points[i - 1].y;
                double x2 = points[i].x;
                double y2 = points[i].y;

                totalLength += Math.Sqrt(Math.Pow(x2 - x1, 2) + Math.Pow(y2 - y1, 2));
            }

            Console.WriteLine($"Do dai duong gap khuc: {totalLength}");
        }
    }
}
