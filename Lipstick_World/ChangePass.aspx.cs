using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class ChangePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void checkEmail()
        {
            String sql = "select * from KhachHang where TaiKhoan = '" + txtTK.Value
                + "' and Email = '" + txtEM.Value + "'";
            DataTable dt = new DataTable();
            dt = XLDL.GetData(sql);
            if(dt.Rows.Count < 1)
            {
                lbError.Text = "Kiểm tra tài khoản và email bạn nhập chính xác chưa!";
            }
            else
            {
                using (SmtpClient client = new SmtpClient ("smtp.gmail.com")) {
                    client.Port = 587;
                    // Tạo xác thực bằng địa chỉ gmail và password
                    client.Credentials = new NetworkCredential ("nhanpeo4619999@gmail.com", "Chet123456");
                    client.EnableSsl = true;
                }
                
            }
        }

        protected void btnDN_Click(object sender, EventArgs e)
        {
           
        }
    }
}