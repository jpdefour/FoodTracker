<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngredientsPage.aspx.cs" Inherits="FoodTrackerApp.IngredientsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Ingredients</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="IngredientsDataSource" Height="258px" Width="520px">
            <Columns>
                <asp:BoundField DataField="ingredientName" HeaderText="ingredientName" SortExpression="ingredientName" />
                <asp:BoundField DataField="ingredientQuantity" HeaderText="ingredientQuantity" SortExpression="ingredientQuantity" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="IngredientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" SelectCommand="SELECT [ingredientName], [ingredientQuantity] FROM [Ingredients]"></asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Add Ingredient" />
    </form>
</body>
</html>
