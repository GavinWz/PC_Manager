<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="entrance.aspx.cs" Inherits="WebApplication1.WebForm2" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <p class="auto-style1" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: xx-large; color: #008080">
                <strong>PC套装预约销售系统</strong></p>
            <asp:Button ID="register" runat="server" OnClick="Button1_Click" Text="注册" />
            <br />
            <br />
            <asp:Button ID="login" runat="server" Text="登录" OnClick="login_Click" />
        </div>
    </form>
</body>
</html>
