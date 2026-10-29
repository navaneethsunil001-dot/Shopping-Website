using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ShoppingSite_mini
{
    public partial class UserHome : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sel = "select * from Category_table where cat_status='active'";
                DataSet ds = obj.Fn_AdapterDS(sel);
                Cat_list.DataSource = ds;
                Cat_list.DataBind();
                
            }
        }

        protected void catimagebtn_Command(object sender, CommandEventArgs e)
        {
            int cid = Convert.ToInt32(e.CommandArgument);
            Session["catid"] = cid;
            Response.Redirect("Cat_products.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Cart.aspx");
        }
    }
}