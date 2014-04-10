<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="FoodTrackerApp.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="RegisterForm" runat="server">
    <div>
    
        Create a new account.<br />
    
    </div>
        Username
        <asp:TextBox ID="NewUser" runat="server"></asp:TextBox>
        <br />
        Password
        <asp:TextBox ID="NewPass" textmode="Password" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnRegister" runat="server" OnClick="Button1_Click" Text="Register" />
    </form>
</body>
</html>
