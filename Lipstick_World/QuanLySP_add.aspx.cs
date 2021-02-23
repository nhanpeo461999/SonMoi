using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class QuanLySP_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getMG();
            txtNgay.Text = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
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

        protected void btThem_Click(object sender, EventArgs e)
        {
            try
            {
                String sql = "INSERT INTO San_Pham (TenSP, DonGia, SoLuong, GiamGia, MSX, NgayNhapHang,MoTa)" +
                    "VALUES('" + txtTenSP.Text +
                    "', '" + txtDonGia.Text +
                    "', '" + txtConLai.Text +
                    "', '" + txtMaGiamGia.Text +
                    "', '" + ddlMaMSX.SelectedItem.Value +
                    "', '" + txtNgay.Text +
                    "', '" + txtMoTa.InnerText + "')";
                XLDL.GetData(sql);
                Response.Write("<script><alert('Thêm thành công!!')/script>");
            }
            catch
            {
                Response.Write("<script><alert('Thêm thất bại!!')/script>");
            }
        }
    }
}