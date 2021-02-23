<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="SP_Search.aspx.cs" Inherits="Lipstick_World.SP_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sp_noibat">
    <h1>Từ khóa: <asp:Label ID="lbTiTle" runat="server" Text="Label"></asp:Label></h1>
    </div>
    <div class="SP_Content">
        <asp:DataList ID="dtSPNB" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="sanpham">
                    <fieldset>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl='<%# "~/Image/San_Pham/"+Eval("Image") + ".jpg" %>' NavigateUrl='<%# "~/Product_Des.aspx?MaSP="+Eval("Ma_SP") %>'>HyperLink</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Product_Des.aspx?MaSP="+Eval("Ma_SP") %>' Text='<%# Eval("TenSP") %>'></asp:HyperLink>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DonGia", "{0:0,00 vnđ}") %>'></asp:Label>
                        <div class="icon_sp">
                            <a href="#"><i class="icon_eye"></i></a>
                            <a href="#"><i class="icon_search"></i></a>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="icon_cart"></i></asp:LinkButton>
                        </div>
                    </fieldset>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
