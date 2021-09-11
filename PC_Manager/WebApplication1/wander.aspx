<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="wander.aspx.cs" Inherits="WebApplication1.wander" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
    <style type="text/css">
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="auto-style3">
        <tr>
            <td class="auto-style6">描述： </td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Height="76px" Width="176px" MaxLength="30" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" style="width: 50%">预算：</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox2" runat="server" Width="80px"></asp:TextBox>
                元</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
            </td>
        </tr>
    </table>
</asp:Content>
