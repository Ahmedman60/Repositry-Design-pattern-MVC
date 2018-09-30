using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.BLL;
namespace WebApplication3
{
    public partial class FetoTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EmployeeManger em = new EmployeeManger();
                GridView1.DataSource = em.GetAll().ToList();
                GridView1.DataBind();

                EmployeeManger em1 = new EmployeeManger();
                GridView2.DataSource = em1.GetByName("Mohamed").ToList();
                GridView2.DataBind();
            }

        }
    }
}