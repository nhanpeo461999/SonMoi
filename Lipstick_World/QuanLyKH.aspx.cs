using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class QuanLyKH : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getKH();
            }
        }

        private void getKH()
        {
            String sql = "select * from KhachHang where Xoa = 0";
            gvFG.DataSource = XLDL.GetData(sql);
            gvFG.DataBind();
        }
        protected void gvFG_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    String tk = gvFG.Rows[chiso].Cells[1].Text;
                    XLDL.GetData("update KhachHang set Xoa = 1 where TaiKhoan = '" + tk + "'");
                    Response.Write("<script>alert('Xóa thành công!!!')</script>");
                }
                catch
                {
                    Response.Write("<script>alert('Xóa thất bại!!!')</script>");
                }
            }
        }

        protected void gvFG_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFG.PageIndex = e.NewPageIndex;
            getKH();
        }

        protected void gvFG_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFG.EditIndex = -1;
            getKH();
        }

        protected void gvFG_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFG.EditIndex = e.NewEditIndex;
            getKH();
        }

        protected void gvFG_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            String tk = gvFG.DataKeys[e.RowIndex].Value.ToString();
            String hoten = (gvFG.Rows[e.RowIndex].Cells[0].Controls[0] as TextBox).Text;
            String sdt = (gvFG.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            String email = (gvFG.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;

            XLDL.Execute(@"update KhachHang set HoTen= N'" + hoten + "',Email = '" + email + "', SodienThoai = '" + sdt + "' where TaiKhoan='" + tk + "'");
           
            gvFG.EditIndex = -1;
            getKH();
        }
    }
}