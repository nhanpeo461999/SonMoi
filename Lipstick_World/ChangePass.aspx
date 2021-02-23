<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="Lipstick_World.ChangePass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/form_ver02.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login">
        <h2>Đăng Nhập</h2>
          <div class="imgcontainer">
            <img src="Image/logo.png" alt="Avatar" class="avatar">
          </div>      
          <div class="container">
            <label  for="uname" ><b>Tài khoản</b></label>
            <input id="txtTK" runat="server" type="text" placeholder="Nhập tài khoản" name="uname">

            <label for="psw"><b>Email</b></label>
            <input id="txtEM" runat="server" type="email" placeholder="Nhập email" name="psw">
            <div id="center">
                <asp:Button ID="btnDN" CssClass="button" runat="server" Text="Đăng nhập" OnClick="btnDN_Click" />
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
