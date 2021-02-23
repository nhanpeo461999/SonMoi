using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Product_Des : System.Web.UI.Page
    {
        String maSP;
        int SoLuong;
        int danhgia;
        protected void Page_Load(object sender, EventArgs e)
        {
            SoLuong = 0;
            maSP = Request.QueryString["maSP"].ToString();
            getSP();
            SoLuong = Int32.Parse(txtSL.Text);
            if (SoLuong < 0)
                txtSL.Text = "0";
        }

        private void getSP()
        {
            int DG;
            float sao=0;
            String img;
            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();

            danhgia = int.Parse(radlist.SelectedValue.ToString());

            dt = XLDL.GetData("select * from San_Pham S inner join San_Pham_Image I on S.Ma_SP = I.MaSP where S.Ma_SP = '" + maSP + "' and Position = 0");
            lbTenSP.Text = dt.Rows[0]["TenSP"].ToString();
            lbConLai.Text =  dt.Rows[0]["SoLuong"].ToString();
            DG = int.Parse(dt.Rows[0]["DonGia"].ToString());
            lbDonGia.Text = String.Format("{0:0,00}₫", DG);
            img = "/Image/San_Pham/" + dt.Rows[0]["Image"].ToString() + ".jpg";
            lbImage.ImageUrl = img;
            lbCamKet.Text = "<ul>CAM KẾT CỦA VƯƠNG QUỐC SON MÔI" +
                "<li>BẢO ĐẢM HÀNG CHẤT LƯỢNG CHÍNH HÃNG 100 %</li>" +
                "<li>DATE MỚI NHẤT</li>" +
                "<li>GIAO HÀNG NHANH NHẤT</li>" +
                "<li>PHỤC VỤ ĐẾN KHI KHÁCH HÀNG HÀI LÒNG</li>" +
                "<li>30 NGÀY BAO NGÀY ĐỔI TRẢ, HOÀN TIỀN 100 % NẾU KHÔNG ĐÚNG CHẤT LƯỢNG.</li>" +
                "</ul>";
            try
            {
                dt2 = XLDL.GetData("select * from BinhLuan where Ma_SP = '" + maSP + "'");
                foreach (DataRow dr in dt2.Rows)
                {
                    sao += float.Parse(dr["DanhGia"].ToString());
                }
                sao /= dt2.Rows.Count;
                if(sao > 0)
                    lbSao.Text = sao.ToString("0.0");

                String ngoisao = "<img src='Image/icon_Star.png' style='width: 10px; height: 10px;'/>";
                dt2.Columns.Add("IMG", typeof(string));
                for (int j = 0; j < dt2.Rows.Count; j++)
                {
                    String lb1 = "";
                    for (int i = 0; i < int.Parse(dt2.Rows[j]["DanhGia"].ToString()); i++)
                    {
                        lb1 += ngoisao;
                    }
                    dt2.Rows[j]["IMG"] = lb1;
                }

                dtBLMax.DataSource = dt2;
                dtBLMax.DataBind();

                DataTable dt3 = XLDL.GetData("select Top 3 * from BinhLuan where Ma_SP = '" + maSP + "' and DanhGia > 3");

                dtcmt.DataSource = dt3;
                dtcmt.DataBind();
            }
            catch
            {

            }
            
        }

        protected void btnMua_Click(object sender, EventArgs e)
        {
            GH();
            Response.Redirect("Cart_Shopping.aspx");
        }

        public void GH()
        {
            DataTable dt = new DataTable();
            maSP = Request.QueryString["MaSP"].ToString();
            dt = XLDL.GetData("select Ma_SP,TenSP,DonGia,Image from San_Pham inner join San_Pham_Image on Ma_SP = MaSP where Ma_SP= '" + maSP + "' and Position = 0 ");
            string TenSP = dt.Rows[0][1].ToString();
            float DonGia = float.Parse(dt.Rows[0][2].ToString());
            String Image = "/Image/San_Pham/" + dt.Rows[0][3].ToString() + ".jpg";
            int SoLuong = int.Parse(txtSL.Text);
            ThemVaoGioHang(maSP, TenSP, DonGia, SoLuong, Image);
        }

        protected void btnTVG_Click(object sender, EventArgs e)
        {
            GH();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        public void ThemVaoGioHang(String MaSP, string TenSP, float DonGia, int SoLuong, String Image)
        {
            DataTable dt;
            if (Session["Giohang"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("Image");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("ThanhTien");
            }
            else
                dt = (DataTable)Session["Giohang"];

            int dong = SPDaCoTrongGioHang(MaSP, dt);
            if (dong != -1)
            {
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
            }
            else
            {
                DataRow dr = dt.NewRow();
                dr["MaSP"] = MaSP;
                dr["TenSP"] = TenSP;
                dr["Image"] = Image;
                dr["DonGia"] = DonGia;
                dr["SoLuong"] = SoLuong;
                dr["ThanhTien"] = DonGia * SoLuong;
                dt.Rows.Add(dr);
            }
            Session["Giohang"] = dt;
        }

        public static int SPDaCoTrongGioHang(String MaSP, DataTable dt)
        {
            int dong = -1;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (String.Compare(dt.Rows[i]["MaSP"].ToString(), MaSP, true) == 0)
                {
                    dong = i;
                    break;
                }
            }
            return dong;
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            String binhluan;
            binhluan = txtCmt.InnerText;
            String datetime = DateTime.Now.ToString();
            if (Session["TaiKhoan"] == null)
            {
                Response.Write("<script>alert('Bạn phải đăng nhập trước khi bình luận!')</script>");
            }
            else
            {
                DataTable check = new DataTable();
                check = XLDL.GetData("select * from BinhLuan where TaiKhoan = '" + Session["TaiKhoan"].ToString() + "' and Ma_SP = '" + maSP + "'");
                if (check.Rows.Count == 1)
                {
                    String sql_update = "UPDATE BinhLuan" +
                        " SET NgayGio = '" + datetime + "', NoiDung =N'" + binhluan + "', DanhGia =" + danhgia +
                        " WHERE TaiKhoan = '" + Session["TaiKhoan"].ToString() + "' and Ma_SP = '" + maSP + "'";
                    XLDL.GetData(sql_update);
                }
                else
                {
                    try
                    {
                        String sql = "insert into BinhLuan(NgayGio,Ma_SP,TaiKhoan,NoiDung,DanhGia) values" +
                            "('" + datetime + "'" +
                            ",'" + maSP + "'" +
                            ",'" + Session["TaiKhoan"].ToString() + "'" +
                            ",N'" + binhluan + "'" +
                            "," + danhgia + ")";
                        XLDL.GetData(sql);
                        
                    }
                    catch
                    {
                        Response.Write("<script>alert('Gửi thất bại!')</script>");
                    }
                }
                Response.Write("<script>alert('Gửi thành công!')</script>");
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            danhgia = int.Parse(radlist.SelectedValue.ToString());
        }
    }
}
