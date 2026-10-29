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
    public partial class EditProduct : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridbind();
            }
        }
        public void gridbind()
        {
            string dis = "select * from Product_table";
            DataSet ds = obj.Fn_AdapterDS(dis);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gridbind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gridbind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int id = Convert.ToInt32(GridView1.DataKeys[i].Value);
            TextBox proprice = (TextBox)GridView1.Rows[i].Cells[2].Controls[0];
            TextBox prodesc = (TextBox)GridView1.Rows[i].Cells[3].Controls[0];
            TextBox prostock = (TextBox)GridView1.Rows[i].Cells[4].Controls[0];
            TextBox prostat = (TextBox)GridView1.Rows[i].Cells[5].Controls[0];
            FileUpload fu = (FileUpload)GridView1.Rows[i].FindControl("EditFileupload");
            string path = "";
            if (fu.HasFile)
            {
                path = "~/Pro_Images/" + fu.FileName;
                fu.SaveAs(Server.MapPath(path));
            }
            string query = "update Product_table set pro_price=" + proprice.Text + ",pro_desc='" + prodesc.Text + "',pro_stock=" + prostock.Text + ",pro_status='" + prostat.Text + "',pro_img='" + path + "' where pro_id=" + id;
            obj.Fn_Nonquery(query);
            GridView1.EditIndex = -1;
            gridbind();
        }
    }
}