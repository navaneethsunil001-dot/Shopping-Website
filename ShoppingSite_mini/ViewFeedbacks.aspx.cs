using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingSite_mini
{
    public partial class ViewFeedbacks : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select user_id, fdbk_msg, product_id from Feedback_table where fdbk_status=1";
            DataSet ds = obj.Fn_AdapterDS(query);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            Session["reply_uid"] = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Reply.aspx");
        }
    }
}