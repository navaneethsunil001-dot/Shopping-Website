using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for connectionclass
/// </summary>
public class connectionclass
{
    SqlConnection con;
    SqlCommand cmd;
    public connectionclass()
    {
        con = new SqlConnection(@"server=HOMEPC\SQLEXPRESS;database=SHOPPING;Integrated security=True");

    }
    public int Fn_Nonquery(string sqlquery)
    {
        if (con.State == ConnectionState.Open)
            con.Close();
        cmd = new SqlCommand(sqlquery, con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public string Fn_Scalar(string sqlquery)
    {
        if (con.State == ConnectionState.Open)
            con.Close();
        cmd = new SqlCommand(sqlquery, con);
        con.Open();
        string i = cmd.ExecuteScalar().ToString();
        con.Close();
        return i;
    }

    public SqlDataReader Fn_DataReader(string sqlquery)
    {
        if (con.State == ConnectionState.Open)
            con.Close();
        cmd = new SqlCommand(sqlquery, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        return dr;
    }

    public DataSet Fn_AdapterDS(string sqlquery)
    {
        if (con.State == ConnectionState.Open)
            con.Close();
        SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
}