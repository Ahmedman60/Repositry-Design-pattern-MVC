using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication3.BLL
{
    
    /// <summary>
    ///  This will Talk to Database by specific things only ad in RealWorld Projects TeamLeader let's u work whit specific part of code
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
   public interface IRepository<TEntity>
    {
       List<TEntity> GetAllBinding();
       IQueryable<TEntity> GetAll();
        /// <summary>
        /// This Function Accept Params As if u have Composite id it will allow u to enter more than one param
        /// </summary>
        /// <param name="Id"></param>
        /// <returns>The Class of u select</returns>
        TEntity GetById(params object[] Id);
        TEntity Add(TEntity Entity);

        bool Update(TEntity Entity);
        TEntity Delete(TEntity Entity);


    }
}
