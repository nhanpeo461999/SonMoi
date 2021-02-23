<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_DonHang.aspx.cs" Inherits="Lipstick_World.Admin_DonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .DH{
            width: 98%;
            margin: 0 1%;
            text-align: center;
        }
        .btn_duyet{
            color: black;
            padding: 10px;
        }
        .btn_duyet:hover{
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView CssClass="DH" ID="gvDH" runat="server" AutoGenerateColumns="False" DataKeyNames="MaDH" OnRowCommand="gvDH_RowCommand">
        <Columns>
            <asp:BoundField DataField="MaDH" HeaderText="Mã DH" />
            <asp:BoundField DataField="TaiKhoan" HeaderText="Tài khoản" />
            <asp:BoundField DataField="SDT" HeaderText="SDT" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt hàng" />
            <asp:BoundField DataField="NgayGiao" HeaderText="Ngày giao" />
            <asp:BoundField DataField="ThanhToan" HeaderText="Hình thức thanh toán" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
            <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" />
            <asp:BoundField DataField="Choduyet" HeaderText="Chờ duyệt" />
            <asp:ButtonField Text="✔" ControlStyle-CssClass="btn_duyet" CommandName="Duyet" >
<ControlStyle CssClass="btn_duyet"></ControlStyle>
            </asp:ButtonField>
        </Columns>
        <HeaderStyle BackColor="#ffcccc" Font-Bold="True" ForeColor="Black" />
    </asp:GridView>
</asp:Content>
