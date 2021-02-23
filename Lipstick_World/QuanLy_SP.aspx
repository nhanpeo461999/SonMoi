<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLy_SP.aspx.cs" Inherits="Lipstick_World.QuanLy_SP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <style type="text/css">
        div#QL{
            margin-bottom:50px;
        }
        .khungQL{
            color: black;
            text-align:center;
            width: 100%;
            font-size: 20px;
        }
        .themmoi{
            color:black;
            margin-left: 87%;
            font-size: 18px;
        }
        .themmoi:hover{
            text-decoration:underline;
            color:red;
        }
        h1{
            text-align:center;
        }
        .row_gv{
            height: 50px;
        }

        .row_ft{
            text-align: center;
            height: 20px;
            font-size: 15px;
            color: red;
            border-top: solid red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="QL">
        <h1>DANH SÁCH SẢN PHẨM</h1>
        <asp:HyperLink CssClass="themmoi" ID="HyperLink1" runat="server" NavigateUrl="~/QuanLySP_add.aspx">Thêm mới</asp:HyperLink>
        <asp:GridView CssClass="khungQL" ID="gvFG" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="Ma_SP" OnPageIndexChanging="gvFG_PageIndexChanging" OnRowCommand="gvFG_RowCommand">
            <Columns>
                <asp:BoundField DataField="Ma_SP" HeaderText="Mã SP" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên" />
                <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" />
                <asp:BoundField DataField="SoLuong" HeaderText="Còn lại" />
                <asp:BoundField DataField="DaBan" HeaderText="Bán" />
                <asp:BoundField DataField="GiamGia" HeaderText="Giảm giá" />
                <asp:BoundField DataField="MSX" HeaderText="Nhà sản xuất" />
                <asp:BoundField DataField="NgayNhapHang" HeaderText="Ngày nhập" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "QuanLySP_edit?maSP=" + Eval("Ma_SP") %>' Text='<%# ("Sửa") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField ButtonType="Button" CommandName="Xoa" HeaderText="Xóa" Text="X">
                <ControlStyle BackColor="#ffffff" BorderStyle="None" ForeColor="Red" />
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#ffcccc" Font-Bold="True" ForeColor="Black" />
            <RowStyle  CssClass="row_gv"/>
            <PagerStyle CssClass="row_ft" />
        </asp:GridView>
    </div>
</asp:Content>
