<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Lipstick_World.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .order_content{
            width: 100%;
            float: left;
            padding-bottom: 50px;
        }
        .order_left{
            float:left;
            width: 50%;
            padding: 0 2%;
        }
        .order_left h6{
            font-size: 30px;
            padding: 0;
            margin: 0;
        }
        .order_form{
            float: left;
            width: 100%;
        }
        .order_form>div#left, .order_form>div#right{
            width: 48%;
            height: 60px;
        }
        .order_form>div#left{
            float: left;
        }
        .order_form>div#right{
            float:right;
        }
        .order_form input[type=text], input[type=password],.order_form input[type=text],.order_form input[type=email], input[type=number], .left_r input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .txt_info{
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        #center {
            float: left;
            width: 100%;
            text-align: center;
        }
        .button {
            color: snow;
            padding: 10px 18px;
            margin: 8px 5px;
            border: none;
            cursor: pointer;
            margin: 2% 5%;
            height: 50px;
            border-radius: 5px;
        }
        #center .button{
            width: 25%;
            background-color: black;
        }
        .right_r .button{
            width: 100%;
            background-color: #878787;
        }
        .button:hover {
            opacity: 0.8;
        }
        .order_right{
            float: left;
            width: 40%;
            padding-bottom: 10px;
        }
        .sale{

        }
        .sale > .left_r{
            float: left;
            width: 85%;
        }
        .sale > .right_r{
            float: right;
            width: 15%;
        }
        .order_right > .line{
            float: left;
            width: 100%;
            margin: 15px 0;
        }
        .order_right table{
            text-align: center;
            width: 100%;
        }
        .order_right table tr{

        }
        .order_right table tr td{
            width: 33%;
        }
        .img_Logo{
            width: 80px;
            height: 70px;
        }
        .img_Logo2{
            width: 80px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order_content">
        <h6>Vương Quốc Son Môi</h6>
        <div class="order_left">
            
            <div class="order_form">
                <label for="psw"><b>Tài khoản</b></label> <a id="id_DN" style="text-decoration:underline; color:#0650ff" href="Login.aspx" runat="server">Đăng nhập</a>
                <input id="txtHT" runat="server" type="text" disabled name="psw">
                <label for="psw"><b>Email</b></label>
                <input id="txtEM" runat="server" type="email" placeholder="Nhập Email" name="psw">
                <label for="psw"><b>Số điện thoại</b></label>
                <input id="txtSDT" runat="server" type="text" placeholder="Nhập số điện thoại" name="psw">
                <label for="psw"><b>Địa chỉ</b></label>
                <input id="txtDC" runat="server" type="text" placeholder="Nhập địa chỉ" name="psw">
                <div id="left">
                    <label for="psw"><b>Tỉnh/Thành</b></label>
                    <input id="txtTinhThanh" runat="server" type="text" placeholder="Nhập tỉnh/thành" name="psw">    
                </div>
                <div id="right">
                    <label for="psw"><b>Quận/huyện</b></label>
                    <input id="txtQuanHuyen" runat="server" type="text" placeholder="Nhập quận/huyện" name="psw">
                </div>
            </div>
            <div id="center">
                <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="Đồng ý" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCart" CssClass="button" runat="server" Text="Quay lại giỏ hàng" />
            </div>
        </div>
        <div class="order_right">
            <table>
                <tr style="font-weight: bold">
                    <td>Sản phẩm</td>
                    <td>Đơn giá</td>
                    <td>Số lượng</td>
                </tr>
            </table>
            <asp:DataList ID="dt_Cart" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td><asp:Label ID="lbTenSP" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label></td>
                            <td><asp:Label ID="lbDonGia" runat="server" Text='<%# Eval("DonGia") %>'></asp:Label></td>
                            <td><asp:Label ID="lbSoLuong" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <hr class="line" />
            <div class="sale">
                <div class="left_r">
                    <input id="txtMGG" runat="server" type="text" placeholder="Mã giảm giá" name="psw">    
                </div>
                <div class="right_r">
                    <input id="btnSuDung" class="button" runat="server" type="submit" value="Sử dụng" name="psw" /> 
                </div>
            </div>
            <hr class="line" />
            <div class="sale">
                <div class="left_r">
                    <label for="psw"><b>Phí vận chuyển</b></label>
                </div>
                <div class="right_r">
                    <asp:Label ID="lbPhiVanChuyen" runat="server" Text="-"></asp:Label>
                </div>
            </div>
            <hr class="line"/>
            <div class="sale">
                <div class="left_r">
                    <label for="psw"><b>Tổng cộng</b></label>
                </div>
                <div class="right_r">
                    <asp:Label ID="lbTongCong" runat="server" Text="0"></asp:Label>
                </div>
            </div>
            <div>
                <asp:RadioButtonList ID="radTT" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                    <asp:ListItem Value="0" Selected="True">
                        <img class="img_Logo" src="Image/logo_Momo.png" alt="" />
                    </asp:ListItem>
                    <asp:ListItem Value="1">
                        <img class="img_Logo2" src="Image/ATM.png" alt="" />
                    </asp:ListItem>
                    <asp:ListItem Value="2">
                        <img class="img_Logo2" src="Image/visa.png" alt="" />
                    </asp:ListItem>
                    <asp:ListItem Value="3"><div style="display:inline;">Thanh toán sau khi nhận hàng</div></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
</asp:Content>
