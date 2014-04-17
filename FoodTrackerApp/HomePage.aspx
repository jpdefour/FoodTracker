<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="FoodTrackerApp.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="LoginForm" runat="server">
    <div>
    
        <img src="images/foodtracker.png" /><br /><br />
        Welcome to FoodTracker! Login to view your food list.
        <br />
        <br />
    
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox ID="boxUsername" runat="server" placeholder="Username"></asp:TextBox>
        <br />
    
    </div>
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>&nbsp;
         <asp:TextBox ID="boxPassword" runat="server" placeholder="Password" textmode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnRegister" runat="server" OnClick="Register_Click1" Text="Register" />
        <br />
        <br />
        <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
