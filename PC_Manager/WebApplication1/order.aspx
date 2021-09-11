<%@ Page Title="" Language="C#" MasterPageFile="~/staff.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="WebApplication1.order1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="订单号" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="订单号" HeaderText="订单号" InsertVisible="False" ReadOnly="True" SortExpression="订单号" />
                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" />
                <asp:BoundField DataField="配置方案号" HeaderText="配置方案号" SortExpression="配置方案号" />
                <asp:BoundField DataField="客户" HeaderText="客户" SortExpression="客户" />
                <asp:BoundField DataField="员工" HeaderText="员工" SortExpression="员工" />
                <asp:BoundField DataField="成交价" HeaderText="成交价" SortExpression="成交价" />
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:BoundField DataField="状态" HeaderText="状态" SortExpression="状态" />
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
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
    </div>
    <br />
    <div class="auto-style1">
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PC_ManagerConnectionString %>" DeleteCommand="DELETE FROM [order] WHERE [oid] = @oid" InsertCommand="INSERT INTO [order] ([remark], [pid], [uid], [sid], [final_price], [date], [status]) VALUES (@remark, @pid, @uid, @sid, @final_price, @date, @status)" SelectCommand="SELECT oid 订单号, remark 备注, pid 配置方案号, uid 客户, sid 员工, final_price 成交价, date 日期, status 状态 FROM [order]" UpdateCommand="UPDATE [order] SET [remark] = @remark, [pid] = @pid, [uid] = @uid, [sid] = @sid, [final_price] = @final_price, [date] = @date, [status] = @status WHERE [oid] = @oid">
        <DeleteParameters>
            <asp:Parameter Name="oid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="remark" Type="String" />
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="uid" Type="Int32" />
            <asp:Parameter Name="sid" Type="Int32" />
            <asp:Parameter Name="final_price" Type="Double" />
            <asp:Parameter Name="date" Type="String" />
            <asp:Parameter Name="status" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="remark" Type="String" />
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="uid" Type="Int32" />
            <asp:Parameter Name="sid" Type="Int32" />
            <asp:Parameter Name="final_price" Type="Double" />
            <asp:Parameter Name="date" Type="String" />
            <asp:Parameter Name="status" Type="Int32" />
            <asp:Parameter Name="oid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
