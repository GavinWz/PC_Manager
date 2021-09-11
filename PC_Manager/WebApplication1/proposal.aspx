<%@ Page Title="" Language="C#" MasterPageFile="~/staff.Master" AutoEventWireup="true" CodeBehind="proposal.aspx.cs" Inherits="WebApplication1.proposal1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="pid" HeaderText="ID" SortExpression="pid" />
        <asp:BoundField DataField="remark" HeaderText="备注" SortExpression="remark" />
        <asp:BoundField DataField="主板" HeaderText="主板" SortExpression="主板" />
        <asp:BoundField DataField="CPU" HeaderText="CPU" SortExpression="CPU" />
        <asp:BoundField DataField="内存" HeaderText="内存" SortExpression="内存" />
        <asp:BoundField DataField="散热" HeaderText="散热" SortExpression="散热" />
        <asp:BoundField DataField="显卡" HeaderText="显卡" SortExpression="显卡" />
        <asp:BoundField DataField="硬盘" HeaderText="硬盘" SortExpression="硬盘" />
        <asp:BoundField DataField="机箱" HeaderText="机箱" SortExpression="机箱" />
        <asp:BoundField DataField="显示器" HeaderText="显示器" SortExpression="显示器" />
        <asp:BoundField DataField="键盘" HeaderText="键盘" SortExpression="键盘" />
        <asp:BoundField DataField="鼠标" HeaderText="鼠标" SortExpression="鼠标" />
        <asp:BoundField DataField="电源" HeaderText="电源" SortExpression="电源" />
        <asp:BoundField DataField="total" HeaderText="总计" SortExpression="total" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PC_ManagerConnectionString1 %>" SelectCommand="SELECT * FROM [proposal]"></asp:SqlDataSource>
<table class="auto-style2">
    <tr>
        <td class="auto-style1">
&nbsp;<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="remark" DataValueField="oid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                <asp:ListItem>创建新订单</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成订单" />
            <br />
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PC_ManagerConnectionString1 %>" SelectCommand="SELECT [oid], [remark] FROM [order]"></asp:SqlDataSource>
            <br />
        </td>
    </tr>
</table>
<br />
<br />
<br />
<br />
<br />
</asp:Content>
