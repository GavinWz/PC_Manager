<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 50%;
        }
        .auto-style3 {
            text-align: right;
            width: 459px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="auto-style1" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: xx-large; color: #008080">
                <strong>PC套装预约销售系统 - 登录</strong></p>
        </div>
        <p class="auto-style1">
            &nbsp;</p>
        <table align="center" class="auto-style2">
            <tr>
                <td class="auto-style3">用户名：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">密码：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 50%">登录身份：</td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="auto-style4" Height="24px" Width="85px">
                        <asp:ListItem Selected="True">员工</asp:ListItem>
                        <asp:ListItem>用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登录" />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="register.aspx">还没有用户？去注册&gt;&gt;</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
