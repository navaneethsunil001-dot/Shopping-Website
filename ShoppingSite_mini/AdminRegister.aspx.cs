using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingSite_mini
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(reg_id) from Login_table";
            string maxregid = obj.Fn_Scalar(sel);
            int reg_id = 0;
            if(maxregid=="")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }
            string ins = "insert into Admin_table values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "')";
            int i = obj.Fn_Nonquery(ins);
            if(i==1)
            {
                string inslog= "insert into Login_table values(" + reg_id + ",'" + TextBox3.Text + "','" + TextBox4.Text + "','admin')";
                int j = obj.Fn_Nonquery(inslog);
                Label1.Visible = true;
                if (i == 1 && j == 1)
                {
                    Label1.Text = "Succesfully Registered";
                    LinkButton1.Visible = true;
                }
                
            }
            else
            {
                Label1.Text = "Invalid Entry";
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            string check= "select count(log_id) from Login_table where username='" + TextBox3.Text + "'";
            string count = obj.Fn_Scalar(check);
            int i = Convert.ToInt32(count);
            Label3.Visible = true;
            if(i>0)
            {
                Label3.Text = "Username Taken. Please choose Another one.";
            }
            else if(i==0)
            {
                Label3.Text = "Username Available";
            }
        }
    }
}