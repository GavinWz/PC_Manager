<%@ Page validateRequest="false" Title="" Language="C#" MasterPageFile="~/staff.Master" AutoEventWireup="true" CodeBehind="store.aspx.cs" Inherits="WebApplication1.component" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />  
    <style type="text/css">
        .auto-style4 {
            width: 50%;
        }
        .auto-style9 {
            text-align: right;
            width: 394px;
        }
        .auto-style10 {
            text-align: right;
        }
        .auto-style11 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
        <asp:Panel ID="Panel1" runat="server">
            <div class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="配件类型："></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="type" DataValueField="type">
                    <asp:ListItem>所有配件</asp:ListItem>
                    <asp:ListItem>CPU</asp:ListItem>
                    <asp:ListItem>主板</asp:ListItem>
                    <asp:ListItem>内存</asp:ListItem>
                    <asp:ListItem>显卡</asp:ListItem>
                    <asp:ListItem>显示器</asp:ListItem>
                    <asp:ListItem>机箱</asp:ListItem>
                    <asp:ListItem>硬盘</asp:ListItem>
                    <asp:ListItem>电源</asp:ListItem>
                    <asp:ListItem>鼠标</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="搜索" />
                &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PC_ManagerConnectionString1 %>" SelectCommand="select [type] from(
select 0 tid,'所有配件' type
union
SELECT tid,[type] FROM [type]
) ttt  order by tid"></asp:SqlDataSource>
           
                    <div class="auto-style1">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
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
                
                <br />
                <div class="auto-style12">
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="创建方案" />
                &nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <br />
                <br />
                <table align="center" class="auto-style4">
                    <tr>
                        <td class="auto-style9">ID：</td>
                        <td class="auto-style11">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">类型：</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">品名：</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">详情：</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">价格：</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Button ID="Button2" runat="server" Text="修改此项" OnClick="Button2_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Button ID="Button3" runat="server" Text="加入方案" OnClick="Button3_Click" />
                        </td>
                        <td class="auto-style11">
                            
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                            
                            &nbsp;
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新增配件" />
                        </td>
                        <td class="auto-style11">

                            &nbsp;</td>
                    </tr>
                    </div>
                </table>
            </div>
            <div class="auto-style1">
                &nbsp;&nbsp;
                <br />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
