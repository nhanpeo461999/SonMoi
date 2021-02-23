<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLySP_edit.aspx.cs" Inherits="Lipstick_World.QuanLySP_edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div#QLsuaSP{
            padding: 0 20%;
            margin-bottom:30px;
        }
        div#QLsuaSP>fieldset{
            width: 1100px;
            margin-left: 100px;
            border:none;
        }
        .QLaddnut{
            border-radius: 7px;
            width:70px;
            height:30px;
        }
        h1{
            text-align: center;
        }
    </style>    <style type="text/css">
        div#QLsuaSP{
            padding: 0 20%;
            margin-bottom:30px;
        }
        div#QLsuaSP>fieldset{
            width: 1100px;
            margin-left: 100px;
            border:none;
        }
        .QLaddnut{
            border-radius: 7px;
            width:70px;
            height:30px;
        }
        h1{
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="QLsuaSP">
        <h1>Sửa sản phẩm</h1>
        <fieldset>
            <table style="width: 100%;">
                <tr>
                    <td>Tên</td>
                    <td><asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Đơn giá</td>
                    <td><asp:TextBox ID="txtDonGia" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Số lượng</td>
                    <td><asp:TextBox ID="txtConLai" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Giảm giá</td>
                    <td><asp:TextBox ID="txtMaGiamGia" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mã sản xuất</td>
                    <td><asp:DropDownList ID="ddlMaMSX" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Ngày nhập</td>
                    <td><asp:TextBox ID="txtNgay" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Hình</td>
                    <td><asp:FileUpload ID="fileHMH" runat="server" /></td>
                </tr>
                <tr>
                    <td>Mô tả</td>
                    <td><textarea id="txtMoTa" runat="server" class="ckeditor"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><asp:Button CssClass="QLaddnut" ID="btDongY" runat="server" Text="Đồng ý" OnClick="btThem_Click" /></td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
