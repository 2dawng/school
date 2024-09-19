using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TUAN2
{
    internal class bai3
    {
        public static void run()
        {
            Console.WriteLine("Nhap so nguyen duong N: ");
            int N = int.Parse(Console.ReadLine());

            // Kiểm tra N có phải số nguyên tố hay không
            bool isPrime = true;
            if (N <= 1)
            {
                isPrime = false;
            }
            else
            {
                for (int i = 2; i <= Math.Sqrt(N); i++)
                {
                    if (N % i == 0)
                    {
                        isPrime = false;
                        break;
                    }
                }
            }

            // In kết quả ra màn hình
            if (isPrime)
            {
                Console.WriteLine("{0} la so nguyen to", N);
            }
            else
            {
                Console.WriteLine("{0} khong phai la so nguyen to", N);
            }

            Console.ReadLine();
        }
    }
}
