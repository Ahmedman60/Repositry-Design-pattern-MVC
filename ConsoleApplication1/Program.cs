using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class em
    {
       public string name;
       public bool d;
    }
    class Program
    {
        
        static void Main(string[] args)
        {
            List<em> emp = new List<em>()
            {
                new em {name="ahmed",d=false },
                new em {name="ed",d=true }
            };
            List<bool> a = new List<bool>()
            {
                true,
                false,
                false,
                true,
            };
         var z=   emp.Where(e => e.d==true);
            foreach (var item in z)
            {
                Console.WriteLine(item.name);
            }
            Console.ReadKey();
        }
    }
}
