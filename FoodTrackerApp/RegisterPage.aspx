<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="FoodTrackerApp.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="RegisterForm" runat="server">
    <div>
    
        <h2>Create a new account!</h2><br />
    
    </div>
        Username
        <asp:TextBox ID="NewUser" runat="server" placeholder="Username"></asp:TextBox>
        <br />
        Password
        <asp:TextBox ID="NewPass" runat="server" placeholder="Password" textmode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnRegister" runat="server" OnClick="Button1_Click" Text="Register" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </form>
</body>
</html>
