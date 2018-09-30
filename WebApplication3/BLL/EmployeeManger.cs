using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication3.DAL;
namespace WebApplication3.BLL
{
    public class EmployeeManger:Repository<Employee>
    {//كده خلصت المنجير
        //لو عاوز تروح فى البرزنشن وتحط لنكيو تسلكت لو عاوز حاجه معينه بظبت  بتعمل ميثود وتسلكت بيها 
        //  عاوز تزود حاجه بتيجى بشروط حط الشرط البيبعته و استقبله فى حاجه بلنكيو
        // ممكن تخلى الهناك override وتظبت هنا حاجه جديده
        public List<Employee> GetByName(string name)
        {
            return GetAll().Where(e => e.Name.StartsWith(name)).ToList();
        }
        //متعملش اوفير رايد غير لمه تتاكد انك مش هتستخدم العادى فى حتا تانيه
       
    }
}