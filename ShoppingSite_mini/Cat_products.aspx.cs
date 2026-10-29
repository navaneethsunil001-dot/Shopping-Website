using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ShoppingSite_mini
{
    public partial class Cat_products : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                int prid = Convert.ToInt32(Session["catid"]);
                string sel = "select * from Product_table where pro_status='active' and cat_id=" + prid + "";
                DataSet ds = obj.Fn_AdapterDS(sel);
                prolist.DataSource = ds;
                prolist.DataBind();
                Label1.Text = "Products";
            }
        }

        protected void proimgbtn_Command(object sender, CommandEventArgs e)
        {
            int pid = Convert.ToInt32(e.CommandArgument);
            Session["proid"] = pid;
            Response.Redirect("Product_page.aspx");
        }
    }
}