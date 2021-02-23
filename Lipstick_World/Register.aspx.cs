using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Register : System.Web.UI.Page
    {
        private string hoten;
        private string diachi;
        private string taikhoan;
        private string matkhau;
        private string nlmk;
        private string email;
        private readonly string avatar;
        private string sdt;
        int gioitinh;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void getText()
        {
            hoten = txtHoten.Value;
            diachi = txtDiachi.Value;
            taikhoan = txtTK.Value;
            matkhau = txtMK.Value;
            nlmk = txtNLMK.Value;
            email = txtEmail.Value;
            sdt = txtSdt.Value;
            gioitinh = int.Parse(radGioiTinh.SelectedValue.ToString());
        }

        private int checkPass()
        {
            if(string.Compare(matkhau,nlmk,false) != 0)
            {
                lbError.Text = "Mật khẩu không khớp";
                txtNLMK.Focus();
                return 1;
            }
            return 0;
        }

        private int checkUser()
        {
            String sql_SelectTK = "select * from KhachHang where TaiKhoan = '" + taikhoan + "'";
            DataTable dt = new DataTable();
            try
            {
                dt = XLDL.GetData(sql_SelectTK);
                if(dt.Rows.Count > 0)
                {
                    lbError.Text = "Tài khoản đã tồn tại";
                    txtTK.Focus();
                    return 1;
                }
            }
            catch
            {
                return 1;
            }
            return 0;
        }

        private int checkEmail()
        {
            String sql_SelectEmail = "select * from KhachHang where Email = '" + email + "'";
            DataTable dt = new DataTable();
            try
            {
                dt = XLDL.GetData(sql_SelectEmail);
                if (dt.Rows.Count > 0)
                {
                    lbError.Text = "Email đã tồn tại";
                    txtEmail.Focus();
                    return 1;
                }
            }
            catch
            {
                return 1;
            }
            return 0;
        }

        private int checkSDT()
        {
            String sql_SelectEmail = "select * from KhachHang where SodienThoai = '" + sdt + "'";
            DataTable dt = new DataTable();
            try
            {
                dt = XLDL.GetData(sql_SelectEmail);
                if (dt.Rows.Count > 0)
                {
                    lbError.Text = "Số điện thoại đã sử dụng";
                    txtEmail.Focus();
                    return 1;
                }
            }
            catch
            {
                return 1;
            }
            return 0;
        }

        private void register()
        {
            String sql = "insert into KhachHang(HoTen,GioiTinh,DiaChi,TaiKhoan,MaKhau,Email,Xoa,Avarta,Sodienthoai,Admin) values" +
                "(N'" + hoten + "'" +
                "," + gioitinh +
                ",N'" + diachi + "'" +
                ",'" + taikhoan + "'" +
                ",'" + getMD5.GetMD5(matkhau) + "'" +
                ",'" + email + "'" +
                "," + 0 +
                ",'" + "not" + "'" +
                ",'" + sdt + "'" +
                ",0)";
            try
            {
                if(checkPass() == 1)
                {
                    lbError.Visible = true;
                }
                else if(checkEmail() == 1)
                {
                    lbError.Visible = true;
                }
                else if(checkUser() == 1)
                {
                    lbError.Visible = true;
                }
                else if (checkSDT() == 1)
                {
                    lbError.Visible = true;
                }
                else
                {
                    XLDL.GetData(sql);
                    lbError.Visible = false;
                    Response.Redirect("~/Login.aspx");
                }
            }
            catch
            {
                lbError.Text = "Đăng ký không thành công!";
                lbError.Visible = true;
            }
        }

        protected void btnDN_Click(object sender, EventArgs e)
        {
            getText();
            register();
        }
    }
}