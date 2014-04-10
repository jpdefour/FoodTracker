<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealsPage.aspx.cs" Inherits="FoodTrackerApp.MealsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="MealsForm" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="MealsDataSource" Height="273px" Width="554px">
            <Columns>
                <asp:BoundField DataField="foodName" HeaderText="Meal" SortExpression="foodName" />
                <asp:BoundField DataField="storageEnvironment" HeaderText="storageEnvironment" SortExpression="storageEnvironment" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="recipe" HeaderText="recipe" SortExpression="recipe" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="MealsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" SelectCommand="SELECT [recipe], [foodName], [storageEnvironment], [quantity] FROM [Meals]"></asp:SqlDataSource>
    </form>
</body>
</html>
