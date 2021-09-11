using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
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
            if (status.Contains("用户"))
            {
                ;
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            if (Session["capacity"] != null)
            {

                Label1.Text = "尊贵的用户 " + capacity.ToString().Split(' ')[1] + "，欢迎您!";
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