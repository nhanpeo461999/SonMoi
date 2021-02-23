<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Lipstick_World.UC.Header" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script src="https://code.jquery.com/jquery-1.12.2.js" ></script>
<script src="Scripts/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="Scripts/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />

<header>
    <div id="dn">
        <div id="dn_L">
            <img src="Image/icon_phone_dn_L.png" />
            <p>HOT LINE: 0938.9999xxx</p>
        </div>
        <div id="dn_M">Hỗ Trợ 24/7</div>
        <div id="dn_R">
            <div class="dropdown">
                <a><img src="Image/icon_account.png" /></a>
                <div class="dropdown-content">
                    <a href="#" runat="server"><asp:Label ID="lbTK" runat="server" Text="Tài Khoản"></asp:Label></a>
                    <a id="aDN" href="../Login.aspx"><asp:Label ID="lbDN" runat="server" Text="Đăng nhập"></asp:Label></a>
                    <a id="aDK" href="../Register.aspx"><asp:Label ID="lbDK" runat="server" Text="Đăng ký"></asp:Label></a>
                    <a id="aTT" href="../Order.aspx"><asp:Label ID="lbTT" runat="server" Text="Thanh toán"></asp:Label></a>
                    <a id="aGH" href="../Cart_Shopping.aspx"><asp:Label ID="lbGH" runat="server" Text="Giỏ hàng"></asp:Label></a>
                    <br />
                    <asp:LinkButton ID="lbDX" runat="server" OnClick="aDX_Click">Đăng xuất</asp:LinkButton>
                </div>
            </div>
            <p>|</p>
            <div class="dropdown">
                <a>
                    <img src="Image/icon_cart.png"/>
                    &nbsp;
                    <asp:Label ID="lbSLSP" runat="server" Text="0"></asp:Label>
                </a>
                <div class="dropdown-content">
                    <fieldset>
                        <p>Hiện chưa có sản phẩm</p>
                        <hr style="border:dashed; border-width: 1px; border-color: lightgrey;" />
                        <p>Tổng tiền: <asp:Label ID="lbTongTien" runat="server" Text="0"></asp:Label></p>
                        <div id="btn_header">
                            <asp:Button CssClass="XemGioHang" ID="btn_XemGioHang" runat="server" Text="XEM GIỎ HÀNG" OnClick="btn_XemGioHang_Click" />
                            <asp:Button CssClass="ThanhToan" ID="btn_ThanhToan" runat="server" Text="THANH TOÁN" OnClick="btn_ThanhToan_Click" />
                        </div>
                    </fieldset>
                </div>
            </div>
                    
        </div>
    </div>

    <div id="logo">
        <div id="icon">
            <fieldset>
                <a href="#"><img src="Image/icon_twitter_0.png" onmouseover="this.src='Image/icon_twitter_1.png';" onmouseout="this.src='Image/icon_twitter_0.png';"/></a>
                <a href="https://www.facebook.com/iamthyy"><img src="Image/icon_fb_0.png" onmouseover="this.src='Image/icon_fb_1.png';" onmouseout="this.src='Image/icon_fb_0.png';"/></a>
                <a href="#"><img src="Image/icon_gg_0.png" onmouseover="this.src='Image/icon_gg_1.png';" onmouseout="this.src='Image/icon_gg_0.png';"/></a>
                <a href="https://www.youtube.com/channel/UCHoutIwnC-AbzDPepKz7xyA/featured"><img src="Image/icon_yt_0.png" onmouseover="this.src='Image/icon_yt_1.png';" onmouseout="this.src='Image/icon_yt_0.png';"/></a>
            </fieldset>
        </div>
        <div id="logo_shop">
            <a href="#"><img src="Image/logo.png"/></a>
        </div>
        <div>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#Header_txtTimKiem').autocomplete({
                        source: 'Search.ashx'
                    });
                });
            </script>
            <asp:ScriptManager EnablePageMethods="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:TextBox CssClass="txt_timkiem" ID="txtTimKiem" runat="server"></asp:TextBox>
            <asp:ImageButton CssClass="btn_timkiem" ID="ImageButton1" runat="server" ImageUrl="~/Image/search.png" OnClick="ImageButton1_Click" />
            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtTimKiem" WatermarkText="Nhập từ khóa" />
        </div>
            
    </div>
                 
    <div id="menu">
        <div class="mnu_dropdown"><a href="../Default.aspx">Trang chủ</a></div>
        <div class="mnu_dropdown">
            <a href="#">Sản phẩm</a>
            <div class="mnu_dropdown_content">
                <asp:DataList ID="dtMenuSP" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Product.aspx?maSX="+Eval("MSX") %>' Text='<%# Eval("HanSanXuat") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:DataList>


            </div>
        </div>
        <div class="mnu_dropdown"><a href="#">Chăm sóc khách hàng</a></div>
        <div class="mnu_dropdown"><a href="#">Giới thiệu</a></div>
        <div class="mnu_dropdown"><a href="../LienHe.aspx">Liên hệ</a></div>
    </div>
</header>