<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyKH.aspx.cs" Inherits="Lipstick_World.QuanLyKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div#QL{
            margin-bottom:50px;
        }
        .khungQL{
            color: black;
            text-align:center;
            width: 100%;
        }
        .themmoi{
            color:black;
            margin-left: 1050px;
            font-size:18px;
        }
        .themmoi:hover{
            text-decoration:underline;
            color:red;
        }
        h1{
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="QL">
        <h1>DANH SÁCH KHÁCH HÀNG</h1>
        <asp:GridView CssClass="khungQL" ID="gvFG" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="TaiKhoan" OnPageIndexChanging="gvFG_PageIndexChanging" OnRowCommand="gvFG_RowCommand" OnRowCancelingEdit="gvFG_RowCancelingEdit" OnRowEditing="gvFG_RowEditing" OnRowUpdating="gvFG_RowUpdating">
            <Columns>
                <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" />
                <asp:TemplateField HeaderText="Tài khoản">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("TaiKhoan") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mật khẩu">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaKhau") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Sodienthoai" HeaderText="Số điện thoại" />
                <asp:TemplateField HeaderText="lịch sử mua hàng">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "#" %>' Text='<%# ("chi tiết") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CancelText="Hủy" EditText="Sửa" HeaderText="Sửa" ShowEditButton="True" UpdateText="Lưu">
                </asp:CommandField>
                <asp:ButtonField ButtonType="Button" CommandName="Xoa" HeaderText="Xóa" Text="X">
                <ControlStyle BackColor="#ffffff" BorderStyle="None" ForeColor="Red" /> 
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#ffcccc" Font-Bold="True" ForeColor="Black" />
        </asp:GridView>
    </div>
</asp:Content>
