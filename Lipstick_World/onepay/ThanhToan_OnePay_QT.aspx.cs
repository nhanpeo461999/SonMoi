using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2;

namespace Lipstick_World.onepay
{
    public partial class ThanhToan_OnePay_QT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string SECURE_SECRET = OnepayQuocTeCode.SECURE_SECRET;//Hòa: cần thay bằng mã thật từ app_code          
            string hashvalidateResult = "";
            // Khoi tao lop thu vien
            VPCRequest conn = new VPCRequest("http://onepay.vn");
            conn.SetSecureSecret(SECURE_SECRET);
            // Xu ly tham so tra ve va kiem tra chuoi du lieu ma hoa
            hashvalidateResult = conn.Process3PartyResponse(Request.QueryString);

            // Lay gia tri tham so tra ve tu cong thanh toan
            String vpc_TxnResponseCode = conn.GetResultField("vpc_TxnResponseCode", "Unknown");
            string amount = conn.GetResultField("vpc_Amount", "Unknown");
            string localed = conn.GetResultField("vpc_Locale", "Unknown");
            string command = conn.GetResultField("vpc_Command", "Unknown");
            string version = conn.GetResultField("vpc_Version", "Unknown");
            string cardType = conn.GetResultField("vpc_Card", "Unknown");
            string orderInfo = conn.GetResultField("vpc_OrderInfo", "Unknown");
            string merchantID = conn.GetResultField("vpc_Merchant", "Unknown");
            string authorizeID = conn.GetResultField("vpc_AuthorizeId", "Unknown");
            string merchTxnRef = conn.GetResultField("vpc_MerchTxnRef", "Unknown");
            string transactionNo = conn.GetResultField("vpc_TransactionNo", "Unknown");
            string acqResponseCode = conn.GetResultField("vpc_AcqResponseCode", "Unknown");
            string txnResponseCode = vpc_TxnResponseCode;
            string message = conn.GetResultField("vpc_Message", "Unknown");

            System.Decimal TongThanhTien = 0;
            String hoten, sdt, diachi, tinh, quan, maDH, datetime, email;

            DataTable dt = new DataTable();
            DataTable info = new DataTable();

            // Sua lai ham check chuoi ma hoa du lieu            
            if (hashvalidateResult == "CORRECTED" && txnResponseCode.Trim() == "0")
            {
                //vpc_Result.Text = "Transaction was paid successful";
                
                dt = (DataTable)Session["GioHang"];
                info = (DataTable)Session["info"];
                hoten = info.Rows[0]["hoten"].ToString();
                sdt = info.Rows[0]["sdt"].ToString();
                maDH = info.Rows[0]["maDH"].ToString();
                TongThanhTien = int.Parse(info.Rows[0]["TongThanhTien"].ToString());
                datetime = info.Rows[0]["datetime"].ToString();
                email = info.Rows[0]["email"].ToString();
                diachi = info.Rows[0]["diachi"].ToString();

                XuLyDonHang.getDonDatHang(3, sdt, hoten, maDH, TongThanhTien, datetime, dt, email, diachi, 0);

                #region xử lý mail
                
                string smtpUserName = "soncucdep@gmail.com";
                string smtpPassword = "Thythy1234";
                string smtpHost = "smtp.gmail.com";
                int smtpPort = 25;

                string emailTo = email;
                string subject = "Vương quốc son môi - thanh toán quốc tế";
                string body = string.Format("Xin chào, " + email + Environment.NewLine +
                    "\n Số tiền bạn đã thanh toán: " + String.Format("{0:0,00}₫", TongThanhTien) + ":" + Environment.NewLine +
                    "\n Bạn đã thanh toán đơn hàng bằng hình thức thanh toán quốc tế thành công! Đơn hàng đang chờ được duyệt" + Environment.NewLine +
                    "\n Cảm ơn bạn đã sử dụng dịch vụ của Vương quốc son môi!" + Environment.NewLine +
                    "\n Chúc bạn có thêm nhiều niềm vui với bưu phẩm của mình <3");

                MailUtils service = new MailUtils();
                bool kq = service.Send(smtpUserName, smtpPassword, smtpHost, smtpPort, emailTo, subject, body);
                #endregion

                Session["Giohang"] = null;
                Session["info"] = null;
                Response.Write("<div class='result'>Đã thanh toán thành công</div>");
            }
            else if (hashvalidateResult == "INVALIDATED" && txnResponseCode.Trim() == "0")
            {
                //vpc_Result.Text = "Transaction is pending";
                //Response.Write("Error description : " + message + "<br/>");
                Response.Write("<div class='result'>Thanh toán đang chờ</div>");
            }
            else
            {
                //vpc_Result.Text = "Transaction was not paid successful";
                //Response.Write("Error description : " + message + "<br/>");
                Response.Write("<div class='result'>Thanh toán không thành công</div>");
            }

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "", "Redirect('" + TatThanhJsc.Website.URL.WebisteUrl + "', 6);", true);
        }
    }
}