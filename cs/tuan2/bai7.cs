using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TUAN2
{
    internal class bai7
    {
        public static void run()
        {
            Console.Write("Nhap so phan tu cua day: ");
            int n = int.Parse(Console.ReadLine());

            double[] arr = new double[n];

            Console.WriteLine("Nhap cac phan tu cua day:");
            for (int i = 0; i < n; i++)
            {
                Console.Write($"Phan tu {i + 1}: ");
                arr[i] = double.Parse(Console.ReadLine());
            }

            // Tính tổng dãy
            double sum = 0;
            for (int i = 0; i < n; i++)
            {
                sum += arr[i];
            }
            Console.WriteLine($"Tong cac phan tu cua day la: {sum}");

            // Tính tổng các phần tử nằm trong đoạn [0,100]
            double sumInRange = 0;
            for (int i = 0; i < n; i++)
            {
                if (arr[i] >= 0 && arr[i] <= 100)
                {
                    sumInRange += arr[i];
                }
            }
            Console.WriteLine($"Tong cac phan tu trong doan [0,100] la: {sumInRange}");

            // Tìm giá trị lớn nhất (nhỏ nhất) của dãy
            double max = arr[0];
            double min = arr[0];
            for (int i = 1; i < n; i++)
            {
                if (arr[i] > max)
                {
                    max = arr[i];
                }
                if (arr[i] < min)
                {
                    min = arr[i];
                }
            }
            Console.WriteLine($"Gia tri lon nhat cua day la: {max}");
            Console.WriteLine($"Gia tri nho nhat cua day la: {min}");

            // Đếm số phần tử nhỏ hơn không hoặc lớn hơn 100
            int count = 0;
            for (int i = 0; i < n; i++)
            {
                if (arr[i] < 0 || arr[i] > 100)
                {
                    count++;
                }
            }
            Console.WriteLine($"So phan tu nho hon 0 hoac lon hon 100 la: {count}");
        }
    }
}
