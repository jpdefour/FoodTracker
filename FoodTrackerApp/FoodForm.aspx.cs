using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodTrackerApp
{
    public partial class FoodForm : System.Web.UI.Page
    {
        FoodTrackerDataTableAdapters.FoodsTableAdapter adaptFoods;

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (string)(Session["username"]);
            adaptFoods = new FoodTrackerDataTableAdapters.FoodsTableAdapter();
            FoodTrackerData.FoodsDataTable dtFoods = new FoodTrackerData.FoodsDataTable();
            // Idea is when the username and food id are connected in the contains table, this should query the foods in an account has
            dtFoods = adaptFoods.getDataByUsernameFoodID(username); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String food = FoodName.Text;
            String quantity = Quantity.Text;
            String storageEnvironment = StorageEnvironment.Text;

            adaptFoods.AddFood(food, quantity, storageEnvironment);
            Response.Redirect(Request.RawUrl);

        }
    }
}