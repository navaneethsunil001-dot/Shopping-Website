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
    public partial class Product_page : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int prid = Convert.ToInt32(Session["proid"]);
                string sel = "select * from Product_table where pro_id=" + prid + "";
                SqlDataReader dr = obj.Fn_DataReader(sel);
                while(dr.Read())
                {
                    proname.Text = dr["pro_name"].ToString();
                    proprice.Text = dr["pro_price"].ToString();
                    prodesc.Text = dr["pro_desc"].ToString();
                    propic.ImageUrl = dr["pro_img"].ToString();
                    quantity_av.Text = dr["pro_stock"].ToString();
                }
                
            }
        }

        protected void addtocart_Click(object sender, EventArgs e)
        {
            int prid = Convert.ToInt32(Session["proid"]);
            string sel = "select pro_stock from Product_table where pro_id="+prid+"";
            string check = obj.Fn_Scalar(sel);
            int uid =Convert.ToInt32(Session["userid"]);
            int price = Convert.ToInt32(proprice.Text);
            int qty = Convert.ToInt32(TextBox1.Text);
            int subtot = price * qty;
            string date = DateTime.Now.ToString("yyyy-MM-dd");

            if (Convert.ToInt32(quantity_av.Text)< qty)
            {
                status.Visible = true;
                status.Text = "Insufficient stock";
            }
            else
            {
                string ins = "insert into Cart_table values("+uid+","+prid+","+qty+","+subtot+",'"+date+"',1)";
                int i = obj.Fn_Nonquery(ins);
                status.Visible = true;
                if(i==1)
                {
                    status.Text = "Succesfully Added To cart";
                }
                else
                {
                    status.Text = "Failed to Add";
                }
            }
            
        }

        protected void continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");
        }

        protected void viewcart_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Cart.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            int price = Convert.ToInt32(proprice.Text);
            int qty = Convert.ToInt32(TextBox1.Text);
            int subtot = price * qty;
            subtotal.Visible = true;
            subtotal.Text = subtot.ToString();
        }
    }
}