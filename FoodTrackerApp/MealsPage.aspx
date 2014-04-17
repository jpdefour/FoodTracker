<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealsPage.aspx.cs" Inherits="FoodTrackerApp.MealsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="MealForm" runat="server" style="align-content:center;">
    <div>
    
        <img src="images/recipes.png" />

    </div>
        <br /><br />
        <asp:TextBox ID="boxRecipe" runat="server" Height="106px" Width="830px" placeholder="Type in your recipe"></asp:TextBox>
        <asp:Button ID="btnRecipe" runat="server" Text="Recipe" OnClick="btnRecipe_Click" />
        <p>
            <asp:HyperLink ID="hpFoodList" NavigateUrl="FoodForm.aspx" runat="server" CssClass="hpFoodList">Go back to your foods</asp:HyperLink>
        </p>
        <p>
            <asp:TextBox ID="boxEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnEmail" runat="server" Text="Email" OnClick="btnEmail_Click" />
        </p>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </form>
</body>
</html>
