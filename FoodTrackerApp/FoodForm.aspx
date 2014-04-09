<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodForm.aspx.cs" Inherits="FoodTrackerApp.FoodForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="foodID" DataSourceID="FoodsDataSource" Height="284px" style="margin-left: 237px; margin-top: 107px" Width="554px" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="foodID" HeaderText="foodID" ReadOnly="True" SortExpression="foodID" />
                <asp:BoundField DataField="foodName" HeaderText="foodName" SortExpression="foodName" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="storageEnvironment" HeaderText="storageEnvironment" SortExpression="storageEnvironment" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="FoodsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FTConnStr %>" SelectCommand="SELECT * FROM [Foods] ORDER BY [foodName]"></asp:SqlDataSource>
    </form>
</body>
</html>
