using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodTrackerApp
{
    public partial class MealsPage : System.Web.UI.Page
    {
        FoodTrackerDataTableAdapters.MealsTableAdapter taMeals;
        FoodTrackerDataTableAdapters.MadeIntoTableAdapter taMadeInto;
        FoodTrackerData.MealsDataTable dtMeals;

        protected void Page_Load(object sender, EventArgs e)
        {
            taMeals = new FoodTrackerDataTableAdapters.MealsTableAdapter();
            taMadeInto = new FoodTrackerDataTableAdapters.MadeIntoTableAdapter();
            dtMeals = new FoodTrackerData.MealsDataTable();
        }

        protected void btnRecipe_Click(object sender, EventArgs e)
        {
            String strFoodID = Request.QueryString["foodID"].ToString();
            int foodID = Convert.ToInt32(strFoodID);

            String recipe = boxRecipe.Text;
            taMeals.addMeals(foodID,recipe);

            dtMeals = taMeals.getAllMeals();

            FoodTrackerData.MealsRow rowMeal = dtMeals[dtMeals.Count - 1];
            /*
            String strFoodID = rowFood["foodID"].ToString();
            int FoodID = Convert.ToInt32(strFoodID);
             */
            

            taMadeInto.insertIntoMadeInto(foodID);

            Response.Redirect("MealsPage.aspx?foodID=" + Request.QueryString["foodID"]);
        }
    }
}