using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2;

namespace Lipstick_World
{
    public partial class Order : System.Web.UI.Page
    {
        System.Decimal TongThanhTien = 0;
        String hoten, email, sdt, diachi, tinh, quan, maDH, datetime;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            maDH = Guid.NewGuid().ToString();
            Session["info"] = new object();
            dt = (DataTable)Session["Giohang"];
            
            if (Session["TaiKhoan"] != null)
            {
                hoten = Session["TaiKhoan"].ToString();
                DataTable Tk = XLDL.GetData("select * from KhachHang where TaiKhoan = '" + hoten + "'");
                if (!IsPostBack)
                {
                    txtDC.Value = Tk.Rows[0]["DiaChi"].ToString();
                    txtEM.Value = Tk.Rows[0]["Email"].ToString();
                    txtSDT.Value = Tk.Rows[0]["SodienThoai"].ToString();
                    txtHT.Value = hoten.ToString();
                }
                id_DN.Visible = false;
            }
            else
            {
                id_DN.Visible = true;
            }
            
            if (Session["Giohang"] != null)
            {
                dt_Cart.DataSource = dt;
                dt_Cart.DataBind();
                XuLyDonHang.getCart(dt, ref TongThanhTien);
                lbTongCong.Text = String.Format("{0:0,00}₫", int.Parse(TongThanhTien.ToString()));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int httt;
            checkDN();
            datetime = DateTime.Now.ToString();
            httt = Convert.ToInt32(radTT.SelectedItem.Value);

            #region lấy giá trị vào các thông tin info
            email = txtEM.Value;
            sdt = txtSDT.Value;
            diachi = txtDC.Value;
            #endregion

            #region tạo session thông tin khách hàng khi đặt hàng
            DataTable info = new DataTable();
            info.Columns.Add("sdt");
            info.Columns.Add("hoten");
            info.Columns.Add("maDH");
            info.Columns.Add("TongThanhTien");
            info.Columns.Add("datetime");
            info.Columns.Add("email");
            info.Columns.Add("diachi");

            info.Rows.Add();

            info.Rows[0]["sdt"] = sdt;
            info.Rows[0]["hoten"] = hoten;
            info.Rows[0]["maDH"] = maDH;
            info.Rows[0]["TongThanhTien"] = TongThanhTien;
            info.Rows[0]["datetime"] = datetime;
            info.Rows[0]["email"] = email;
            info.Rows[0]["diachi"] = diachi;

            Session["info"] = info;
            #endregion

            try
            {
                setMomo(httt);
                Response.Redirect("~/Default.aspx");
            }
            catch
            {
                
            }
            
        }

        void checkDN()
        {
            if (Session["TaiKhoan"] == null)
            {
                System.Threading.Thread.Sleep(3);
                Response.Redirect("~/Login.aspx");
            }
        }

        void setMomo(int httt)
        {
            if (httt == 0)
            {
                //request params need to request to MoMo system
                String Endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
                string endpoint = Endpoint.ToString().Equals("") ? "https://test-payment.momo.vn/gw_payment/transactionProcessor" : Endpoint.ToString();
                string partnerCode = "MOMOSGYC20201014";
                string accessKey = "T3WSXamh01G2JIFZ";
                string serectkey = "NrNTKthB262X4BgGjdVm8ej86tkl2eDC";
                string orderInfo = "Khách hàng: " + hoten + "\nSố điện thoại: " + sdt;
                string returnUrl = "https://localhost:44369/returnUrl";//"~/returnUrl.aspx";
                string notifyurl = "https://localhost:44369/notifyUrl";//"~/notifyUrl.aspx";

                string amount = TongThanhTien.ToString();
                string orderid = maDH;
                string requestId = Guid.NewGuid().ToString();
                string extraData = "nhanpeo4619999@gmail.com";

                //Before sign HMAC SHA256 signature
                string rawHash = "partnerCode=" +
                    partnerCode + "&accessKey=" +
                    accessKey + "&requestId=" +
                    requestId + "&amount=" +
                    amount + "&orderId=" +
                    orderid + "&orderInfo=" +
                    orderInfo + "&returnUrl=" +
                    returnUrl + "&notifyUrl=" +
                    notifyurl + "&extraData=" +
                    extraData;

                MoMoSecurity crypto = new MoMoSecurity();
                //sign signature SHA256
                string signature = crypto.signSHA256(rawHash, serectkey);

                //build body json request
                JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }
            };

