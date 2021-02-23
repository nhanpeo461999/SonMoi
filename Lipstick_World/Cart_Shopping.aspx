<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Cart_Shopping.aspx.cs" Inherits="Lipstick_World.Cart_Shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Cart_Shopping{
            margin: 10px 10%;
            width: 80%;
            float: left;
        }
        .cart_content{
            float: left;
            padding-bottom: 20px;
            padding-right: 2%;
            width: 65%;
        }
        .cart_content>h1{
            font-size: 20px;
            font-weight: normal;
        }
        .cotOne, .cotTwo, .cotThree, .cotImage{
            height: 100px;
            padding: 10px;
        }
        .cotImage{
            width: 100px;
        }
        .cotThree{
            width: 15%;
        }
        .cotTwo{
            width: 10%;
        }
        .cotOne{
            width: 35%;
        }
        .gvCart{
            text-align: center;
            width: 100%;
        }
        .bill_content{
            width: 33%;
            float: left;
        }
        .bill_content > fieldset {
            margin-bottom: 20px;
            padding: 15px;
            border-color: rgb(243, 232, 232);
        }
        .bill_content>fieldset.khung{
            background-color: rgb(90, 87, 87);
            color: snow;
            border: none;
            font-size: 12px;
        }
        .bill_content>fieldset.khung>ul{
            margin:0px;
            padding: 0px 30px;
            list-style: square;
        }
        .bill_content>fieldset.khung>ul>li{
            margin: 7px 0;
        }
        .bill_content>fieldset>div.Left{
            float: left;
            font-weight: bold;
            font-size: 20px;
            color: rgb(90, 87, 87);
        }
        .bill_content>fieldset>div.right{
            float: right;
            color: darkred;
            font-size: 25px;
        }
        .btnThanhToan{
            float: left;
            margin: 5%;
            padding: 5% 10%;
            width: 90%;
            background-color: red;
            font-weight: bold;
            color: snow;
            border-color: rgba(0, 0, 0, 0.00);
            box-shadow: 3px 3px snow, 6px 6px red;
        }
        .btnThanhToan:hover{
            background-color: indianred;
            box-shadow: 3px 3px snow, 6px 6px indianred;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Cart_Shopping">
        <div class="cart_content">
            <h1>Giỏ hàng</h1>
            <asp:GridView CssClass="gvCart" ID="gvCart" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvCart_SelectedIndexChanged" OnRowCommand="gvCart_RowCommand">
                <Columns>
                    <asp:ImageField ControlStyle-CssClass="cotImage" DataImageUrlField="Image" HeaderText="Sản phẩm" >
<ControlStyle CssClass="cotImage"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField ControlStyle-CssClass="cotOne" HeaderText="Thông tin sản phẩm" DataField="TenSP" >
<ControlStyle CssClass="cotOne"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-CssClass="cotThree" HeaderText="Đơn giá" DataField="DonGia" >
<ControlStyle CssClass="cotThree"></ControlStyle>
                    </asp:BoundField>
                    <asp:TemplateField ControlStyle-CssClass="cotThree" HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label>
                        </ItemTemplate>

<ControlStyle CssClass="cotThree"></ControlStyle>
                    </asp:TemplateField>
                    <asp:BoundField ControlStyle-CssClass="cotThree" HeaderText="Thành tiền" DataField="ThanhTien" >
<ControlStyle CssClass="cotThree"></ControlStyle>
                    </asp:BoundField>
                    <asp:ButtonField ControlStyle-CssClass="cotTwo" CommandName="Xoa" Text="X">
                    <ControlStyle ForeColor="Red" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="bill_content">
            <p>ĐƠN HÀNG</p>
            <fieldset>
                <div class="Left">Tổng tiền</div>
                <div class="right"><asp:Label ID="lbTongTien" runat="server" Text="0"></asp:Label></div>
                <asp:Button CssClass="btnThanhToan" ID="btnTT" runat="server" Text="THANH TOÁN" OnClick="btnTT_Click" />
            </fieldset>
            <fieldset class="khung">
                <ul>
                    <li>Thời gian giao hàng từ 3 - 5 ngày làm việc</li>
                    <li>Đổi trả trong vòng 90 ngày</li>
                    <li>Miễn phí giao hàng toàn quốc</li>
                    <li>Thanh toán khi nhận hàng/Thanh toán online</li>
                </ul>
            </fieldset>
        </div>
    </div>
 <h1 style="text-align:center">Sản phẩm đang chờ giao hàng</h1>
    <div style="text-align:center; width: 100%; margin-left: 200px;">
        
        <asp:GridView ID="gvDGH" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" Width="32px" Height="32px" runat="server" ImageUrl='<%# "~/Image/San_Pham/"+Eval("Image") + ".jpg" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt hàng" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
