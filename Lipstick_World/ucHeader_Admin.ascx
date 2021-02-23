<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHeader_Admin.ascx.cs" Inherits="Lipstick_World.Admin.ucHeader_Admin" %>
<header>
    <div id="dn">
        <div id="dn_L">
            <img src="Image/icon_phone_dn_L.png" />
            <p>HOT LINE: 0938.9999xxx</p>
        </div>
        <div id="dn_R">
            <div id class="dropdown">
                <a><img src="Image/icon_account.png"></img></a>
                <div class="dropdown-content">
                    <a href="#" runat="server"><asp:Label ID="lbTK" runat="server" Text="Tài Khoản"></asp:Label></a>
                    <a id="aDN" href="../Login.aspx"><asp:Label ID="lbDN" runat="server" Text="Đăng nhập"></asp:Label></a>
                    <br />
                    <asp:LinkButton ID="lbDX" runat="server" OnClick="aDX_Click">Đăng xuất</asp:LinkButton>
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
    </div>            
    <div id="menu">
        <div class="mnu_dropdown"><a href="Default_Admin.aspx">Trang chủ</a></div>
        <div class="mnu_dropdown"><a href="QuanLy_SP.aspx">Quản lý sản phẩm</a></div>
        <div class="mnu_dropdown"><a href="QuanLyKH.aspx">Quản lý khách hàng</a></div>
        <div class="mnu_dropdown"><a href="Admin_TinNhan.aspx">Tin nhắn(<asp:Label ID="lbTN" runat="server" Text="0"></asp:Label>)</a></div>
        <div class="mnu_dropdown"><a href="QuanLy_LienHe.aspx">Thông tin liên hệ</a></div>
    </div>
</header>