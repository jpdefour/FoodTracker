using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodTrackerApp
{
    public partial class HomePage : System.Web.UI.Page
    {
        FoodTrackerDataTableAdapters.AccountsTableAdapter taAccounts;

        protected void Page_Load(object sender, EventArgs e)
        {
            taAccounts = new FoodTrackerDataTableAdapters.AccountsTableAdapter();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String strUserName = boxUsername.Text;
            String strPassword = boxPassword.Text;
            

            FoodTrackerData.AccountsDataTable dtAccounts = new FoodTrackerData.AccountsDataTable();

            dtAccounts = taAccounts.getAccountByUserName(strUserName);

            

            if (dtAccounts.Count == 0)
            {
                lblErrorMsg.Text = "No such account.";
            }
            else
            {
                FoodTrackerData.AccountsRow rowAccounts = dtAccounts[0];

                if (strPassword.Equals(rowAccounts["password"]))
                {
                    Session["username"] = strUserName;
                    Response.Redirect("FoodForm.aspx");

                }
                else
                {
                    lblErrorMsg.Text = "Password mismatch.";
                }
            }
        }
    }
}