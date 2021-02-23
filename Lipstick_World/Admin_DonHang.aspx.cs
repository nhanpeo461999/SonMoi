using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Admin_DonHang : System.Web.UI.Page
    {
        DataTable dt_DonHang = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDH();
            }
        }

        private void getDH()
        {
            dt_DonHang = XLDL.GetData("select * from DonDatHang");
            DataTable dt2_DonHang = dt_DonHang.Clone();
            dt2_DonHang.Columns["ThanhToan"].DataType = typeof(String);
            dt2_DonHang.Columns["TrangThai"].DataType = typeof(String);
            dt2_DonHang.Columns["Choduyet"].DataType = typeof(String);
            for (int i=0; i < dt_DonHang.Rows.Count; i++)
            {
                dt2_DonHang.ImportRow(dt_DonHang.Rows[i]);
                int thanhtoan = int.Parse(dt_DonHang.Rows[i]["ThanhToan"].ToString());
                int choduyet = int.Parse(dt_DonHang.Rows[i]["Choduyet"].ToString());
                switch (thanhtoan)
                {
                    case 0:
                        dt2_DonHang.Rows[i]["ThanhToan"] = "Thanh toán sau khi nhận hàng";
                        break;
                    case 1:
                        dt2_DonHang.Rows[i]["ThanhToan"] = "ví điện tử momo";
                        break;
                    case 2:
                        dt2_DonHang.Rows[i]["ThanhToan"] = "onepay nội địa";
                        break;
                    case 3:
                        dt2_DonHang.Rows[i]["ThanhToan"] = "onepay quốc tế";
                        break;
                }
                switch (choduyet){
                    case 0:
                        dt2_DonHang.Rows[i]["Choduyet"] = "Chưa duyệt";
                        break;
                    case 1:
                        dt2_DonHang.Rows[i]["Choduyet"] = "Chờ giao hàng";
                        break;
                }
                dt2_DonHang.Rows[i]["TrangThai"] = "Chưa giao hàng";
                
            }
            gvDH.DataSource = dt2_DonHang;
            gvDH.DataBind();

        }

        protected void gvDH_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Duyet")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    String tk = gvDH.Rows[chiso].Cells[0].Text;
                    XLDL.GetData("update DonDatHang set Choduyet = 1 where MaDH = '" + tk + "'");
                    getDH();
                    Response.Write("<script>alert('Đã duyệt!!!')</script>");
                }
                catch
                {
                    Response.Write("<script>alert('Xóa thất bại!!!')</script>");
                }
            }
        }
    }
}