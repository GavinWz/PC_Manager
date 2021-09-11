<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 50%;
        }
        .auto-style3 {
            text-align: right;
            width: 343px;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            text-align: right;
            height: 18px;
            width: 343px;
        }
        .auto-style6 {
            height: 18px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
        <div>
            <p class="auto-style1" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: xx-large; color: #008080">
                <strong>PC套装预约销售系统 - 注册</strong></p>
        </div>
            <table class="auto-style2" align="center">
                <tr>
                    <td class="auto-style5">用户名：</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">姓名：</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">密码：</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">确认密码：</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">邮箱：</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatLayout="Flow">
                    <asp:ListItem>员工注册</asp:ListItem>
                    <asp:ListItem>用户注册</asp:ListItem>
                </asp:RadioButtonList>
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="login.aspx">已有用户？去登陆&gt;&gt;</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <div class="auto-style4">
            </div>
            <div class="auto-style1">
                <br />
            </div>
        </div>
    </form>
</body>
</html>
