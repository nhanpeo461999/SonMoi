using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Lipstick_World.UC
{
    public partial class Header : System.Web.UI.UserControl
    {
        //DataTable dtLoaiSP = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            getMenuSP();
            if (Session["TaiKhoan"] != null)
            {
                lbTK.Text = Session["TaiKhoan"].ToString();
                lbTK.Visible = true;
                lbDX.Visible = true;
                lbDN.Visible = false;
                lbDK.Visible = false;
            }
            else
            {
                lbTK.Visible = false;
                lbDX.Visible = false;
                lbDN.Visible = true;
                lbDK.Visible = true;

            }
            if (Session["Giohang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Giohang"];
                System.Int32 tongSL = 0, tongTien = 0;
                foreach (DataRow r in dt.Rows)
                {
                    tongSL += Convert.ToInt32(r["SoLuong"]);
                    tongTien += Convert.ToInt32(r["DonGia"]) * Convert.ToInt32(r["SoLuong"]);
                }
                lbSLSP.Text = tongSL.ToString();
                lbTongTien.Text = String.Format("{0:0,00}₫", int.Parse(tongTien.ToString()));
            }
        }

        protected void aDX_Click(object sender, EventArgs e)
        {
            Session["TaiKhoan"] = null;
            Response.Redirect("~/Default.aspx");
        }

        private void getMenuSP()
        {
            dtMenuSP.DataSource = XLDL.GetData("select * from Hang_San_Xuat");
            dtMenuSP.DataBind();
        }

        protected void btn_XemGioHang_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart_Shopping.aspx");
        }

        protected void btn_ThanhToan_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Order.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            String strSearch = txtTimKiem.Text;
            String sql, datenew;
            int luotTruyCap = 1;
            datenew = DateTime.Now.ToString();
            DataTable dt = XLDL.GetData("select * from TimKiem where TuKhoa = '" + strSearch + "'");
            if (dt.Rows.Count > 0)
            {
                luotTruyCap = int.Parse(dt.Rows[0]["LuotTruyCap"].ToString());
                luotTruyCap++;
                sql = "UPDATE TimKiem SET LuotTruyCap = " + luotTruyCap + "" +
                    ", NgayNhapGanNhat = '" + datenew + 
                    "' WHERE TuKhoa = '" + strSearch + "'";
                XLDL.GetData(sql);
            }
            else
            {
                sql = "INSERT INTO TimKiem VALUES('"+strSearch+"'" +
                    "," +luotTruyCap+"" +
                    ",'"+datenew+"')";
                XLDL.GetData(sql);
            }
            Response.Redirect("~/SP_Search.aspx?Search=" + strSearch +"");
        }
    }
}