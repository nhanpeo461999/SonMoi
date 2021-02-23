<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SP_NoiBat.ascx.cs" Inherits="Lipstick_World.UC.content" %>
<style>
    .btn_ver01{
        width: 50px;
    }
    .btn_ver02{
        width: 80px;
    }
</style>
<div id="sp_noibat">
    <h1>Sản phẩm nổi bật</h1>
</div>
<div class="SP_Content">
    <asp:DataList ID="dtSPNB" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemDataBound="dtSPNB_ItemDataBound" OnSelectedIndexChanged="dtSPNB_SelectedIndexChanged" OnUpdateCommand="dtSPNB_UpdateCommand" OnItemCommand="dtSPNB_ItemCommand">
        <ItemTemplate>
            <div class="sanpham">
                <fieldset>
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl='<%# "~/Image/San_Pham/"+Eval("Image") + ".jpg" %>' NavigateUrl='<%# "~/Product_Des.aspx?MaSP="+Eval("Ma_SP") %>'>HyperLink</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Product_Des.aspx?MaSP="+Eval("Ma_SP") %>' Text='<%# Eval("TenSP") %>'></asp:HyperLink>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DonGia", "{0:0,00 vnđ}") %>'></asp:Label>
                    <asp:Label ID="lbMaSP" Visible="false" runat="server" Text='<%# Eval("Ma_SP") %>'></asp:Label>
                    <div class="icon_sp">
                        <a href="#"><i class="icon_eye"></i></a>
                        <a href="#"><i class="icon_search"></i></a>
                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Ma_SP") %>' CommandName="enter" runat="server" ><i class="icon_cart"></i></asp:LinkButton>
                    </div>
                </fieldset>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <div style="text-align:center">
        <asp:Button CssClass="btn_ver02" ID="btnFirst" runat="server" Text="Trang đầu" OnClick="btnFirst_Click" />
        <asp:Button CssClass="btn_ver01" ID="btnpre" runat="server" Text="Trước" OnClick="btnpre_Click" />
        <asp:TextBox ID="txtPage" Width="30px" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>/<asp:Label ID="txtMaxPage" runat="server"></asp:Label>
        <script type="text/javascript">
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }   
        </script>
        <asp:Button ID="Button1" runat="server" Text="Đi" OnClick="Button1_Click" />
        <asp:Button CssClass="btn_ver01" ID="btnnext" runat="server" Text="Sau" OnClick="btnnext_Click" />
        <asp:Button CssClass="btn_ver02" ID="btnLast" runat="server" Text="Trang cuối" OnClick="btnLast_Click" />
    </div>
   
</div>