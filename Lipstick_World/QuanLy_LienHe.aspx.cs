using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class QuanLy_LienHe : System.Web.UI.Page
    {
        String text;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    String sql = "select * from TrangLienhe";
                    text = (XLDL.GetData(sql)).Rows[0][0].ToString();
                }
                catch
                {
                    text = "Design cho mình một trang liên hệ!";
                }
                txtLienHe.InnerText = text;
            }
            
            
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                String sql = "update TrangLienHe set TrangLienHe = N'" + txtLienHe.InnerText + "' where id = 1";
                XLDL.GetData(sql);
                Response.Write("<script>alert('Sửa thành công!');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('LienHe.aspx','_newtab');", true);
            }
            catch
            {
                Response.Write("<script>alert('Sửa không thành công');</script>");
            }
        }
    }
}