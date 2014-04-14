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
        FoodTrackerDataTableAdapters.FoodsTableAdapter taFoods;
        FoodTrackerDataTableAdapters.ContainsTableAdapter taContains;
        FoodTrackerData.FoodsDataTable dtFoods;

        string username;

        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)(Session["username"]);

            taFoods = new FoodTrackerDataTableAdapters.FoodsTableAdapter();
            dtFoods = new FoodTrackerData.FoodsDataTable();

            taContains = new FoodTrackerDataTableAdapters.ContainsTableAdapter();
        }

        protected void btnAddFood_Click(object sender, EventArgs e)
        {
            String food = FoodName.Text;
            String quantity = Quantity.Text;
            String storageEnvironment = StorageEnvironment.Text;

            taFoods.AddFood(food, quantity, storageEnvironment);

            dtFoods = taFoods.getAllFoods();

            FoodTrackerData.FoodsRow rowFood = dtFoods[dtFoods.Count - 1];

            String strFoodID = rowFood["foodID"].ToString();
            int FoodID = Convert.ToInt32(strFoodID);

            taContains.insertIntoContains(username, FoodID);
            
            Response.Redirect("FoodForm.aspx");

        }
    }
}