using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World.UC
{
    public partial class content : System.Web.UI.UserControl
    {
        String maSP;
        static PagedDataSource p = new PagedDataSource();

        public static int intSTT;

        public static int trang_thu = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getSP();
            }
        }

        private void getSP()
        {
            DataTable dt = new DataTable();
            dt = XLDL.GetData("select * from San_Pham S join San_Pham_Image I on S.Ma_SP = I.MaSP where Position = 0 order by DaBan desc");
            
            //maSP = dt.Rows[0]["Ma_SP"].ToString();

            p.DataSource = dt.DefaultView;
            p.PageSize = 8;
            p.CurrentPageIndex = trang_thu;
            p.AllowPaging = true;

            btnFirst.Enabled = true;
            btnLast.Enabled = true;
            btnnext.Enabled = true;
            btnpre.Enabled = true;

            if (p.IsFirstPage == true)//neu la dau.

            {

                btnFirst.Enabled = false;//neu la trang dau thi hai nut mo di.

                btnpre.Enabled = false;

                btnnext.Enabled = true;//Hai nut sau sang len.

                btnLast.Enabled = true;

            }
            if (p.IsLastPage == true)//neu la cuoi

            {

                btnFirst.Enabled = true;//nguoc lai

                btnpre.Enabled = true;

                btnnext.Enabled = false;

                btnLast.Enabled = false;

            }
            txtPage.Text = (trang_thu + 1).ToString();
            txtMaxPage.Text = p.PageCount.ToString();
            dtSPNB.DataSource = p;
            dtSPNB.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            //GH();
            //Page.Response.Redirect(Page.Request.Url.ToString(), true);
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

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            trang_thu = 0;

            getSP();
        }

        protected void btnpre_Click(object sender, EventArgs e)
        {
            trang_thu--;

            getSP();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            trang_thu++;

            getSP();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            trang_thu = p.PageCount - 1;

            getSP();
        }

        protected void dtSPNB_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            
        }

        protected void dtSPNB_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            
        }

        protected void dtSPNB_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }

        protected void dtSPNB_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "enter")
            {
                maSP = e.CommandArgument.ToString();
            }
            GH();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int page = int.Parse(txtPage.Text);
           
            if (page >= p.PageCount)
                page = p.PageCount;
            trang_thu = page-1;
            getSP();

        }
    }
}