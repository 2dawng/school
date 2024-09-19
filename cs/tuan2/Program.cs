using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Intrinsics.X86;
using System.Text;
using System.Threading.Tasks;

namespace TUAN2
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Chon bai 1-7: ");
            int player = Convert.ToInt32(Console.ReadLine());
            switch (player)
            {
                case 1:
                    bai1.run();
                    break;
                case 2:
                    bai2.run();
                    break;
                case 3:
                    bai3.run();
                    break;
                case 4:
                    bai4.run();
                    break;
                case 5:
                    bai5.run();
                    break;
                case 6:
                    bai6.run();
                    break;
                case 7:
                    bai7.run();
                    break;


                default:
                    Console.WriteLine("Khong co bai nay");
                    break;
            }
            Console.ReadLine();



        }
    }
}
