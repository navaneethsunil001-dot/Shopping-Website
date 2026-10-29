using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingSite_mini
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Connectionclass ob = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "select count(reg_id) from Login_table where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            string cid = ob.Fn_Scalar(str);
            int cid1 = Convert.ToInt32(cid);
            if (cid1 == 1)
            {
                string str1 = "select reg_id from Login_table where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
                string regid = ob.Fn_Scalar(str1);
                Session["userid"] = regid;

                string str2 = "select log_type from Login_table where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
                string logtype = ob.Fn_Scalar(str2);
                if (logtype == "admin")
                {
                    Response.Redirect("AdminHome.aspx");
                }
                else if (logtype == "user")
                {
                    string checkStatus = "select status from User_table where user_id=" + regid;
                    string status = ob.Fn_Scalar(checkStatus);

                    if (status.ToLower() == "inactive")
                    {
                        Response.Write("<script>alert('Your account has been blocked by the admin.');</script>");
                    }
                    else
                    {
                        Response.Redirect("UserHome.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Incorrect username or password');</script>");
            }
        }
    }
}
