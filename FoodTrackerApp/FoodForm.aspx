<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodForm.aspx.cs" Inherits="FoodTrackerApp.FoodForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Food List" Font-Size="XX-Large"></asp:Label>
      
    </div>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="foodID" DataSourceID="FoodsDataSource" Height="284px" style="margin-left: 0px; margin-top: 0px" Width="554px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="foodName" HeaderText="foodName" SortExpression="foodName" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="storageEnvironment" HeaderText="storageEnvironment" SortExpression="storageEnvironment" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                
            </Columns>





            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>


        <asp:SqlDataSource ID="FoodsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" 
            SelectCommand="SELECT * FROM [Foods] ORDER BY [foodName]" 
            DeleteCommand="DELETE FROM [Foods] WHERE [foodID] = @foodID" 
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
            <UpdateParameters>
                <asp:Parameter Name="foodName" Type="String" />
                <asp:Parameter Name="quantity" Type="String" />
                <asp:Parameter Name="storageEnvironment" Type="String" />
                <asp:Parameter Name="foodID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:TextBox ID="FoodName" runat="server"></asp:TextBox>

        <asp:TextBox ID="Quantity" runat="server"></asp:TextBox>
        <asp:TextBox ID="StorageEnvironment" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
