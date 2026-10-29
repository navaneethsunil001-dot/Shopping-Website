using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingSite_mini
{
    public partial class UserRegister : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(reg_id) from Login_table";
            string maxregid = obj.Fn_Scalar(sel);
            int regid = 0;
            if (maxregid == "")
            {
                regid = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                regid = newregid + 1;
            }
            string ins = "insert into User_table values(" + regid + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','active')";
            int i = obj.Fn_Nonquery(ins);
            Label1.Visible = true;
            if(i==1)
            {
                string inslog = "insert into Login_table values(" + regid + ",'" + TextBox8.Text + "','" + TextBox9.Text + "','user')";
                int j = obj.Fn_Nonquery(inslog);
                if(i==1&&j==1)
                {
                    Label1.Text = "Account created succesfully";
                    LinkButton1.Visible = true;
                }
            }
            else
            {
                Label1.Text = "invalid Entry";
            }
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            string check = "select count(log_id) from Login_table where username='" + TextBox8.Text + "'";
            string count = obj.Fn_Scalar(check);
            int i = Convert.ToInt32(count);
            Label2.Visible = true;
            if (i > 0)
            {
                Label2.Text = "Username Taken. Please choose Another one.";
            }
            else if (i == 0)
            {
                Label2.Text = "Username Available";
            }
        }
    }
}