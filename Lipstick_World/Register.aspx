<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Lipstick_World.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/form_ver03.css" rel="stylesheet" />
    <style>
        .error{
            color: red;
            font-size: 15px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login">
        <h2>Đăng Ký</h2>
          <div class="imgcontainer">
            <img src="Image/logo.png" alt="Avatar" class="avatar">
          </div>      
          <div class="container">
            <label  for="uname" ><b>Họ và tên</b></label>
            <input id="txtHoten" runat="server" type="text" name="uname">
            
            <label for="uname"><b>Giới tính</b></label>
            <asp:RadioButtonList ID="radGioiTinh" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0" Selected="True">Nam</asp:ListItem>
                <asp:ListItem Value="1">Nữ</asp:ListItem>
              </asp:RadioButtonList>
            <label  for="uname" ><b>Email</b></label>
            <input id="txtEmail" runat="server" type="text" name="uname">
            <label  for="uname" ><b>Địa chỉ</b></label>
            <input id="txtDiachi" runat="server" type="text" name="uname">
            <label  for="uname" ><b>Số điện thoại</b></label>
            <input id="txtSdt" runat="server" type="text" name="uname">
            <label  for="uname" ><b>Tài khoản</b></label>
            <input id="txtTK" runat="server" type="text" name="uname">
            
            <label for="psw"><b>Mật khẩu</b></label>
            <input id="txtMK" runat="server" type="password" name="psw">
            <label for="psw"><b>Nhập lại mật khẩu</b></label>
            <input id="txtNLMK" runat="server" type="password" name="psw">
            
            <div id="center">
                <asp:Button ID="btnDN" CssClass="button" runat="server" Text="Xác nhận" OnClick="btnDN_Click" />
                <asp:Button ID="btnHB" CssClass="button" runat="server" Text="Hủy bỏ" />
            </div>
            <label>
              <input type="checkbox" checked="checked" name="remember"> Nhớ mật khẩu
            </label>
          </div>

          <div class="container" style="background-color:#f1f1f1">
              <asp:Label ID="lbError" runat="server" Text="Error" Visible="False"></asp:Label>
            <span class="psw"><a href="#">Quên mật khẩu?</a></span>
          </div>
    </div>
</asp:Content>
