using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lipstick_World
{
    public partial class LienHe : System.Web.UI.Page
    {

        RSAManager rsa = new RSAManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadAdmin();
           
            try
            {
                
                String sql = "select * from TrangLienHe";
                DataTable dt = new DataTable();
                dt = XLDL.GetData(sql);
                lbLienHe.InnerHtml = dt.Rows[0]["TrangLienHe"].ToString();
                if (Session["TaiKhoan"] != null)
                {
                    DataTable dtKH = new DataTable();
                    dtKH = XLDL.GetData("select * from KhachHang where TaiKhoan = '" + Session["TaiKhoan"].ToString() + "'");
                    txtTK.Value = dtKH.Rows[0]["HoTen"].ToString();
                    txtEmail.Value = dtKH.Rows[0]["Email"].ToString();
                    txtSDT.Value = dtKH.Rows[0]["SoDienThoai"].ToString();
                }
            }
            catch
            {
                lbLienHe.InnerText = "Trang đang cập nhật, bạn vui lòng quay lại sau!";
            }

            
            
        }

        private void loadAdmin()
        {
            DataTable dt = new DataTable();
            dt = XLDL.GetData("select * from KhachHang where Admin = 1");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlAdmin.Items.Add("i");
                ddlAdmin.Items[i].Text = dt.Rows[i]["HoTen"].ToString();
                ddlAdmin.Items[i].Value = dt.Rows[i]["TaiKhoan"].ToString();
            }
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            
            rsa.GenerateNewKeys(2048);
            String username = txtTK.Value;
            String email = txtEmail.Value;
            String phone = txtSDT.Value;
            String question = rsa.EncryptWithPublic(txtCauHoi.InnerText.Trim());//txtCauHoi.InnerText.Trim();
            rsa.rsaCrypto.ToXmlString(false);
            String privateKey = rsa.rsaCrypto.ToXmlString(true);

            try
            {
                String sql_insert;
                String sql_update;
                String sql;
                DataTable dt = new DataTable();
                
                //Xử lý bảng ThongTinLienHe: thêm câu hỏi, thông tin liên hệ của người dùng vào bảng ThongTinLienHe
                sql_insert = "INSERT INTO ThongTinLienHe (Email, SDT, HoTen, DaDuyet, CauHoi, admin, PriKey) VALUES" +
                        "('" + email +
                        "','" + phone +
                        "',N'" + username +
                        "', 0" +
                        ",N'" + question +
                        "','" + ddlAdmin.SelectedItem.Value+
                        "','"+privateKey+"')";
                XLDL.GetData(sql_insert);
  
                // Xử lý bảng CauHoi: nếu đã có tăng sl lên 1, nếu chưa thì thêm vào.
                sql = "select * from CauHoi where CauHoi = N'" + question + "'";
                dt = XLDL.GetData(sql);
                if (dt.Rows.Count > 0)
                {
                    int count = int.Parse(dt.Rows[0]["soluong"].ToString());

                    count++;
                    sql_update = "UPDATE CauHoi" +
                        " SET soluong = " + count +
                        " WHERE Ma_CauHoi = " + int.Parse(dt.Rows[0]["Ma_CauHoi"].ToString());
                    XLDL.GetData(sql_update);
                }
                else
                {
                    int id_TTLH;
                    DataTable TTLH = XLDL.GetData("select id_LienHe from ThongTinLienHe" +
                        " where CauHoi = N'" + question + "'" +
                        " and Email = '" + email + "'" +
                        " and DaDuyet = 0");
                    id_TTLH = int.Parse(TTLH.Rows[0]["id_LienHe"].ToString());
                    sql_update = "INSERT INTO CauHoi (id, CauHoi, soluong) VALUES" +
                    "('" + id_TTLH +
                    "',N'" + question +
                    "',1)";
                    XLDL.GetData(sql_update);
                }
                Response.Write("<script>alert('Gửi tin thành công, cảm ơn bạn đã liên hệ với shop. " +
                    "Shop sẽ trả lời bạn sớm nhất có thể!')</script>");
                Response.Redirect("Default.aspx");
            }
            catch
            {
                Response.Write("<script><alert('Thất bại!')</script>");
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            
        }
    }
}