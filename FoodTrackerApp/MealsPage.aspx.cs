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
        FoodTrackerDataTableAdapters.MadeIntoTableAdapter taMadeInto;
        FoodTrackerData.MealsDataTable dtMeals;

        protected void Page_Load(object sender, EventArgs e)
        {
            usernameCheck();

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
            SmtpClient m_clientSmtp;

            //setup smtp client
            m_clientSmtp = new SmtpClient("smtp.gmail.com");

            m_clientSmtp.Port = 587;
            m_clientSmtp.UseDefaultCredentials = false;
            m_clientSmtp.Credentials = new NetworkCredential("EMAILNAME", "PASSWORD");
            m_clientSmtp.EnableSsl = true;

            //setup mail
            MailMessage msgMail = new MailMessage();

            msgMail.From = new MailAddress("foodtracker@gmail.com");

            msgMail.Subject = "Your Recipe is here!";

            msgMail.Body = "The recipe for";

            //send test ads
            msgMail.To.Add(boxEmail.Text);

            m_clientSmtp.Send(msgMail);

            msgMail.To.Clear();
        }


    }
}