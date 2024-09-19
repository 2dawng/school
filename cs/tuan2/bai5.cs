using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TUAN2
{
    internal class bai5
    {
        public static void run()
        {
            Console.Write("Nhap n: ");
            int N = int.Parse(Console.ReadLine());

            int[] arr = new int[N];

            Console.WriteLine("Nhap cac phan tu cua day:");
            for (int i = 0; i < N; i++)
            {
                Console.Write($"Phan tu {i + 1}: ");
                arr[i] = int.Parse(Console.ReadLine());
            }


            Array.Sort(arr);

            Console.WriteLine("Day sap xep theo thu tu tang dan la:");
            foreach (int num in arr)
            {
                Console.Write(num + " ");
            }
        }
    }
}
