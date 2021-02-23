using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class QuanLy_SP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getFG();
        }
        private void getFG()
        {
            gvFG.DataSource = XLDL.GetData("select * from San_Pham");
            gvFG.DataBind();
        }

        protected void gvFG_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFG.PageIndex = e.NewPageIndex;
            getFG();
        }

        protected void gvFG_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    String maFG = gvFG.Rows[chiso].Cells[1].Text;
                    XLDL.Execute("delete from San_Pham where TenSP='" + maFG+"'");
                    Response.Redirect("QuanLy_SP.aspx");

                }
                catch
                {
                    Response.Write("<script>alert('Xóa thất bại!!!')</script>");
                }
            }
        }
    }
}