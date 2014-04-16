<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngredientsPage.aspx.cs" Inherits="FoodTrackerApp.IngredientsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Ingredients<br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="IngredientsDataSource" Height="454px" Width="1311px" DataKeyNames="ingredientID" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="ingredientID" HeaderText="ingredientID" SortExpression="ingredientID" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="ingredientName" HeaderText="Ingredient" SortExpression="ingredientName" />
                <asp:BoundField DataField="ingredientQuantity" HeaderText="Quantity" SortExpression="ingredientQuantity" />
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
        <p>
            <asp:HyperLink ID="hpFoodList" NavigateUrl="FoodForm.aspx" runat="server">Go back to your foods</asp:HyperLink>
        </p>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </form>
</body>
</html>
