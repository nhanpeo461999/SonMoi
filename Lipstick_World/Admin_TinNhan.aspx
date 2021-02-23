<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_TinNhan.aspx.cs" Inherits="Lipstick_World.Admin_TinNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .TN{
            width: 100%;
        }

        .TinCD{
            width: 98%;
            padding: 0 1%;
            height: 320px;
            overflow-y:scroll;
        }

        .TN h1{
            font-size: 25px;
            text-align: center;
        }
       
        .table_ver01{
            width: 100%;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TN">
        <h1>Danh sách tin nhắn chưa được duyệt</h1>
        <div class="TinCD">
            <asp:GridView CssClass="table_ver01" ID="gvDSLH" runat="server" AutoGenerateColumns="False" DataKeyNames="id_LienHe" OnSelectedIndexChanged="gvDSLH_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" />
                    <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                
                    <asp:TemplateField HeaderText="Câu hỏi">
                        <ItemTemplate>
                            <p style="width: 500px; word-wrap:break-word;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("CauHoi") %>'></asp:Label></p>
                        </ItemTemplate>
                        <ItemStyle Width="20px" Wrap="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Trả lời">
                        <ItemTemplate>
                            <asp:TextBox ID="txtTraLoi" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField Text="Xác nhận">
                    <ControlStyle ForeColor="#0033CC" />
                    </asp:ButtonField>
                </Columns>
                <HeaderStyle BackColor="#ffcccc" Font-Bold="True" ForeColor="Black" Wrap="True" />
            </asp:GridView>
        </div>
        <div>
          
        </div>
    </div>
</asp:Content>
