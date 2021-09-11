using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class proposal1 : System.Web.UI.Page
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

        private void bind()
        {
            var d = new DataClasses1DataContext();
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var oid = DropDownList1.SelectedValue.ToString();

            var d = new DataClasses1DataContext();
            var selected = GridView1.SelectedRow;
            var pid = selected.Cells[1].Text;
            double final_price = double.Parse(selected.Cells[14].Text);
            var remark = selected.Cells[2].Text;
            var date = DateTime.Now.ToString();
            int? status = 2;
            var sid = Session["capacity"].ToString().Split(' ').Last();
            Response.Write(sid);    
            if(oid == "1")
            {
                d.order_add(remark, Int32.Parse(pid), null, sid, final_price, date, ref status);
            }
                
            else
            {
                d.order_add_to_id(remark,Int32.Parse(oid), Int32.Parse(pid), null, sid, final_price, date, ref status);
            }
            if (status == 0)
            {
                Response.Write("<script>alert('添加成功！')</script>");
            }
            else if (status == 1)
            {
                Response.Write("<script>alert('数据库添加失败！')</script>");
            }
            else
            {
                Response.Write("<script>alert('发生未知错误！')</script>");
            }
            Response.Write(selected.Cells[1].Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}