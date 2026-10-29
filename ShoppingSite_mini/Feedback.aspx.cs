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
    public partial class Feedback : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                databinding();
            }
        }
        public void databinding()
        {
            int userid = Convert.ToInt32(Session["userid"]);

            string query = "SELECT DISTINCT dbo.Product_table.pro_id, dbo.Product_table.pro_name, dbo.Product_table.pro_desc, dbo.Product_table.pro_img " +
                "FROM dbo.Product_table INNER JOIN " +
                "dbo.Order_table ON dbo.Product_table.pro_id = dbo.Order_table.pro_id " +
                "WHERE(dbo.Order_table.order_status = 'paid') AND(dbo.Order_table.user_id = " + userid + ")";

            DataSet ds = obj.Fn_AdapterDS(query);
            gridFeedback.DataSource = ds;
            gridFeedback.DataBind();
        }

        protected void gridFeedback_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string proid = e.CommandArgument.ToString();
            lblselproid.Text = proid;
            Panel1.Visible = true;
            
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userid"]);
            int proid = Convert.ToInt32(lblselproid.Text);
            string fdbkmsg = txtfdbk.Text;

            string insquery = "insert into Feedback_table values(" + userid + ", " + proid + ", '" + fdbkmsg + "', 'null', 1)";
            int i = obj.Fn_Nonquery(insquery);
            if(i==1)
            {
                lblstatus.Text = "Feedback Submitted Succesfully!";

            }
            else
            {
                lblstatus.Text = "Failed to submit Feedback";
            }
        }
    }
}