                string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
                JObject jmessage = JObject.Parse(responseFromMomo);
                //System.Diagnostics.Process.Start(jmessage.GetValue("payUrl").ToString());
                Response.Redirect(jmessage.GetValue("payUrl").ToString());
            }
            else if(httt == 1)
            {
                #region //Xử lý one pay
                string SECURE_SECRET = OnepayCode.SECURE_SECRET;
                VPCRequest conn = new VPCRequest(OnepayCode.VPCRequest);
                conn.SetSecureSecret(SECURE_SECRET);

                conn.AddDigitalOrderField("Title", "onepay paygate");
                conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                conn.AddDigitalOrderField("vpc_Version", "2");
                conn.AddDigitalOrderField("vpc_Command", "pay");
                conn.AddDigitalOrderField("vpc_Merchant", OnepayCode.Merchant);//cần thanh bằng mã thật cấu hình trong app_code
                conn.AddDigitalOrderField("vpc_AccessCode", OnepayCode.AccessCode);//cần thanh bằng mã thật cấu hình trong app_code
                conn.AddDigitalOrderField("vpc_MerchTxnRef", maDH);//mã thanh toán
                conn.AddDigitalOrderField("vpc_OrderInfo", "Thông tin đơn hàng");//thông tin đơn hàng
                conn.AddDigitalOrderField("vpc_Amount", (TongThanhTien * 100).ToString());//chi phí cần nhân 100 theo yêu cầu của onepay
                conn.AddDigitalOrderField("vpc_Currency", "VND");
                conn.AddDigitalOrderField("vpc_ReturnURL", OnepayCode.ReturnURL);//địa chỉ nhận kết quả trả về
                                                                                 // Thong tin them ve khach hang. De trong neu khong co thong tin
                conn.AddDigitalOrderField("vpc_SHIP_Street01", "");
                conn.AddDigitalOrderField("vpc_SHIP_Provice", "");
                conn.AddDigitalOrderField("vpc_SHIP_City", "");
                conn.AddDigitalOrderField("vpc_SHIP_Country", "");
                conn.AddDigitalOrderField("vpc_Customer_Phone", "");
                conn.AddDigitalOrderField("vpc_Customer_Email", "");
                conn.AddDigitalOrderField("vpc_Customer_Id", "");
                // Dia chi IP cua khach hang
                conn.AddDigitalOrderField("vpc_TicketNo", Request.UserHostAddress);
                // Chuyen huong trinh duyet sang cong thanh toan
                String url = conn.Create3PartyQueryString();
                #endregion
                Response.Redirect(url);
                //Response.Write("<div class='result'>" + url + "-" + OnepayQuocTeCode.ReturnURL + "</div>");
            }
            else if(httt == 2)
            {
                string SECURE_SECRET1 = OnepayQuocTeCode.SECURE_SECRET;//cần thanh bằng mã thật cấu hình trong app_code; 
                                                                       // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
                VPCRequest conn1 = new VPCRequest(OnepayQuocTeCode.VPCRequest);//Cần thay bằng cổng thật
                conn1.SetSecureSecret(SECURE_SECRET1);
                // Add the Digital Order Fields for the functionality you wish to use
                // Core Transaction Fields
                conn1.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                conn1.AddDigitalOrderField("Title", "onepay paygate");
                conn1.AddDigitalOrderField("vpc_Locale", "en");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                conn1.AddDigitalOrderField("vpc_Version", "2");
                conn1.AddDigitalOrderField("vpc_Command", "pay");
                conn1.AddDigitalOrderField("vpc_Merchant", OnepayQuocTeCode.Merchant);//ần thanh bằng mã thật cấu hình trong app_code
                conn1.AddDigitalOrderField("vpc_AccessCode", OnepayQuocTeCode.AccessCode);//cần thanh bằng mã thật cấu hình trong app_code
                conn1.AddDigitalOrderField("vpc_MerchTxnRef", maDH);//mã thanh toán
                conn1.AddDigitalOrderField("vpc_OrderInfo", "Thông tin đơn hàng");//mã thanh toán
                conn1.AddDigitalOrderField("vpc_Amount", (TongThanhTien * 100).ToString());//chi phí cần nhân 100 theo yêu cầu của onepay

                conn1.AddDigitalOrderField("vpc_ReturnURL", OnepayQuocTeCode.ReturnURL);//địa chỉ nhận kết quả trả về
                                                                                        // Thong tin them ve khach hang. De trong neu khong co thong tin
                conn1.AddDigitalOrderField("vpc_SHIP_Street01", "");
                conn1.AddDigitalOrderField("vpc_SHIP_Provice", "");
                conn1.AddDigitalOrderField("vpc_SHIP_City", "");
                conn1.AddDigitalOrderField("vpc_SHIP_Country", "");
                conn1.AddDigitalOrderField("vpc_Customer_Phone", "");
                conn1.AddDigitalOrderField("vpc_Customer_Email", "");
                conn1.AddDigitalOrderField("vpc_Customer_Id", "");
                // Dia chi IP cua khach hang
                conn1.AddDigitalOrderField("vpc_TicketNo", Request.UserHostAddress);
                // Chuyen huong trinh duyet sang cong thanh toan
                String url1 = conn1.Create3PartyQueryString();
                Response.Redirect(url1);
            }
        }
    }

}

