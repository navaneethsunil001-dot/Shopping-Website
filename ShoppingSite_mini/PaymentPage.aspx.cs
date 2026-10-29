using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ShoppingSite_mini
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        PaymentService.ServiceClient client = new PaymentService.ServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int userid = Convert.ToInt32(Session["userid"]);
                int gtotal = Convert.ToInt32(Session["grandtotal"]);
                GrandTotal.Text = gtotal.ToString();

                int accountcheck = client.CheckAccountExists(userid);
                if(accountcheck==1)
                {
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                }
                else
                {
                    Panel1.Visible = true;
                    Panel2.Visible = false;
                }
            }
        }

        protected void AddAccount_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userid"]);
            string accountname = accname.Text;
            string accnumber = accno.Text;
            int balanceamount = Convert.ToInt32(accbal.Text);

            int insert = client.InsertAccount(accountname, userid, balanceamount, accnumber);

            if(insert==1)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }

        protected void payment_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userid"]);
            int gtotal = Convert.ToInt32(Session["grandtotal"]);
            string date = DateTime.Now.ToString("yyyy-MM-dd");

            string result = client.Makepayment(userid, gtotal);

            if(result=="Insufficient Balance")
            {
                status.Text = result;
            }
            else
            {

                string selpro = "select pro_id from Order_table where order_status='order' and user_id=" + userid + "";
                SqlDataReader dr = obj.Fn_DataReader(selpro);

                List<int> proidlist = new List<int>();
                while(dr.Read())
                {
                    proidlist.Add(Convert.ToInt32(dr["pro_id"]));
                }
                foreach(int pid in proidlist)
                {
                    string updateordstat = "update Order_table set order_status='paid' where pro_id=" + pid + " and order_status='order' and user_id=" + userid;
                    obj.Fn_Nonquery(updateordstat);

                    string getquant = "select quantity from Order_table where pro_id=" + pid + " and user_id=" + userid + " and order_status='paid' and date='" + date + "'";
                    int quantity = Convert.ToInt32(obj.Fn_Scalar(getquant));

                    string getstock = "select pro_stock from Product_table where pro_id=" + pid;
                    int oldstock = Convert.ToInt32(obj.Fn_Scalar(getstock));

                    int newstock = oldstock - quantity;
                    string updatestock = "update Product_table set pro_stock=" + newstock + " where pro_id=" + pid;
                    obj.Fn_Nonquery(updatestock);
                }
                status.Text = "Payment Succesful! Order Placed";
            }
        }
    }
}