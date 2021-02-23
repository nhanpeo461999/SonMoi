<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLy_LienHe.aspx.cs" Inherits="Lipstick_World.QuanLy_LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="CK/ckeditor/ckeditor.js"></script>
    <style>
        .btnSua{
            padding: 10px 0px;
            width: 10%;
            margin: 20px 45%;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-style:solid;
            border-color: black;
        }
        .btnSua:hover{
            background-color: black;
            color: snow;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="LienHe">
        <textarea class="ckeditor" id="txtLienHe" cols="20" rows="2" runat="server"></textarea>
        <asp:Button CssClass="btnSua" ID="btnSua" runat="server" Text="Sửa" OnClick="btnSua_Click" />
    </div>
    
</asp:Content>
