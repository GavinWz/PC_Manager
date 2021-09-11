using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class staff1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var capacity = Session["capacity"];

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
            if (Session["capacity"] != null)
            {

                Label1.Text = "卑微的打工人 " + capacity.ToString().Split(' ')[1] + "，欢迎您!";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["capacity"] = null;
            Session.Remove("capacity");
            Response.Redirect(Request.RawUrl);
        }
    }
}