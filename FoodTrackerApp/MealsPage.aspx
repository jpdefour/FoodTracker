<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealsPage.aspx.cs" Inherits="FoodTrackerApp.MealsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="text-align:center">
    <form id="MealForm" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="foodID" DataSourceID="MealsDataSource1" Height="312px" Width="459px">
            <Columns>
                <asp:BoundField DataField="foodID" HeaderText="foodID" InsertVisible="False" ReadOnly="True" SortExpression="foodID" />
                <asp:BoundField DataField="recipe" HeaderText="recipe" SortExpression="recipe" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="MealsDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" 
            SelectCommand="SELECT [Meals].* FROM [Meals] WHERE [Meals].[foodID] IN (SELECT [foodID] FROM [MadeInto] WHERE [foodID] = @strFoodID);" 
            DeleteCommand="DELETE FROM [Meals] WHERE [foodID] = @foodID;  DELETE FROM [MadeInto] WHERE [foodID] = @foodID;" 
            UpdateCommand="UPDATE Meals SET recipe = @recipe WHERE foodID = @foodID">
            <DeleteParameters>
                <asp:Parameter Name="foodID" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="strFoodID" QueryStringField="foodID" DefaultValue="" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="recipe" />
                <asp:Parameter Name="foodID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="boxRecipe" runat="server" Height="106px" Width="830px" placeholder="Type in your recipe"></asp:TextBox>
        <asp:Button ID="btnRecipe" runat="server" Text="Add Recipe" OnClick="btnRecipe_Click" />
    </form>
</body>
</html>
