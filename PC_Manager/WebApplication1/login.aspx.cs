using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();
            var id = TextBox1.Text.ToString();
            var passwd = TextBox2.Text.ToString();
            var selected = RadioButtonList1.SelectedValue.ToString();
            if (id.Length == 0 || passwd.Length == 0)
            {
                Response.Write("<script>alert('用户名和密码不能为空！')</script>");
                return;
            }
            int? status = 2;
            if (selected == "用户")
            {
                d.user_login(id, passwd, ref status);
                if(status == 0)
                {
                    Session["capacity"] = selected + " " + id;
                    Response.Redirect("user_dashboard.aspx");
                }
                else if (status == 1)
                {
                    Response.Write("<script>alert('用户名或密码错误！')</script>");
                }
            }
            else if (selected == "员工")
            {
                d.staff_login(id, passwd, ref status);
                if (status == 0)
                {
                    Session["capacity"] = selected + " " + id;
                    Response.Redirect("staff_dashboard.aspx");
                }
                else if (status == 1)
                {
                    Response.Write("<script>alert('用户名或密码错误！')</script>");
                }
            }
        }
    }
}