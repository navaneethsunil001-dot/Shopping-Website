using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingSite_mini
{
    public partial class AddCategory : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(cat_id) from Category_table";
            string maxcatid = obj.Fn_Scalar(sel);
            int catid = 0;
            if (maxcatid == "")
            {
                catid = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxcatid);
                catid = newregid + 1;
            }

            string dbImagePath = "";
            if (cat_img.HasFile)
            {
                dbImagePath = "~/Cat_Images/" + cat_img.FileName;
                cat_img.SaveAs(MapPath(dbImagePath));
            }
            string catin = "insert into Category_table values("+catid+",'" + cat_name.Text + "','" + dbImagePath + "','active','" + cat_desc.Text + "')";
            int i = obj.Fn_Nonquery(catin);
            if(i==1)
            {
                cat_status.Text = "Succesfully Added";
            }
            else
            {
                cat_status.Text = "Failed to Add";
            }
        }
    }
}