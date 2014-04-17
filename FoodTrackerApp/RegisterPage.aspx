<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="FoodTrackerApp.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="RegisterForm" runat="server">
    <div>
        <!--<asp:Image id="foodTrackerLogo" ImageUrl="images/foodtracker_small.png" runat="server"/>-->
    </div>
    <div>
    
        <img src="images/foodtracker.png" /><br /><br />
        Hello new user!
        <br />
        Get started by registering for a new account.
        <br />
        <br />
    
    </div>
        Username
        <asp:TextBox ID="NewUser" runat="server" placeholder="New Username"></asp:TextBox>
        <br />
        Password
        <asp:TextBox ID="NewPass" runat="server" placeholder="New Password" textmode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnRegister" runat="server" OnClick="Button1_Click" Text="Register" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </form>
</body>
</html>
