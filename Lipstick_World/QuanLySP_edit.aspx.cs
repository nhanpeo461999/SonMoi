using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class QuanLySP_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                getSP();
            
        }

        private void getMG()
        {
            DataTable dt = new DataTable();
            dt = XLDL.GetData("select MSX,HanSanXuat from Hang_San_Xuat");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlMaMSX.Items.Add("i");
                ddlMaMSX.Items[i].Text = dt.Rows[i][1].ToString();
                ddlMaMSX.Items[i].Value = dt.Rows[i][0].ToString();
            }
        }

        private void getSP()
        {
            String maSP = Request.QueryString["MaSP"].ToString();
            DataTable dt = new DataTable();
            getMG();
            dt = XLDL.GetData("select * from San_Pham where Ma_SP ='" + maSP +"'");
            txtTenSP.Text = dt.Rows[0]["TenSP"].ToString();
            txtNgay.Text = dt.Rows[0]["NgayNhapHang"].ToString();
            txtConLai.Text = dt.Rows[0]["SoLuong"].ToString();
            txtMoTa.InnerText = dt.Rows[0]["MoTa"].ToString();
            txtMaGiamGia.Text = dt.Rows[0]["GiamGia"].ToString();
            ddlMaMSX.SelectedValue = dt.Rows[0]["MSX"].ToString();
            txtDonGia.Text = dt.Rows[0]["DonGia"].ToString();
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            try
            {
                String maSP = Request.QueryString["MaSP"].ToString();
                XLDL.Execute("update San_Pham set TenSP = '" + txtTenSP.Text + "',DonGia='" + txtDonGia.Text + "',SoLuong='" + txtConLai.Text + "',GiamGia='" + txtMaGiamGia.Text + "',MSX='" + ddlMaMSX.SelectedItem.Value + "',NgayNhapHang='" + txtNgay.Text + "',MoTa='" + txtMoTa.InnerText + "' where Ma_SP ='" + maSP+"'");
                Response.Write("<script>alert('Sửa thành công!')</script>");
            }
            catch
            {
                Response.Write("<script>alert('Sửa thất bại!')</script>");
            }
        }
    }
}