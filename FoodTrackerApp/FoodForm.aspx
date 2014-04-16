<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodForm.aspx.cs" Inherits="FoodTrackerApp.FoodForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="FoodList" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Food List" Font-Size="XX-Large"></asp:Label>
      
    </div>
        <br />
        <br />
        <asp:GridView ID="viewFoods" runat="server" AutoGenerateColumns="False" DataKeyNames="foodID" DataSourceID="FoodsDataSource" Height="392px" style="margin-left: 0px; margin-top: 0px" Width="1309px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderWidth="1px" CellPadding="3" BorderStyle="None" CellSpacing="2" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="foodName" HeaderText="Food" SortExpression="foodName" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                <asp:BoundField DataField="storageEnvironment" HeaderText="Storage Environment" SortExpression="storageEnvironment" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                
                <asp:HyperLinkField Text="Ingredients" DataNavigateUrlFields="foodID" DataNavigateUrlFormatString="~/IngredientsPage.aspx?foodID={0}" />
                
                <asp:HyperLinkField DataNavigateUrlFields="foodID" DataNavigateUrlFormatString="~/MealsPage.aspx?foodID={0}" Text="Recipe" />
                
            </Columns>





            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>


        <asp:SqlDataSource ID="FoodsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" 
            SelectCommand="SELECT * FROM [Foods] WHERE [foodID] IN (SELECT [Contains].[foodID] FROM [Contains] WHERE [Contains].[username] = @strUserName)" 
            DeleteCommand="DELETE FROM [Foods] WHERE [foodID] = @foodID;
DELETE FROM [Contains] WHERE [foodID] = @foodID;" 
            InsertCommand="INSERT INTO [Foods] ([foodID], [foodName], [quantity], [storageEnvironment]) VALUES (@foodID, @foodName, @quantity, @storageEnvironment)" 
            UpdateCommand="UPDATE [Foods] SET [foodName] = @foodName, [quantity] = @quantity, [storageEnvironment] = @storageEnvironment WHERE [foodID] = @foodID">
            <DeleteParameters>
                <asp:Parameter Name="foodID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="foodID" Type="Int32" />
                <asp:Parameter Name="foodName" Type="String" />
                <asp:Parameter Name="quantity" Type="String" />
                <asp:Parameter Name="storageEnvironment" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="strUserName" SessionField="username" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="foodName" Type="String" />
                <asp:Parameter Name="quantity" Type="String" />
                <asp:Parameter Name="storageEnvironment" Type="String" />
                <asp:Parameter Name="foodID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:TextBox ID="FoodName" runat="server" placeholder="Food Name"></asp:TextBox>

        <asp:TextBox ID="Quantity" runat="server" placeholder="Quantity"></asp:TextBox>
        <asp:TextBox ID="StorageEnvironment" runat="server" placeholder="Storage Environment"></asp:TextBox>
        <asp:Button ID="btnAddFood" runat="server" OnClick="btnAddFood_Click" Text="Add Food" />
        <p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </p>
    </form>
</body>
</html>
