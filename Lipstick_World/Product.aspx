<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Lipstick_World.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .sanpham>fieldset>.ImgProduct{
            height: 200px;
            width: 100%;
        }
        .TitleProduct{
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="SP_Content">
        <h1><asp:Label ID="lbLoaiSP" runat="server" Text="Label"></asp:Label></h1>
        <h2>(<asp:Label ID="lbSoLuong" runat="server" Text="Label"></asp:Label> sản phẩm)</h2>
        <asp:DataList ID="dtSP" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="dtSP_ItemCommand">
            <ItemTemplate>
                <div class="sanpham">
                    <fieldset>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl='<%# "~/Image/San_Pham/"+Eval("Image") + ".jpg" %>' NavigateUrl='<%# "Product_Des.aspx?MaSP="+Eval("Ma_SP") %>'>HyperLink</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Product_Des.aspx?MaSP="+Eval("Ma_SP") %>' Text='<%# Eval("TenSP") %>'></asp:HyperLink>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DonGia", "{0:0,00 vnđ}") %>'></asp:Label>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Ma_SP") %>' CommandName="enter"><i class="icon_cart"></i></asp:LinkButton>
                        </div>
                    </fieldset>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
