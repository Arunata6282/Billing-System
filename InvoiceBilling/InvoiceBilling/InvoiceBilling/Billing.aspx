<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="InvoiceBilling.Billing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billing</title>
</head>
<body>
    <form id="form1" runat="server" style="width: 1335px; height: 800px; background-color: #808080;">
    <!-- form content here -->
        <h1><center>BILLING SYSTEM</center></h1>
        <div>
    <asp:Label ID="Label8" runat="server" style="margin-right:10px" Text="BILL NO :"></asp:Label>
    <asp:TextBox ID="TextBox5" runat="server" style="width: 30px;height: 15px;padding: 2px;border: 1px solid #ccc; border-radius: 5px;background-color: #f1f1f1;" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Label7" runat="server" style="margin-left:1000px" Text="Date Time:" ForeColor="White"></asp:Label> 
        </div><br />
        <%--<div>
            <asp:Label ID="Label8" runat="server" style="margin-right:100px" Text="BILL NO :"></asp:Label>
             <asp:TextBox ID="TextBox5" runat="server" style="width: 10px;height: 10px;padding: 16px 16px;border: none;  border-radius: 20px;background-color: #f1f1f1;"></asp:TextBox>
        </div><br />--%>
            
        <div>
</div><br />
        
                <asp:Panel ID="Panel1" runat="server" style="  background-color: #a5a58b; border: 1px solid #ccc; padding: 10px; " Height="160px" Width="900px">
<div>
            &nbsp;<asp:Label ID="Label1" runat="server" style="margin-right:2px" Text="CUSTOMER NAME"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" style="margin-right:2px" Text="PRODUCT NAME"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" style="margin-right:2px" Text="QUANTITY"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" style="border-style: none; border-color: inherit; border-width: medium; padding: 8px 50px; border-radius: 4px;background-color: #f1f1f1; " Width="58px"></asp:TextBox>
            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </div>
                    <br />
                     <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="140px"  >
                    </asp:DropDownList>
                   <%-- <asp:DropDownList ID="DropDownList1" runat="server" Height="14px" style="border-style: none; background-color: #dcdc3f; border-color: inherit; border-width: medium; padding: 15px 70px; border-radius: 4px; " Width="74px">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" style=" margin-left:20px; border-style: none; border-color: inherit; border-width: medium; padding: 16px 20px; border-radius: 4px;  " Width="150px">
                    </asp:DropDownList>--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" Height="35px" Width="160px">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="PRICE"></asp:Label>
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="16px" style="border-style: none; border-color: inherit; border-width: medium; padding: 8px 50px; border-radius: 4px; background-color: #f1f1f1;" Width="58px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="TAX"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server" Height="16px" readonly="true" style="border-style: none; border-color: inherit; border-width: medium; padding: 8px 50px; border-radius: 4px; background-color: #f1f1f1;" Width="58px">15 %</asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Height="44px" OnClick="Button1_Click" Text="BILL" Width="110px" />
                    <br />
                    <br />
                    <br />
           </asp:Panel>

        
        <div>

        </div><br />
         <div>

        </div><br />
         <div>

        </div><br />
         <div>

        </div>
        <br />
       
        
        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged2" style="background-color:#a5a58b; margin-left:500px;"  Width="315px">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="CUSTOMER NAME" ControlStyle-BorderWidth="20px" SortExpression="name" />
                <asp:BoundField DataField="pname" HeaderText="PRODUCT NAME" SortExpression="pname" />
                <asp:BoundField DataField="qty" HeaderText="QUANTITY" SortExpression="qty" />
                <asp:BoundField DataField="price" HeaderText="PRICE" SortExpression="price" />
                <asp:BoundField DataField="tax" HeaderText="TAX" SortExpression="tax" />
                <asp:BoundField DataField="Tax_exclusive" HeaderText="TAX EXCLUSIVE" SortExpression="Tax_exclusive" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="Datasource" runat="server"  ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>" SelectCommand="SELECT [name], [pname], [qty], [price], [tax], [granttotal] FROM [invoice]"></asp:SqlDataSource>







                <asp:Panel ID="Panel2" runat="server" style="  background-color: #a5a58b; border: 1px solid #ccc; padding: 10px; " Height="128px" Width="192px">


                    <asp:Label ID="Label9" runat="server" Text="UNTAXED AMOUNT :" Font-Bold="true"></asp:Label>
        <p>
            <asp:Label ID="Label10" runat="server" Text="TAX 15% :" Font-Bold="true"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label11" runat="server" Text="TOTAL :" Font-Bold="true"></asp:Label>
        </p>
        </asp:Panel>
        
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                           <asp:Button ID="Button2" runat="server" Height="44px" style="margin-left=100px;" Text="CLEAR" Width="110px" OnClick="Button2_Click" />

    </form>
</body>
</html>
