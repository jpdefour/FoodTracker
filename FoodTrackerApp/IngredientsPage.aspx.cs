using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodTrackerApp
{
    public partial class IngredientsPage : System.Web.UI.Page
    {


        FoodTrackerDataTableAdapters.IngredientsTableAdapter taIngredients;

        protected void Page_Load(object sender, EventArgs e)
        {
            taIngredients = new FoodTrackerDataTableAdapters.IngredientsTableAdapter();

            FoodTrackerData.IngredientsDataTable dtIngredients = new FoodTrackerData.IngredientsDataTable();

            dtIngredients = taIngredients.getDataByFoodIngredientID();
        }

        

    }
}