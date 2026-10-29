using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
	connectionclass obj = new connectionclass();
	public int CheckAccountExists(int userid)
    {
		string check = "select count(*) from Account_table where user_id=" + userid + "";
		int count = Convert.ToInt32(obj.Fn_Scalar(check));
		return (count);
    }
	public int InsertAccount(string accname,int userid, int balance, string accno)
    {
		string insert = "insert into Account_table values('" + accname + "'," + userid + "," + balance + ",'" + accno + "')";
		int i = obj.Fn_Nonquery(insert);
		return (i);
    }
	public string Makepayment(int userid,int amount)
    {
		string balance = "select balance from Account_table where user_id=" + userid + "";
		int currentbal = Convert.ToInt32(obj.Fn_Scalar(balance));

		if(currentbal<amount)
        {
			return ("Insufficient Balance");
        }
        
        
			int newbal = currentbal - amount;
			string update = "update Account_table set balance=" + newbal + " where user_id=" + userid + "";
		obj.Fn_Nonquery(update);
		return ("Success");
			
        
    }
	public string GetData(int value)
	{
		return string.Format("You entered: {0}", value);
	}

	public CompositeType GetDataUsingDataContract(CompositeType composite)
	{
		if (composite == null)
		{
			throw new ArgumentNullException("composite");
		}
		if (composite.BoolValue)
		{
			composite.StringValue += "Suffix";
		}
		return composite;
	}
}
