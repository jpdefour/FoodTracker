<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealsPage.aspx.cs" Inherits="FoodTrackerApp.MealsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="text-align:center">
    <form id="MealForm" runat="server">
    <div>
    
        Recipes</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="foodID" DataSourceID="MealsDataSource1" Height="428px" Width="1307px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="foodID" HeaderText="foodID" InsertVisible="False" ReadOnly="True" SortExpression="foodID" Visible="False" />
                <asp:BoundField DataField="recipe" HeaderText="Recipe" SortExpression="recipe" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
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
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server">Logout</asp:HyperLink>
        </p>
    </form>
</body>
</html>
