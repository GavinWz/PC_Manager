using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();
            var selected = RadioButtonList1.SelectedValue.ToString();
            var id = TextBox1.Text.ToString();
            var name = TextBox2.Text.ToString();
            var passwd = TextBox3.Text.ToString();
            var email = TextBox5.Text.ToString();
            if (selected == null)
            {
                Response.Write("<script>alert('请选择注册身份！')</script>");
            }
            else{
                if(TextBox3.Text != TextBox4.Text)
                {
                    Response.Write("<script>alert('两次密码输入不一致！')</script>");
                    return;
                }
            }
            int? status = 3;
            if (selected == "用户注册")
            {
                d.add_user(id, name, passwd, email, ref status);
            }
            else if(selected == "员工注册")
            {
                d.add_staff(id, name, passwd, email, ref status);
            }
            if (status == 0)
            {
                Label1.Text = "注册成功";
                Response.Redirect("login.aspx");
            }
            else if(status == 1)
            {
                Label1.Text = "id已存在";
            }
            else if(status == 2)
            {
                Label1.Text = "发生未知错误";
            }

        }
    }
}