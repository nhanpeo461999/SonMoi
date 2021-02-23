using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Admin_ucMenu : System.Web.UI.UserControl
    {

        private String s1, s2, s3, s4, s5;
        private int n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0;

        protected void Button1_Click(object sender, EventArgs e)
        {
            getThang();                             
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            getNam();
        }

        private String thang, nam;

        protected void charTuan_Click(object sender, EventArgs e)
        {
            getTuan();
        }

        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getTuan();
            }
            getTaiKhoan();
            getDonHang();
            getTinNhan();
        }

        private void getTuan()
        {
            n1 = n2 = n3 = n4 = n5 = 0;
            s1 = s2 = s3 = s4 = s5 = "";
            dt = XLDL.GetData("select top 5 * from San_Pham order by DaBan desc");

            title.Value = "Top 5 sẩn phẩm bán chạy nhất";

            if (dt.Rows.Count > 0)
            {
                s1 = dt.Rows[0]["Ma_SP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
            }
            if (dt.Rows.Count > 1)
            {
                s1 = dt.Rows[0]["Ma_SP"].ToString();
                s2 = dt.Rows[1]["Ma_SP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
            }
            if (dt.Rows.Count > 2)
            {
                s1 = dt.Rows[0]["Ma_SP"].ToString();
                s2 = dt.Rows[1]["Ma_SP"].ToString();
                s3 = dt.Rows[2]["Ma_SP"].ToString();

                n1 = int.Parse(dt.Rows[0]["DaBan"].ToString());
                n2 = int.Parse(dt.Rows[1]["Daban"].ToString());
                n3 = int.Parse(dt.Rows[2]["Daban"].ToString());
            }

            if (dt.Rows.Count > 3)
            {
                s1 = dt.Rows[0]["Ma_SP"].ToString();
                s2 = dt.Rows[1]["Ma_SP"].ToString();
                s3 = dt.Rows[2]["Ma_SP"].ToString();
                s4 = dt.Rows[3]["Ma_SP"].ToString();

                n1 = int.Parse(dt.Rows[0]["Daban"].ToString());
                n2 = int.Parse(dt.Rows[1]["Daban"].ToString());
                n3 = int.Parse(dt.Rows[2]["Daban"].ToString());
                n4 = int.Parse(dt.Rows[3]["Daban"].ToString());
            }
            if (dt.Rows.Count > 4)
            {
                s1 = dt.Rows[0]["Ma_SP"].ToString();
                s2 = dt.Rows[1]["Ma_SP"].ToString();
                s3 = dt.Rows[2]["Ma_SP"].ToString();
                s4 = dt.Rows[3]["Ma_SP"].ToString();
                s5 = dt.Rows[4]["Ma_SP"].ToString();

                n1 = int.Parse(dt.Rows[0]["Daban"].ToString());
                n2 = int.Parse(dt.Rows[1]["Daban"].ToString());
                n3 = int.Parse(dt.Rows[2]["Daban"].ToString());
                n4 = int.Parse(dt.Rows[3]["Daban"].ToString());
                n5 = int.Parse(dt.Rows[4]["Daban"].ToString());
            }

            setText();

        }

        private void getNam()
        {
            n1 = n2 = n3 = n4 = n5 = 0;
            s1 = s2 = s3 = s4 = s5 = "";
            nam = DateTime.Now.Year.ToString();
            dt = XLDL.GetData("select top 5 C.MaSP, sum(C.SoLuong) as SoLuong from DonDatHang D join CT_DonHang C on D.MaDH = C.MaDH " +
                " where YEAR(NgayDatHang) = '" + nam + "' group by C.MaSP order by SoLuong desc");
            
            title.Value = "Top 5 sẩn phẩm bán chạy nhất năm";

            if (dt.Rows.Count > 0)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
            }
            if (dt.Rows.Count > 1)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
            }
            if (dt.Rows.Count > 2)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();
                s3 = dt.Rows[2]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
                n3 = int.Parse(dt.Rows[2]["SoLuong"].ToString());
            }

            if (dt.Rows.Count > 3)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();
                s3 = dt.Rows[2]["MaSP"].ToString();
                s4 = dt.Rows[3]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
                n3 = int.Parse(dt.Rows[2]["SoLuong"].ToString());
                n4 = int.Parse(dt.Rows[3]["SoLuong"].ToString());

            }
            if (dt.Rows.Count > 4)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();
                s3 = dt.Rows[2]["MaSP"].ToString();
                s4 = dt.Rows[3]["MaSP"].ToString();
                s5 = dt.Rows[4]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
                n3 = int.Parse(dt.Rows[2]["SoLuong"].ToString());
                n4 = int.Parse(dt.Rows[3]["SoLuong"].ToString());
                n5 = int.Parse(dt.Rows[4]["SoLuong"].ToString());
            }

            setText();
        }

        private void getThang()
        {
            n1 = n2 = n3 = n4 = n5 = 0;
            s1 = s2 = s3 = s4 = s5 = "";
            nam = DateTime.Now.Year.ToString();
            thang = DateTime.Now.Month.ToString();
            dt = XLDL.GetData("select top 5 C.MaSP, sum(C.SoLuong) as SoLuong from DonDatHang D join CT_DonHang C on D.MaDH = C.MaDH " +
                " where YEAR(NgayDatHang) = '" + nam + "' and MONTH(NgayDatHang) = '" +thang+"' group by C.MaSP order by SoLuong desc");
            //lbTest.Text = dt.Rows[0]["NgayDatHang"].ToString();
            title.Value = "Top 5 sẩn phẩm bán chạy nhất tháng";

            if (dt.Rows.Count > 0)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
            }
            if (dt.Rows.Count > 1)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
            }
            if (dt.Rows.Count > 2)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();
                s3 = dt.Rows[2]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
                n3 = int.Parse(dt.Rows[2]["SoLuong"].ToString());
            }

            if (dt.Rows.Count > 3)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();
                s3 = dt.Rows[2]["MaSP"].ToString();
                s4 = dt.Rows[3]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
                n3 = int.Parse(dt.Rows[2]["SoLuong"].ToString());
                n4 = int.Parse(dt.Rows[3]["SoLuong"].ToString());

            }
            if (dt.Rows.Count > 4)
            {
                s1 = dt.Rows[0]["MaSP"].ToString();
                s2 = dt.Rows[1]["MaSP"].ToString();
                s3 = dt.Rows[2]["MaSP"].ToString();
                s4 = dt.Rows[3]["MaSP"].ToString();
                s5 = dt.Rows[4]["MaSP"].ToString();

                n1 = int.Parse(dt.Rows[0]["SoLuong"].ToString());
                n2 = int.Parse(dt.Rows[1]["SoLuong"].ToString());
                n3 = int.Parse(dt.Rows[2]["SoLuong"].ToString());
                n4 = int.Parse(dt.Rows[3]["SoLuong"].ToString());
                n5 = int.Parse(dt.Rows[4]["SoLuong"].ToString());
            }

            setText();
        }

        private void setText()
        {
            num1.Value = n1.ToString();
            num2.Value = n2.ToString();
            num3.Value = n3.ToString();
            num4.Value = n4.ToString();
            num5.Value = n5.ToString();

            sp1.Value = s1.ToString();
            sp2.Value = s2.ToString();
            sp3.Value = s3.ToString();
            sp4.Value = s4.ToString();
            sp5.Value = s5.ToString();
        }

        private void getTaiKhoan()
        {
            int admin = 0, khachhang = 0;
            String sql = "select * from KhachHang";
            DataTable taikhoan = XLDL.GetData(sql);
            foreach(DataRow dr in taikhoan.Rows)
            {
                if (int.Parse(dr["Admin"].ToString()) == 1)
                    admin++;
                else
                    khachhang++;
            }
            lbad.Text = admin.ToString();
            lbkh.Text = khachhang.ToString();
        }

        private void getDonHang()
        {
            String sql_DH = "select * from DonDatHang where TrangThai = 0";
            DataTable donhang = XLDL.GetData(sql_DH);
            lbDH.Text = "(" + donhang.Rows.Count.ToString() + ")";
        }

        private void getTinNhan()
        {
            String sql_TN = "select * from ThongTinLienHe where DaDuyet = 0";
            DataTable tinnhan = XLDL.GetData(sql_TN);
            lbTN.Text = "(" + tinnhan.Rows.Count.ToString() + ")";
        }
    }
}