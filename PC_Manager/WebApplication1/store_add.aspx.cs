using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class store_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["capacity"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            var status = Session["capacity"].ToString();
            if (status.Contains("员工"))
            {
                ;
            }
            else if (status.Contains("用户"))
            {
                Response.Write("<script>alert('请使用员工身份登录！')</script>");
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();

            var type = DropDownList1.SelectedValue;
            var name = TextBox1.Text;
            var detail = TextBox2.Text;
            var price = TextBox3.Text;
            int? status = 2;
            d.store_add(type, name, detail, Int32.Parse(price), ref status);
            if (status == 0)
            {
                Response.Write("<script>alert('添加成功！')</script>");
            }
            else if (status == 1)
            {
                Response.Write("<script>alert('添加失败！')</script>");
            }
            else
            {
                Response.Write("<script>alert('发生未知错误！')</script>");
            }

        }
    }
}