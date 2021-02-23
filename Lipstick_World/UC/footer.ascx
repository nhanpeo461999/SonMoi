<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="Lipstick_World.UC.footer" %>
 <footer>
            <div id="ft_first">
                <a href="#"><i class="icon_tw" style="font-style: normal;"></i></a>
                <a href="#"><i class="icon_fb" style="font-style: normal;"></i></a>
                <a href="#"><i class="icon_gg" style="font-style: normal;"></i></a>
                <a href="#"><i class="icon_yt" style="font-style: normal;"></i></a>
                <div class="btn_email">
                    <input class="email" id="txtEmail" runat="server" type="email" placeholder="nhập email của bạn"/>
                    <asp:Button CssClass="btnGui" ID="Button1" runat="server" Text="Gửi" OnClick="Button1_Click" />
                </div>
            </div>
            <div id="ft_last">
                <div id="ft_last_first">
                    <div id="ft_lf_left">
                        <a href="#"><img src="Image/logo.png" /></a>
                        <p>|</p>
                        <div id="ft_lf_right">
                            <p>Vương Quốc Son Môi - Nơi Bán Son Môi Cao Cấp Chính Hãng 100%. Đến Với Vương Quốc Son Môi Qúy Khách Hàng Hoàn Toàn Yên Tâm Khi Mua Son Môi Ở Đây.</p>
                        </div>
                    </div>
                </div>
                <hr />
                <div id="ft_last_last">
                    <div class="ft_last_title">
                        <h3>Liên hệ với chúng tôi</h3>
                    </div>
                    <div class="ft_last_title">
                        <h3>Thông tin hỗ trợ</h3>
                    </div>
                    <div class="ft_last_title">
                        <h3>Dịch vụ khách hàng</h3>
                    </div>
                    <div class="ft_last_title">
                        <h3>Facebook</h3>
                    </div>
                    <br />
                    <div class="ft_last_content">
                        <p><img src="Image/icon_ft_place.png" />: Địa chỉ</p>
                        <p><img src="Image/icon_ft_place.png" />: Địa chỉ</p>
                        <p><img src="Image/icon_ft_phone.png" /> Hot line: 0909 xxxxxxx</p>
                        <p><img src="Image/icon_ft_email.png" /> Email: <a style="color: deeppink" href="#">vuongquocsonmoi@gmail.com</a></p>
                    </div>
                    <div class="ft_last_content">
                        <p><a href="#">Hướng dẫn mua hàng</a></p>
                        <p><a href="#">Hình thức vận chuyển</a></p>
                        <p><a href="#">Chính sách đổi trả</a></p>
                        <p><a href="#">Điều khoản sử dụng</a></p>
                        <p><a href="#">Chính sách bảo mật</a></p>
                    </div>
                    <div class="ft_last_content">
                        <p><a href="#">Trang chủ</a></p>
                        <p><a href="#">Son môi</a></p>
                        <p><a href="#">Bộ quà tặng</a></p>
                        <p><a href="#">Liên hệ</a></p>
                    </div>
                    <div class="ft_last_content">
                    </div>
                </div>
            </div>
        </footer>