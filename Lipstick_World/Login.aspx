<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lipstick_World.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/form_ver03.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login">
        <h2>Đăng Nhập</h2>
          <div class="imgcontainer">
            <img src="Image/logo.png" alt="Avatar" class="avatar">
          </div>      
          <div class="container">
            <label  for="uname" ><b>Tài khoản</b></label>
            <input id="txtTK" runat="server" type="text" placeholder="Nhập tài khoản" name="uname" required>

            <label for="psw"><b>Mật khẩu</b></label>
            <input id="txtPW" runat="server" type="password" placeholder="Nhập mật khẩu" name="psw" required>
            <div id="center">
                <asp:Button ID="btnDN" CssClass="button" runat="server" Text="Đăng nhập" OnClick="btnDN_Click1"/>
                <asp:Button ID="btnHB" CssClass="button" runat="server" Text="Hủy bỏ" />
            </div>
            <label>
              <input type="checkbox" checked="checked" name="remember"> Nhớ mật khẩu
            </label>
          </div>

          <div class="container" style="background-color:#f1f1f1">
              <asp:Label ID="lbError" runat="server" Text="Error"></asp:Label>
            <span class="psw"><a href="#">Quên mật khẩu?</a></span>
          </div>
    </div>
</asp:Content>
