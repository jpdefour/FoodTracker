using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodTrackerApp
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        FoodTrackerDataTableAdapters.AccountsTableAdapter taAccounts;

        protected void Page_Load(object sender, EventArgs e)
        {
            taAccounts = new FoodTrackerDataTableAdapters.AccountsTableAdapter();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String newUser = NewUser.Text;
            String newPass = NewPass.Text;

            taAccounts.registerAccount(newUser, newPass);
            Response.Redirect("HomePage.aspx");
        }
    }
}