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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="IngredientsDataSource" Height="258px" Width="520px" DataKeyNames="ingredientID">
            <Columns>
                <asp:BoundField DataField="ingredientID" HeaderText="ingredientID" SortExpression="ingredientID" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="ingredientName" HeaderText="ingredientName" SortExpression="ingredientName" />
                <asp:BoundField DataField="ingredientQuantity" HeaderText="ingredientQuantity" SortExpression="ingredientQuantity" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="IngredientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" 
            SelectCommand="SELECT [Ingredients].* FROM [Ingredients] WHERE [Ingredients].[ingredientID] IN (SELECT [ingredientID] FROM [Includes] WHERE [foodID] = @strFoodID);" 
            DeleteCommand="DELETE FROM [Ingredients] WHERE [ingredientID] = @ingredientID;  DELETE FROM [Includes] WHERE [ingredientID] = @ingredientID;" UpdateCommand="UPDATE Ingredients SET ingredientName = @ingredientName, ingredientQuantity =@ingredientQuantity WHERE ingredientID = @ingredientID;">
            <DeleteParameters>
                <asp:Parameter Name="ingredientID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="11" Name="strFoodID" QueryStringField="foodID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ingredientName" />
                <asp:Parameter Name="ingredientQuantity" />
                <asp:Parameter Name="ingredientID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="boxIngredientName" runat="server" placeholder="Ingredient Name"></asp:TextBox>
        <asp:TextBox ID="boxIngredientQuantity" runat="server" placeholder="Quantity"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Add Ingredient" OnClick="Button1_Click" />
    </form>
</body>
</html>
