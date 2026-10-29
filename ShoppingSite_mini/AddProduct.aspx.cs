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
    public partial class AddProduct : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sel = "select cat_id, cat_name from Category_table";
                DataSet ds = obj.Fn_AdapterDS(sel);
                cat_list.DataSource = ds;
                cat_list.DataTextField = "cat_name";
                cat_list.DataValueField = "cat_id";
                cat_list.DataBind();
                cat_list.Items.Insert(0, new ListItem("- Select -", "0"));
            }
            
        }

        protected void add_pro_Click(object sender, EventArgs e)
        {
            string dbImagePath = "";
            if (pro_img.HasFile)
            {
                dbImagePath = "~/Pro_Images/" + pro_img.FileName;
                pro_img.SaveAs(MapPath(dbImagePath));
            }
            string ins= "insert into Product_table values(" + cat_list.SelectedValue + ", '" + pro_name.Text + "', " + pro_price.Text + ", '" + dbImagePath + "', '" + pro_desc.Text + "', " + pro_stock.Text + ", 'active')";
            int i = obj.Fn_Nonquery(ins);
            pro_status.Visible = true;
            if (i == 1)
            {
                pro_status.Text = "Succesfully Added";
            }
            else
            {
                pro_status.Text = "Failed to Add";
            }


        }
    }
}