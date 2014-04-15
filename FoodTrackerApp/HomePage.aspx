<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="FoodTrackerApp.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body align="center">
    <form id="LoginForm" runat="server">
    <div>
    
        <h1>Welcome To FoodTracker</h1><br />
        Log in to see your foods!

        <br />
    
        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
        &nbsp;<asp:TextBox ID="boxUsername" runat="server" placeholder="Username"></asp:TextBox>
        <br />
    
    </div>
        <asp:Label ID="lblPassword" runat="server" Text="Password" placeholder="Password"></asp:Label>
        &nbsp;<asp:TextBox ID="boxPassword" textmode="Password" runat="server"></asp:TextBox>
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
