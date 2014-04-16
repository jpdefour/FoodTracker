using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace FoodTrackerApp
{
    public partial class MealsPage : System.Web.UI.Page
    {
        String username;
        FoodTrackerDataTableAdapters.MealsTableAdapter taMeals;
        FoodTrackerData.MealsDataTable dtMeals;

        FoodTrackerDataTableAdapters.FoodsTableAdapter taFood;
        FoodTrackerData.FoodsDataTable dtFood;

        int foodID;

        protected void Page_Load(object sender, EventArgs e)
        {
            usernameCheck();

            String strFoodID = Request.QueryString["foodID"].ToString();
            foodID = Convert.ToInt32(strFoodID);

            taMeals = new FoodTrackerDataTableAdapters.MealsTableAdapter();
            dtMeals = new FoodTrackerData.MealsDataTable();

            taFood = new FoodTrackerDataTableAdapters.FoodsTableAdapter();
            dtFood = new FoodTrackerData.FoodsDataTable();

            if (!IsPostBack)
            {
                dtMeals = taMeals.getMealsbyFoodID(foodID);

                if (dtMeals.Count > 0)
                {
                    FoodTrackerData.MealsRow rowMeals = dtMeals[0];

                    boxRecipe.Text = rowMeals["recipe"].ToString();
                }
            }
        }

        protected void btnRecipe_Click(object sender, EventArgs e)
        {
            String recipe = boxRecipe.Text;

            dtMeals = taMeals.getMealsbyFoodID(foodID);

            if (dtMeals.Count > 0)
                taMeals.updateMealsByFoodID(recipe, foodID);
            else
                taMeals.addMeals(foodID, recipe);

        }

        public void usernameCheck()
        {
            username = (string)(Session["username"]);
            if (username == null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            dtMeals = taMeals.getMealsbyFoodID(foodID);


            if (dtMeals.Count > 0)
            {

                dtFood = taFood.getFoodByFoodID(foodID);
                FoodTrackerData.FoodsRow rowFood = dtFood[0];
                FoodTrackerData.MealsRow rowMeals;

                String strRecipe = "You need a recipe first";




                rowMeals = dtMeals[0];

                strRecipe = rowMeals["recipe"].ToString();



                SmtpClient m_clientSmtp;

                //setup smtp client
                m_clientSmtp = new SmtpClient("smtp.gmail.com");

                m_clientSmtp.Port = 587;
                m_clientSmtp.UseDefaultCredentials = false;
                m_clientSmtp.Credentials = new NetworkCredential("foodtracker123", "foodtracker1234");
                m_clientSmtp.EnableSsl = true;

                //setup mail
                MailMessage msgMail = new MailMessage();

                msgMail.From = new MailAddress("foodtracker123@gmail.com");

                msgMail.Subject = "Your Recipe is here! The recipe for " + rowFood["foodName"].ToString() + " from " + username + " at FoodTracker";

                msgMail.Body = strRecipe;

                //send test ads
                msgMail.To.Add(boxEmail.Text);

                m_clientSmtp.Send(msgMail);

                msgMail.To.Clear();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("HomePage.aspx");
        }


    }
}