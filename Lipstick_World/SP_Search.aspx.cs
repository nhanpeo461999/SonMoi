using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class SP_Search : System.Web.UI.Page
    {
        String maSP;
        protected void Page_Load(object sender, EventArgs e)
        {
            getSP();
        }

        private void getSP()
        {
            String tenSP = Request.QueryString["Search"].ToString();
            DataTable dt = new DataTable();
            try
            {
                dt = XLDL.GetData("select * from San_Pham S join San_Pham_Image I on S.Ma_SP = I.MaSP where Position = 0 and TenSP like '%" + tenSP + "%'");
                dtSPNB.DataSource = dt;
                dtSPNB.DataBind();
                maSP = dt.Rows[0]["Ma_SP"].ToString();
            }
            catch
            {

            }
            
            lbTiTle.Text = tenSP;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            GH();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
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
    }
}