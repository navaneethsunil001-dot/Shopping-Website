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
    public partial class View_bill : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int userid = Convert.ToInt32(Session["userid"]);
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                string mainquery = "SELECT dbo.User_table.name, dbo.User_table.phone, dbo.User_table.email, dbo.User_table.address, " +
                           "dbo.Payment_table.payment_id, dbo.Payment_table.grandtotal, dbo.Payment_table.date, dbo.Order_table.pro_id, " +
                           "dbo.User_table.user_id, dbo.Product_table.pro_name, dbo.Product_table.pro_img, dbo.Product_table.pro_price, " +
                           "dbo.Order_table.quantity, dbo.Order_table.subtotal " +
                           "FROM dbo.User_table " +
                           "INNER JOIN dbo.Payment_table ON dbo.User_table.user_id = dbo.Payment_table.user_id " +
                           "INNER JOIN dbo.Order_table ON dbo.User_table.user_id = dbo.Order_table.user_id AND dbo.Payment_table.date = dbo.Order_table.date " +
                           "INNER JOIN dbo.Product_table ON dbo.Order_table.pro_id = dbo.Product_table.pro_id " +
                           "WHERE dbo.User_table.user_id = " + userid + " " +
                           "AND dbo.Order_table.order_status = 'order' " +
                           "AND dbo.Payment_table.payment_id = (SELECT MAX(payment_id) FROM dbo.Payment_table WHERE user_id = " + userid + " AND date = '" + date + "')";
                DataSet ds = obj.Fn_AdapterDS(mainquery);

                lblCustomerName.Text = ds.Tables[0].Rows[0]["name"].ToString();
                lblPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                lblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                lblAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                lblPaymentId.Text = ds.Tables[0].Rows[0]["payment_id"].ToString();
                lblOrderDate.Text = ds.Tables[0].Rows[0]["date"].ToString();
                lblGrandTotal.Text = ds.Tables[0].Rows[0]["grandtotal"].ToString();

                gridBill.DataSource = ds;
                gridBill.DataBind();
            }
        }

        protected void paymentredirect_Click(object sender, EventArgs e)
        {
            Session["grandtotal"] = lblGrandTotal.Text;
            Response.Redirect("PaymentPage.aspx");
        }
    }
}