using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class user_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["capacity"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            var status = Session["capacity"].ToString();
            if (status.Contains("用户"))
            {
                ;
            }
            else if (status.Contains("员工"))
            {
                Response.Write("<script>alert('请使用用户身份登录！')</script>");
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}