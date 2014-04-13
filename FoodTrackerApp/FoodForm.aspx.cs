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
            adaptFoods = new FoodTrackerDataTableAdapters.FoodsTableAdapter();
            FoodTrackerData.FoodsDataTable dtFoods = new FoodTrackerData.FoodsDataTable();
            dtFoods = adaptFoods.getDataByUsernameFoodID(Session[username]);

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