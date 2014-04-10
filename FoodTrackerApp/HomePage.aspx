<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="FoodTrackerApp.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="LoginForm" runat="server">
    <div>
    
        Welcome. Please log in.<br />
        <br />
    
        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
        &nbsp;<asp:TextBox ID="boxUsername" runat="server"></asp:TextBox>
        <br />
    
    </div>
        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
        &nbsp;<asp:TextBox ID="boxPassword" textmode="Password" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
