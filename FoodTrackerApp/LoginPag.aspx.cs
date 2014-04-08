using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodTrackerApp
{
    public partial class LoginPag : System.Web.UI.Page
    {
        FoodTrackerDataTableAdapters.AccountsTableAdapter taAccounts;

        protected void Page_Load(object sender, EventArgs e)
        {
            taAccounts = new FoodTrackerDataTableAdapters.AccountsTableAdapter();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String strUserName = TextBox1.Text;
            String strPW = TextBox2.Text;

            FoodTrackerData.AccountsDataTable dtAccounts = new FoodTrackerData.AccountsDataTable();

            dtAccounts = taAccounts.getAccountByUserName(strUserName);

            

            if (dtAccounts.Count == 0)
            {
                Label3.Text = "No such account.";
            }
            else
            {
                FoodTrackerData.AccountsRow rowAccounts = dtAccounts[0];

                if (strPW.Equals(rowAccounts["password"]))
                {
                    Label3.Text = "Login Successful.";
                }
                else
                {
                    Label3.Text = "Password mismatch.";
                }
            }
        }
    }
}