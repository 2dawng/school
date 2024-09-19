using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TUAN2
{
    internal class bai1
    {
        public static void run()
        {
            Console.WriteLine("Nhap a: ");
            double a = double.Parse(Console.ReadLine());
            Console.WriteLine("Nhap b:");
            double b = double.Parse(Console.ReadLine());
            Console.WriteLine("a + b = {0}", a + b);
            Console.WriteLine("a - b = {0}", a - b);
            Console.WriteLine("a * b = {0}", a * b);
            Console.WriteLine("a / b = {0}", a / b);

            Console.ReadLine();
        }
    }
}
