using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TUAN2
{
    internal class bai4
    {
        public static void run()
        {
            Console.WriteLine("Nhap so nguyen duong N: ");
            int N = int.Parse(Console.ReadLine());

            // Tính tổng các ước của N
            int sum = 0;
            for (int i = 1; i < N; i++)
            {
                if (N % i == 0)
                {
                    sum += i;
                }
            }

            // Kiểm tra N có phải số hoàn hảo hay không
            if (sum == N)
            {
                Console.WriteLine("{0} la so hoan hao", N);
            }
            else
            {
                Console.WriteLine("{0} khong phai la so hoan hao", N);
            }

            Console.ReadLine();
        }
    }
}
