<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="Lipstick_World.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .LienHe{
            width: 100%;
        }
        .ThongTinND{
            margin: 0 20%;
            width: 60%;
        }
        .ThongTinND label{
            padding: 10px;
            text-align: left;
        }
        .ThongTinND input[type=text]{
            margin: 5px;
            padding: 10px 0;
            width: 600px;
        }
        .ThongTinND legend{
            text-align: left;
        }
        .btnGuiThongTin{
            padding: 10px 35px;
            text-align: center;
            color: snow;
            background-color: black;
            margin: 0 5px;
        }
        .btnGuiThongTin:hover{
            background-color: snow;
            color: black;
        }
    </style>
    <script src="CK/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="LienHe">
        <label id="lbLienHe" runat="server"></label>
    </div>
    <div class="ThongTinND">
        <fieldset>
            <legend>Nhập thông tin của bạn</legend>
            <table style="text-align:right; width: 100%;">
                <tr>
                    <td><label  for="uname" ><b>Họ tên</b></label></td>
                    <td><input id="txtTK" runat="server" type="text" placeholder="Nhập họ tên" name="uname"></td>
                </tr>
                <tr>
                    <td><label  for="uname" ><b>Email</b></label></td>
                    <td><input id="txtEmail" runat="server" type="text" placeholder="Nhập email" name="uname"></td>
                </tr>
                <tr>
                    <td><label  for="uname" ><b>Điện thoại</b></label></td>
                    <td><input id="txtSDT" runat="server" type="text" placeholder="Nhập số điện thoại" name="uname"></td>
                </tr>
                <tr>
                    <td><label  for="uname" ><b>Gửi tới</b></label></td>
                    <td>
                        <asp:DropDownList ID="ddlAdmin" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:left"><label  for="uname" ><b>Câu hỏi</b></label>
                    <textarea class="ckeditor" id="txtCauHoi" runat="server" cols="20" rows="2"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnGui" CssClass="btnGuiThongTin" runat="server" Text="Gửi" OnClick="btnGui_Click" />
                        <asp:Button ID="btnHuy" CssClass="btnGuiThongTin" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
