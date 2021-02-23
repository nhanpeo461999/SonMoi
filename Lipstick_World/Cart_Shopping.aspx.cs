using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Cart_Shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Giohang"] != null)
            {
                getCart();
            }
            getDH();
        }

        private void getCart()
        {
            DataTable dt = new DataTable();
            System.Decimal TongThanhTien = 0;
            dt = (DataTable)Session["GioHang"];
            
            foreach (DataRow r in dt.Rows)
            {
                r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["DonGia"]);
                TongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
            }
            lbTongTien.Text = String.Format("{0:0,00}₫", int.Parse(TongThanhTien.ToString()));
            gvCart.DataSource = dt;
            gvCart.DataBind();
        }

        protected void gvCart_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                int chiso = int.Parse(e.CommandArgument.ToString());
                try
                {
                    DataTable dt = (DataTable)Session["GioHang"];
                    dt.Rows.RemoveAt(chiso);
                    Session["GioHang"] = dt;
                    Response.Redirect("~/Cart_Shopping.aspx");
                }
                catch
                {
                    Response.Redirect("~/Cart_Shopping.aspx");
                }
            }
        }

        protected void btnTT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Order.aspx");
        }

        private void getDH()
        {
            if(Session["TaiKhoan"] != null)
            {
                String select_DH = "select * from DonDatHang D join CT_DonHang C on D.MaDH = C.MaDH join San_Pham S on C.MaSP = S.Ma_SP join San_Pham_Image I on I.MaSP = S.Ma_SP" +
                " where D.TaiKhoan = '" + Session["TaiKhoan"].ToString() + "' and TrangThai = 0 and Position = 0";
                gvDGH.DataSource = XLDL.GetData(select_DH);
                gvDGH.DataBind();

            }
        }
    }   
}