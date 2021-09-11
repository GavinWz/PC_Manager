<%@ Page Title="" Language="C#" MasterPageFile="~/staff.Master" AutoEventWireup="true" CodeBehind="store_add.aspx.cs" Inherits="WebApplication1.store_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
    <style type="text/css">
        .auto-style3 {
            text-align: right;
            width: 747px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PC_ManagerConnectionString %>" SelectCommand="SELECT * FROM [type]"></asp:SqlDataSource>
    <table class="auto-style2">
        <tr>
            <td class="auto-style1">
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">类型：</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="type" DataValueField="type">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">名称：</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">详情：</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">价格：</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认添加" />
            </td>
        </tr>
    </table>
</asp:Content>
