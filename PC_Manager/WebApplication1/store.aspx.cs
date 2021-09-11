using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class component : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                bind(""); 
            }
            Label2.Text = "";
        }

        private void bind(string tp)
        {
            var d = new DataClasses1DataContext();
            page_bind();

            var list = d.proposal.Select(p => (new { remark = p.remark, tid = p.pid })).ToList();
            
            DropDownList2.DataSource = list;
            DropDownList2.DataTextField = "remark";
            DropDownList2.DataValueField = "tid";
            DropDownList2.DataBind();
            
        }

        private void page_bind()
        {
            var tp = DropDownList1.SelectedValue;
            var d = new DataClasses1DataContext();
            if (tp == "" || tp == "所有配件")
            {
                var new_data = d.selectAll();   
                GridView1.DataSource = new_data;
            }
            else
            {
                int? status = 1;
                var new_data1 = d.selectType(tp, ref status);
                GridView1.DataSource = new_data1;

            }
            GridView1.DataBind();
        }

        private void search_bind(string name)
        {
            var tp = DropDownList1.SelectedValue;
            var d = new DataClasses1DataContext();
            int? status = 2;
            if (tp == "" || tp == "所有配件")
            {
                //Select(p => (new { remark = p.remark, tid = p.pid })).ToList();
                var new_data = d.search_in_all(name, ref status);
                if (status == 0)
                {
                    GridView1.DataSource = new_data;
                    GridView1.DataBind();
                }
            }
            else
            {
                var new_data = d.search_in_type(name, tp, ref status);
                if (status == 0)
                {
                    GridView1.DataSource = new_data;
                    GridView1.DataBind();
                }
            }
            if(status == 1)
                Response.Write("<script>alert('数据库错误！')</script>");
            else if(status == 2)
                Response.Write("<script>alert('未知错误！')</script>");
            
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            var name = TextBox7.Text;
            search_bind(name);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (TextBox7.Text == "")
                page_bind();
            else
            {
                search_bind(TextBox7.Text);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {   var selected = DropDownList1.SelectedValue;
            GridView1.PageIndex = 0;
            bind(selected);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var item = GridView1.SelectedRow;
            
            Label1.Text = item.Cells[1].Text;
            TextBox2.Text = item.Cells[2].Text;
            TextBox3.Text = item.Cells[3].Text;
            TextBox4.Text = item.Cells[4].Text;
            TextBox5.Text = item.Cells[5].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();

            int? status = 1;
            d.modify(Int32.Parse(Label1.Text), TextBox2.Text, TextBox3.Text, TextBox4.Text, float.Parse(TextBox5.Text), ref status);
            if(status == 0)
            {
                Response.Write("<script>alert('修改成功！')</script>");
            }
            else
            {
                Response.Write("<script>alert('发生未知错误！')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();
            var remark = TextBox6.Text;
            int? status = 2;
            if(remark.Length > 0)
            {
                d.proposalAdd(remark, ref status);
            }
            if (status == 1)
            {
                Response.Write("<script>alert('请输入方案描述！')</script>");
            }
            else if (status == 0)
            {
                Response.Write("<script>alert('添加成功！')</script>");
                bind(DropDownList1.SelectedValue);
            }
            else
            {
                Response.Write("<script>alert('发生未知错误！')</script>");
            }
            
        }
      
        protected void Button3_Click(object sender, EventArgs e)
        {
            var d = new DataClasses1DataContext();
            var pid = DropDownList2.SelectedValue.ToString();
            //var name = DropDownList2.SelectedItem.Text;
            
            var type = TextBox2.Text;
            var name = TextBox3.Text;
            if(name == "" || name == "")
            {
                Label2.Text = "请填入配件信息!";
                return;
            }
            int? status = 2;
            d.proposal_attach(Int32.Parse(pid), type, name, ref status);
            //double? total = 0;
            //d.get_total(ref total);
            if (status == 0)
            {
                Label2.Text = "添加成功！";
            }
            else if(status == 1)
            {
                Label2.Text = "该方案不存在！";
            }
            else
            {
                Label2.Text = "发生未知错误！";
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("store_add.aspx");
        }

       

    }
}