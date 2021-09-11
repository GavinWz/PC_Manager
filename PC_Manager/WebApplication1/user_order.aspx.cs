using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class user_order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["capacity"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            var uid = Session["capacity"].ToString().Split(' ').Last();
            
            var d = new DataClasses1DataContext();
            var data = d.user_order(uid);
            //Response.Write("<script>alert('"+ data.First() +"')</script>");
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();
            Label2.Text = "具体配置方案信息：";
            var row = GridView1.SelectedRow.Cells;
            var id = GridView1.SelectedRow.Cells[3].Text;
            if (id == "&nbsp;")
            {
                GridView2.DataSource = "请等待技术人员提供解决方案";
                GridView2.DataBind();
                return;
            }
            else
            {
                GridView2.DataSource = "id = " +id;
                GridView2.DataBind();
                return;
            }

            var data = d.get_proposal(Int32.Parse(id));
            GridView2.DataSource = data;
            GridView2.DataBind();
        }

    }
}