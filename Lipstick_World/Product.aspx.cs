using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Product : System.Web.UI.Page
    {
        String maSX;
        String maSP;
        protected void Page_Load(object sender, EventArgs e)
        {
            maSX = Request.QueryString["maSX"].ToString();
            getSP();
            getTitle();
        }

        private void getSP()
        {
            DataTable dt = new DataTable();
            dt = XLDL.GetData("select * from San_Pham S join San_Pham_Image I on S.Ma_SP = I.MaSP where S.MSX = '" + maSX + "' and Position = 0");
            dtSP.DataSource = dt;
            dtSP.DataBind();
            maSP = dt.Rows[0]["Ma_SP"].ToString();
        }

        private void getTitle()
        {
            DataTable dt = XLDL.GetData("select * from Hang_San_Xuat where MSX = '" + maSX + "'");
            DataTable dt2 = XLDL.GetData("select count(*) from San_Pham where MSX = '" + maSX + "'");
            lbLoaiSP.Text = dt.Rows[0]["HanSanXuat"].ToString();
            lbSoLuong.Text = dt2.Rows[0][0].ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            /*GH();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);*/
        }

        public void GH()
        {
            DataTable dt = new DataTable();
            //maSP = Request.QueryString["MaSP"].ToString();
            dt = XLDL.GetData("select Ma_SP,TenSP,DonGia,Image from San_Pham inner join San_Pham_Image on Ma_SP = MaSP where Ma_SP= '" + maSP + "' and Position = 0 ");
            string TenSP = dt.Rows[0][1].ToString();
            float DonGia = float.Parse(dt.Rows[0][2].ToString());
            String Image = "/Image/San_Pham/" + dt.Rows[0][3].ToString() + ".jpg";
            int SoLuong = 1;
            new Product_Des().ThemVaoGioHang(maSP, TenSP, DonGia, SoLuong, Image);
        }

        protected void dtSP_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "enter")
            {
                maSP = e.CommandArgument.ToString();
            }
            GH();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}