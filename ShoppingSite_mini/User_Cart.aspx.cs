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
    public partial class User_Cart : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        public void gridbind()
        {
            string joiner = "SELECT dbo.Product_table.pro_name, dbo.Cart_table.quantity, dbo.Cart_table.subtotal, dbo.Product_table.pro_img, dbo.Cart_table.cart_id FROM dbo.Product_table INNER JOIN dbo.Cart_table ON dbo.Product_table.pro_id = dbo.Cart_table.pro_id where dbo.Cart_table.user_id=" + Convert.ToInt32(Session["userid"]) + " and dbo.Cart_table.cart_status=1";
            DataSet ds = obj.Fn_AdapterDS(joiner);
            cartgrid.DataSource = ds;
            cartgrid.DataBind();

            int userid = Convert.ToInt32(Session["userid"]);
            string gtotal = "select SUM(subtotal) from Cart_table where user_id=" + userid + " and cart_status=1";
            string totalgrand = obj.Fn_Scalar(gtotal);
            grandtotallabel.Text = totalgrand;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridbind();
            }
        }

        protected void cartgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getcartid = Convert.ToInt32(cartgrid.DataKeys[i].Value);
            string deletion = "delete from Cart_table where cart_id=" + getcartid + "";
            obj.Fn_Nonquery(deletion);
            cartgrid.EditIndex = -1;
            gridbind();
        }

        protected void cartgrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            cartgrid.EditIndex = e.NewEditIndex;
            gridbind();
        }

        protected void cartgrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            cartgrid.EditIndex = -1;
            gridbind();
        }

        protected void cartgrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(cartgrid.DataKeys[i].Value);
            TextBox quantity = (TextBox)cartgrid.Rows[i].Cells[4].Controls[0];
            int newquant = Convert.ToInt32(quantity.Text);
            string checking = "select pro_stock from Product_table where pro_id=(select pro_id from Cart_table where cart_id=" + getid + ")";
            int stock = Convert.ToInt32(obj.Fn_Scalar(checking));

            if(newquant>stock)
            {
                Response.Write("<script>alert('insufficient stock');</script>");
                cartgrid.EditIndex = -1;
                gridbind();
                return;
            }

            string price= "select dbo.Product_table.pro_price FROM dbo.Product_table INNER JOIN dbo.Cart_table ON dbo.Product_table.pro_id = dbo.Cart_table.pro_id where dbo.Cart_table.cart_id="+getid+"";
            string nprice = obj.Fn_Scalar(price).ToString();
            int newprice = Convert.ToInt32(nprice);
            int newsubtotal = newquant * newprice;

            string updation = "update Cart_table set quantity=" + newquant + ", subtotal=" + newsubtotal + " where cart_id=" + getid + "";
            obj.Fn_Nonquery(updation);
            cartgrid.EditIndex = -1;
            gridbind();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userid"]);
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string sel = "select pro_id from Cart_table where user_id=" + userid + " and cart_status=1";
            SqlDataReader dr1 = obj.Fn_DataReader(sel);

            List<int> pidlist = new List<int>();
            while(dr1.Read())
            {
                pidlist.Add(Convert.ToInt32(dr1["pro_id"]));
            }

            foreach(int p in pidlist)
            {
                string selitem = "select quantity, subtotal from Cart_table where user_id=" + userid + " and pro_id=" + p + " and cart_status=1";
                SqlDataReader dr2 = obj.Fn_DataReader(selitem);
                int quantity = 0;
                int subtotal = 0;

                if(dr2.Read())
                {
                    quantity = Convert.ToInt32(dr2["quantity"]);
                    subtotal = Convert.ToInt32(dr2["subtotal"]);
                }

                string insertorder = "insert into Order_table values(" + userid + "," + p + "," + quantity + "," + subtotal + ",'" + date + "','order')";
                int status = obj.Fn_Nonquery(insertorder);
                if(status==1)
                {
                    string updatecart = "update Cart_table set cart_status=0 where user_id=" + userid + " and pro_id=" + p + " and cart_status=1";
                    obj.Fn_Nonquery(updatecart);
                }
            }

            string totalquery = "select sum(subtotal) from Order_table where user_id=" + userid + " and order_status='order'";
            string total = obj.Fn_Scalar(totalquery);

            string insertopayment = "insert into Payment_table values(" + userid + "," + Convert.ToInt32(total) + ",'" + date + "')";
            obj.Fn_Nonquery(insertopayment);

            Response.Redirect("View_bill.aspx");

        }
    }
}