<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="Lipstick_World.TrangChu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vương quốc son môi</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link href="Scripts/slide.css" rel="stylesheet" />
    <script src="Scripts/slide.js"></script>
    <style>
        body{
            margin: 0px;
            padding: 0px;
        }
        a{
            text-decoration: none;
            color: black;
        }
        ul{
            list-style: none;
        }
        header{
            margin: 0px;
            padding: 0px;
        }

        #dn{
            background-color: gainsboro;
            width: 100%;
            padding-top: 15px;
            height: 30px;
            font-size: 15px;
        }

        #dn_L{
            display:inline;
            text-align:center;
            width: 20%;
            float: left;
        }

        #dn_L img{
            width: 12px;
            height: 12px;
            display: inline;
        }
        #dn_L p{
            display: inline;
        }

        #dn_M{
            width: 60%;
            display: inline;
            float: left;
            text-align:center;
            height: 20px;
        }
        #dn_R{
            float: right;
            text-align:right;
            width:20%;
            height: 20px;
            display: inline;
            text-align:center;
        }
        #dn_R > p{
            padding: 0 10px;
            display: inline;
        }
        #dn_R a img{
            display: inline;
            width: 20px;
            height: 15px;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right:0px;
            background-color: snow;
            min-width: 75px;
            box-shadow: 3px 3px 2px 2px #757575;
            padding: 5px 10px;
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a{
            display: block;
            text-decoration: none;
            text-align: right;
            color: black;
            margin: 5px 0px;
        }

        .dropdown-content a:hover{
            text-decoration: underline;
            color: orange;
        }

        .dropdown-content fieldset{
            width: 190PX;
            left:0px;
            border: none;
            text-align: left;
        }
        .dropdown-content span{
            float: right;
        }
        #btn_header{
            text-align: center;
        }
        .XemGioHang{
            background-color: snow;
            color: black;
            font-size: 10px;
            width: 48%;
            height: 20px;
        }
        .ThanhToan{
            background-color: black;
            color: snow;
            font-size: 10px;
            width: 48%;
            height: 20px;
        }
        .XemGioHang:hover, .ThanhToan:hover{
            font-weight:bold;
            border-width: medium;
        }
        #logo{
            width: 100%;
            padding-top: 15px;
            height: 50px;
            font-size: 15px;
        }
        #icon{
            display:inline;
            text-align:center;
            width: 20%;
            float: left;
        }
        #icon fieldset{
            padding: 0px;
            border-radius: 40px;
        }
        #icon img{
            padding-top: 3px;
            width: 25px;
            height: 25px;
        }
        #logo_shop{
            width: 60%;
            display: inline;
            font-size: 30px;
            float: left;
            text-align:center;
        }
        #logo_shop a{
            text-decoration: none;
            color: red;
        }
        #logo_shop img{
            height: 35px;
        }
        #search{
            padding-top: 13px;
            float: right;
            text-align: left;
            width:20%;
            display: inline;
        }
        .txt_timkiem{
            display:inline;
        }
        .btn_timkiem{
            display:inline;
            width: 15px;
            height: 15px;
        }
        #menu{
            text-align: center;
            font-size: 20px;
            width: 100%;
        }
        .mnu_dropdown {
            position: relative;
            display: inline-block;
        }
        .mnu_dropdown>a{
            padding: 10px 20px;
            display: block;
            border-bottom-right-radius: 8px;
            border-top-left-radius: 8px;
        }
        .mnu_dropdown>a:hover{
            background-color: orangered;
            box-shadow: 3px 3px 2px 2px rgba(0,0,0,0.2);
        }
        .mnu_dropdown_content {
            display: none;
            position: absolute;
            background-color: snow;
            min-width: 715px;
            left:-110px;
            box-shadow: 0px 3px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            text-align: left;
        }
        .mnu_dropdown:hover .mnu_dropdown_content {
            display: block;
        }
        .mnu_dropdown_content a{
            text-align:left;
            width: 15%;
            padding: 10px;
            display: inline-block;
        }
        .mnu_dropdown_content a:hover{
            color: orange;
            font-weight: bold;
        }
        #content{
            padding: 10px 0px;
            margin: 0px;
        }
        #left_menu{
            position: fixed;
            z-index: 1;
            right: 22px;
            top: 135px;
        }
        #left_menu > a{
            padding: 8px 0;
            display: block;
        }
        #left_menu > a >img{
            width: 45px;
            height: 45px;
            border-radius: 100px;
        }
        #sp_noibat{
            padding: 0px;
            margin: 0px;
        }
        #sp_noibat > h1{
            text-align: center;
            font-weight: unset;
            font-style: italic;
        }
        .sanpham{
            margin: 0px 100px;
        }
        .sanpham > fieldset{
            width: 17%;
            margin: 10px 30px;
            text-align: center;
            display: inline;
            border-color: rgba(0, 0, 0, 0.00);
            position: relative;
        }
        .sanpham > fieldset:hover{
            border-color: rgba(255, 149, 18, 0.77);
        }
        .sanpham > fieldset > a{
            text-align: center;
        }
        .sanpham > fieldset > a > img{
            height: 200px;
            width: 90%;
        }
        .sanpham > fieldset:hover>.icon_sp{
            font-family:'Font Awesome 5 Free';
            font-weight: 900;
            color:rgba(0, 0, 0, 0.00);
            font-size: 30px;
            position: absolute;
            right:20px;
            top:0;
        }
        .sanpham > fieldset:hover>.icon_sp>a{
            display: block;
            color: orange;
            margin-top: 10px;
            animation: mymove 2s infinite;
        }
        @keyframes mymove {
          50% {
            -webkit-filter: grayscale(100%); 
            filter: grayscale(100%);
          }
        }
        .sanpham > fieldset:hover>.icon_sp>a:hover{
            color: orangered;
        }
        .sanpham > fieldset:hover>.icon_sp>a>.icon_search::before{
            content:'\f002';
        }
        .sanpham > fieldset:hover>.icon_sp>a>.icon_eye::before{
            content:'\f06e';
        }
        .sanpham > fieldset:hover>.icon_sp>a>.icon_cart::before{
            content:'\f07a';
        }
        .PhanLoai{
            height: 400px;
            width: 100%;
        }
        .PhanLoai>a{
            height:400px;
            width: 24%;
            opacity: 50%;
        }
        .PhanLoai>a:hover{
            opacity: 100%;
        }
        .loai_sp{
            height: 400px;
            width: 24%;
            display: inline;
        }
        .loai_sp>img{
            height: 400px;
            width: 24%;
        }
        footer{
            width: 100%;
            padding: 30px 0px 0px;
            margin: 0px;
        }
        #ft_first{
            width: 80%;
            padding: 15px 0px;
            margin-left: 10%;
        }
         #ft_first > a{
            margin-left: 6px;
            margin-top: 20px;
            color: rgb(33, 32, 32);
            font-size: 15px;
            padding: 15px 25px;
            border-left: none;
            font-family:'Font Awesome 5 Brands';
            box-shadow: 3px 3px 2px 2px rgba(0,0,0,0.2);
        }
        #ft_first>a:hover{
            color: snow;
            background-color: orange;
            border-color: orange;
            box-shadow: 3px 3px 2px 2px #fac46c;
        }
        .icon_tw::before{
            content:'\f099';
        }
        .icon_fb::before{
            content:'\f39e';
        }
        .icon_gg::before{
            content:'\f0d5';
        }
        .icon_yt::before{
            content:'\f167';
        }
        .btn_email{
            float: right;
        }
        .btn_email>a{
            padding: 15px 30px;
            font-style: italic;
            background-color: black;
            color: snow;
        }
        .btn_email>a:hover{
            color: black;
            background-color: orange;
        }
        .email{
            border-color: rgba(255, 250, 250, 0.00);
            font-size: 15px;
        }
        #ft_last{
            background-color: #e2e2e2;
            padding: 10px 0px;
            margin-top: 2px;
        }
        #ft_last_first{
            width: 100%;
            padding: 2px 0px;
        }
        #ft_lf_left{
            width: 100%;
        }
        #ft_lf_left>a>img{
            margin-left: 80px;
            height: 45px;
            width: 260px;
        }
        #ft_lf_left>p{
            display: inline;
            font-size: 50px;
            padding: 0px 20px;
            color: #bab9b9;
        }
        #ft_lf_right{
            width: 70%;
            float: right;
        }
        #ft_last_last{
            width: 100%;
            display: block;
        }
        .ft_last_title{
            display: inline-block;
            width: 23%;
            padding: 0px;
            height: 50px;
            margin: 0px 9px;
        }
        .ft_last_title>h3{
            margin-left: 70px;
            font-weight: 100;
            font-size: 20px;
            padding-bottom: 20px;
        }
        .ft_last_content{
            display: inline-block;
            width: 23%;
            padding: 0px;
            margin: 0px 9px;
        }
        .ft_last_content>p{
            font-size: 13px;
            margin-left: 70px;
            color: rgb(34, 34, 34);
        }
        .ft_last_content>p>img{
            width: 16px;
            height: 16px;
        }
        .ft_last_content>p>a{
            text-decoration: none;
        }
        .ft_last_content>p>a:hover{
            text-decoration: underline;
            color: orange;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="dn">
                <div id="dn_L">
                    <img src="Image/icon_phone_dn_L.png" />
                    <p>HOT LINE: 0938.9999xxx</p>
                </div>
                <div id="dn_M">Hỗ Trợ 24/7</div>
                <div id="dn_R">
                    <div id class="dropdown">
                        <a><img src="Image/icon_account.png"></img></a>
                        <div class="dropdown-content">
                            <a href="#">Đăng nhập</a>
                            <a href="#">Đăng ký</a>
                            <a href="#">Thanh toán</a>
                            <a href="#">Giỏ hàng</a>
                        </div>
                    </div>
                    <p>|</p>
                    <div class="dropdown">
                        <a><img src="Image/icon_cart.png"></img>&nbsp;0</a>
                        <div class="dropdown-content">
                            <fieldset>
                                <p>Hiện chưa có sản phẩm</p>
                                <hr style="border:dashed; border-width: 1px; border-color: lightgrey;" />
                                <p>Tổng tiền: <span>0vnđ</span></p>
                                <div id="btn_header">
                                    <asp:Button CssClass="XemGioHang" ID="btn_XemGioHang" runat="server" Text="XEM GIỎ HÀNG" />
                                    <asp:Button CssClass="ThanhToan" ID="btn_ThanhToan" runat="server" Text="THANH TOÁN" />
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
                        <a href="#"><img src="Image/icon_fb_0.png" onmouseover="this.src='Image/icon_fb_1.png';" onmouseout="this.src='Image/icon_fb_0.png';"/></a>
                        <a href="#"><img src="Image/icon_gg_0.png" onmouseover="this.src='Image/icon_gg_1.png';" onmouseout="this.src='Image/icon_gg_0.png';"/></a>
                        <a href="#"><img src="Image/icon_yt_0.png" onmouseover="this.src='Image/icon_yt_1.png';" onmouseout="this.src='Image/icon_yt_0.png';"/></a>
                    </fieldset>
                </div>
                <div id="logo_shop">
                    <a href="#"><img src="Image/logo.png"/></a>
                </div>
                <div id="search">
                    <asp:TextBox CssClass="txt_timkiem" ID="txtTimKiem" runat="server" TextMode="Search"></asp:TextBox>
                    <asp:ImageButton CssClass="btn_timkiem" ID="ImageButton1" runat="server" ImageUrl="~/Image/search.png" />
                </div>
            </div>
                 
            <div id="menu">
                <div class="mnu_dropdown"><a href="#">Trang chủ</a></div>
                <div class="mnu_dropdown">
                    <a href="#">Sản phẩm</a>
                    <div class="mnu_dropdown_content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                    </div>
                </div>
                <div class="mnu_dropdown"><a href="#">Chăm sóc khách hàng</a></div>
                <div class="mnu_dropdown"><a href="#">Giới thiệu</a></div>
                <div class="mnu_dropdown"><a href="#">Liên hệ</a></div>
                <div class="mnu_dropdown"><a href="#">Đăng nhập</a></div>
            </div>
            <div class="slideshow-container">

                <div class="mySlides fade" style="display:block;">
                    <div class="numbertext">1 / 5</div>
                    <img src="Image/slide_3.jpg" style="width:100%">
                    <div class="text">Mặt trời</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 5</div>
                    <img src="Image/slide_1.jpg" style="width:100%">
                    <div class="text">Đáng yêu</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 5</div>
                    <img src="Image/slide_2.jpg" style="width:100%">
                    <div class="text">Dễ thương</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">4 / 5</div>
                    <img src="Image/slide_4.jpg" style="width:100%">
                    <div class="text">Xinh đẹp</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">5 / 5</div>
                    <img src="Image/slide_5.jpg" style="width:100%">
                    <div class="text">00111001 120 45 00110111 105 62 00110011(51 01111000 00101101 55 01110101)</div>
                </div>

                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                </div>
                <br>

                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)"></span> 
                    <span class="dot" onclick="currentSlide(2)"></span> 
                    <span class="dot" onclick="currentSlide(3)"></span>
                    <span class="dot" onclick="currentSlide(4)"></span>
                    <span class="dot" onclick="currentSlide(5)"></span>
                </div>
        </header>
        <div id="content">
            <div id="left_menu">
                <a href="#"><img src="Image/icon_place.png" /></a>
                <a href="#"><img src="Image/icon_mail.png" /></a>
                <a href="#"><img src="Image/icon_mess.png" /></a>
                <a href="#"><img src="Image/icon_zalo.png" /></a>
                <a href="#"><img src="Image/icon_phone.png" /></a>
            </div>
            <div id="sp_noibat">
                <h1>Sản phẩm nổi bật</h1>
                <div class="sanpham">
                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>

                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>

                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>
                    
                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>

                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>

                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>

                    <fieldset>
                        <a href="#"><img src="Image/San_Pham/SA1_AL_00.jpg" /></a>
                        <br />
                        <a href="#">Tên sản phẩm</a>
                        <br />
                        <p>giá sp&nbsp;<span>vnđ</span></p>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <a href="#"><i class="icon_cart"></i></a>
                        </div>
                    </fieldset>
                </div>
                <div class="PhanLoai">
                    <a href="#">
                        <div class="loai_sp">
                             <img src="Image/loai_sp_01.jpg" />
                        </div>
                    </a>
                    <a href="#">
                        <div class="loai_sp">
                             <img src="Image/loai_sp_01.jpg" />
                        </div>
                    </a>
                    <a href="#">
                        <div class="loai_sp">
                             <img src="Image/loai_sp_01.jpg" />
                        </div>
                    </a>
                    <a href="#">
                        <div class="loai_sp">
                             <img src="Image/loai_sp_01.jpg" />
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <footer>
            <div id="ft_first">
                <a href="#"><i class="icon_tw" style="font-style: normal;"></i></a>
                <a href="#"><i class="icon_fb" style="font-style: normal;"></i></a>
                <a href="#"><i class="icon_gg" style="font-style: normal;"></i></a>
                <a href="#"><i class="icon_yt" style="font-style: normal;"></i></a>
                <div class="btn_email">
                    <input class="email" type="email" placeholder="nhập email của bạn"/>
                    <a href="#">Gửi</a>
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
    </form>
</body>
</html>
