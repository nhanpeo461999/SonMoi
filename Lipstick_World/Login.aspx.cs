using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbError.Visible = false;
        }

        protected void btnDN_Click1(object sender, EventArgs e)
        {
            try
            {
                DataTable data = new DataTable();
                String sql = "select * from KhachHang where TaiKhoan = '" + txtTK.Value + "' and MaKhau = '" + getMD5.GetMD5(txtPW.Value) + "'";
                data = XLDL.GetData(sql);
                if (data.Rows.Count > 0)
                {
                    if (int.Parse(data.Rows[0]["Admin"].ToString()) == 1)
                    {
                        Session["Admin"] = data.Rows[0]["TaiKhoan"].ToString();
                        Response.Redirect("Default_Admin.aspx");
                    }
                    else
                    {
                        Session["TaiKhoan"] = data.Rows[0]["TaiKhoan"].ToString();
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    lbError.Text = "Sai mật khẩu";
                    lbError.Visible = true;
                    lbError.ForeColor = Color.Red;
                }
            }
            catch
            {
                lbError.Text = "Đăng nhập thất bại";
                lbError.Visible = true;
                lbError.ForeColor = Color.Red;
            }
                
        }
    }
}