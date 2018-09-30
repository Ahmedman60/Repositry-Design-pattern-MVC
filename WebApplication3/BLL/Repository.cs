using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using WebApplication3.DAL;
namespace WebApplication3.BLL
{
    /// <summary>
    /// It's Job to create the context
    /// </summary>
    /// <typeparam name="Tentity"></typeparam>
    public class Repository<Tentity> : IRepository<Tentity> where Tentity :class
    {
        //this the context which talk to the database
       private ADODotNetDemoEntities _db;
        private DbSet<Tentity> _set;
        public Repository()
        {
            //now if someone inherite from this class this will be the base and when the child make object it will call the ctor of this class so context(_db) will made
            _db = new ADODotNetDemoEntities();
            //انا عاوز ارجع داتا بتاعت تيبول معين امسكو يعى واجيب منو البينات طب انا معرفوش اصلن خليه ده يهبقا ايه ميمر فريبل عشان تعرفه 
          _set = _db.Set<Tentity>();
            //ده بيرجه سيت زى الانتيتى بيعمهالك ويحطها فى المتغير بتاعك عشان تتعامل معها
            // public virtual DbSet<Department> Departments { get; set; }
        }



        public Tentity Add(Tentity Entity)
        {
            _set.Add(Entity);
            return _db.SaveChanges() > 0 ? Entity : null;
           

            
        }
        
       
        public Tentity Delete(Tentity Entity)
        {
            _set.Remove(Entity);
            return _db.SaveChanges() > 0 ? Entity : null;
        }

        public virtual IQueryable<Tentity> GetAll()
        {
            return _set;
        }

        public List<Tentity> GetAllBinding()
        {
            return _set.ToList();
        }

        public Tentity GetById(params object[] Id)
        {
            return _set.Find(Id);
        }

        public bool Update(Tentity Entity)
        {
            //you use Attach method cuz every entity have it's own prop u don't know
            //you have to tell that this object change  by db.entry check if same object in database like the accpeted object or not and make update
            //then save change
            _set.Attach(Entity); //عشان تجبلى الاوبجيت التبعت من عندى عن طريق الى دى  محتجها بس لمه اعمل الكلام ده فى العادى بكتب التحت بس
            // if u didn't make Generic repositry u don't need Attach but u need it to  warn your set to get this specific object u send
            _db.Entry(Entity).State = EntityState.Modified;
            return _db.SaveChanges() > 0;
        }

       
    }
}