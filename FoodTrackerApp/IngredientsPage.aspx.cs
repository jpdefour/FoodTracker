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
        string username;
        FoodTrackerDataTableAdapters.IngredientsTableAdapter taIngredients;
        FoodTrackerDataTableAdapters.IncludesTableAdapter taIncludes;
        FoodTrackerData.IngredientsDataTable dtIngredients;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            usernameCheck();

            taIngredients = new FoodTrackerDataTableAdapters.IngredientsTableAdapter();
            taIncludes = new FoodTrackerDataTableAdapters.IncludesTableAdapter();
            dtIngredients = new FoodTrackerData.IngredientsDataTable();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String ingredientName = boxIngredientName.Text;
            String ingredientQuantity = boxIngredientQuantity.Text;
            taIngredients.addIngredients(ingredientName, ingredientQuantity);

            dtIngredients = taIngredients.getAllIngredients();

            FoodTrackerData.IngredientsRow rowIngredient = dtIngredients[dtIngredients.Count - 1];

            String strIngredientID = rowIngredient["ingredientID"].ToString();
            int IngredientID = Convert.ToInt32(strIngredientID);
            String strFoodID = Request.QueryString["foodID"].ToString();
            int foodID = Convert.ToInt32(strFoodID);

            taIncludes.insertIntoIncludes(foodID, IngredientID);

            Response.Redirect("IngredientsPage.aspx?foodID=" + Request.QueryString["foodID"]);
        }

        public void usernameCheck()
        {
            username = (string)(Session["username"]);
            if (username == null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }

    }
}