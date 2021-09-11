using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class wander : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                  
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();
            var uid = Session["capacity"].ToString().Split(' ').Last();
            String remark = "["+TextBox2.Text+"] " +TextBox1.Text;
            int? status = 2;
            d.order_add(remark, null, uid, null, null, DateTime.Now.ToString(), ref status);
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

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}