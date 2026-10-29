using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingSite_mini
{
    public partial class UserManagement : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();

        public void gridbind()
        {
            string q = "SELECT user_id, name, email, phone, status FROM User_table";
            DataSet ds = obj.Fn_AdapterDS(q);
            gridUsers.DataSource = ds;
            gridUsers.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridbind();
            }
        }

        protected void gridUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int uid = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ban_user")
            {
                string banQuery = "UPDATE User_table SET status = 'inactive' WHERE user_id = " + uid;
                obj.Fn_Nonquery(banQuery);
                lblMsg.Text = "User Banned!";
                gridbind();
            }
            else if (e.CommandName == "unban_user")
            {
                string unbanQuery = "UPDATE User_table SET status = 'active' WHERE user_id = " + uid;
                obj.Fn_Nonquery(unbanQuery);
                lblMsg.Text = "User Unbanned!";
                gridbind();
            }
        }
    }
}