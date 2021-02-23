<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Product_Des.aspx.cs" Inherits="Lipstick_World.Product_Des" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tilteSP_ver01{
            font-size: 30px;
        }
        .btn_ver01{
            width: 150px;
            height: 50px;
            font-weight: bold;
            color: snow;
            background-color: darkorange;
            border-color: darkorange;
            border-radius: 5px;
        }
        .btn_ver01:hover{
            background-color: snow;
            color: darkorange;
        }
        .SoLuong_ver01{
            width: 50px;
        }
        .ConLai{
            font-size: 12px;
            font-weight: bold;
            font-style: italic;
        }
        .DonGia_ver01{
            font-weight: bold;
            font-size:40px;
        }
        .img_ver01{
            text-align: center;
            width: 100%;
            height: 40%;
        }
        .btn_SL_ver01{
            text-align: center;
            width: 25px;
        }
        .CamKet{
            
        }

        .cmt{
            width: 70%;
            padding: 0 15%;
        }
        .cmt label{
            font-weight: bold;
            font-size: 25px;
        }
        .cmt textarea{
            min-height: 100px;
            min-width: 100%;
            max-width: 100%;
        }
        .btn_BinhLuan{
            height: 30px;
            background-color: black;
            color: snow;
            border: none;
            font-size: 12px;
            margin-left: 92%;
        }
        .vote_ver01{
            width: 98%;
            padding: 0 1%;
            padding: 10px 15px;
        }
        .rad_Star{
            font-size: 10px;
        }
        .vote_ver01 img{
            width: 15px;
            height: 15px;
            padding-bottom: 5px;
        }
        .sao_title{
            padding-bottom: 7px;
            width: 20px;
            height: 20px;
        }
        .cmt2{
            padding: 0 13%;
            display: none;
        }
        .khungBL{
            text-align: center;
            background-color:aqua;
        }
        .khungBL fieldset{
            border-style:solid; 
            border-color: rgba(91, 91, 91, 0.26);
            width: 220px;
            margin: 5px 15px;
        }
        .khungBL fieldset .title_Bold{
            font-weight: bold;
        }
        .fs_BL{
            margin: 3px 0;
        }
        .date {
            margin-left: 55%;
            font-size: 12px;
            font-style: italic;
        }
        .khungBL fieldset fieldset{
            border-style:solid; 
            border-color: rgba(91, 91, 91, 0.26);
            background-color: snow;
            width: 170px;
            margin: 5px 15px;
            color: black;
            height: 100px;
            overflow-y: scroll;
        }
        .cmt3{
            text-align: center;
            display: block;
        }
        .DSBL{
            padding: 5px 15%;
            width: 70%;
            text-align: left;
            display: none;
        }
        .fs_BL{
            width: 790px;
        }
        .btnHT_AB{
            color: #0a59c6; 
            background-color:rgba(0, 0, 0, 0.00); 
            border: none;
            text-decoration: underline;
        }
        .btnHT_AB:hover{
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="SP_Content">
        <table style="margin: 0 15%; width: 70%; border: 1px solid;">
            <tr>
                <td style="width: 30%;" rowspan="4"><asp:Image CssClass="img_ver01" ID="lbImage" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label CssClass="tilteSP_ver01" ID="lbTenSP" runat="server" Text="Label"></asp:Label>
                    <div class="ConLai">(Còn lại: <asp:Label CssClass="ConLai" ID="lbConLai" runat="server" Text="Label"></asp:Label>)</div>
                    <br />
                    <div><asp:Label ID="lbSao" runat="server" Text="0" Font-Size="20px"></asp:Label><img class ="sao_title" src="Image/icon_Star.png" /></div>
                    <br />
                    <asp:Label CssClass="DonGia_ver01" ID="lbDonGia" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td style="width: 70%; ">Số lượng:
                    <input class="btn_SL_ver01" id="btnDev" type="button" onclick="devSL()" value="-" />
                    <asp:TextBox Width="30px" ID="txtSL" onkeypress="return isNumberKey(event)" runat="server">1</asp:TextBox>
                     <script type="text/javascript">
                         function subSL() {
                             var sl = document.getElementById("<%=txtSL.ClientID %>").value;
                             var max = document.getElementById("<%=lbConLai.ClientID %>").textContent;
                             if(max - sl > 0 )
                                document.getElementById("<%=txtSL.ClientID %>").value++;
                         }
                         function devSL() {
                             var a = document.getElementById("<%=txtSL.ClientID %>").value--;
                            if (a < 1)
                                document.getElementById("<%=txtSL.ClientID %>").value = 0;
                         }

                        function isNumberKey(evt) {
                            var charCode = (evt.which) ? evt.which : evt.keyCode;
                            var sl = document.getElementById("<%=txtSL.ClientID %>").value;
                            var max = document.getElementById("<%=lbConLai.ClientID %>").textContent;
                            

                            if (charCode > 31 && (charCode < 48 || charCode > 57))
                                return false;
                            if (max - sl * 10 < parseInt(String.fromCharCode(charCode))) {
                                
                                document.getElementById("<%=txtSL.ClientID %>").value = 100;
                                return false;
                            }
                            return true;
                         }
                     </script>
                    <input class="btn_SL_ver01" id="btnSub" type="button" onclick="subSL()" value="+" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnTVG" CssClass="btn_ver01" runat="server" Text="THÊM VÀO GIỎ" OnClick="btnTVG_Click" />
                    <asp:Button ID="btnMua" CssClass="btn_ver01" runat="server" Text="MUA NGAY" OnClick="btnMua_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color:snow;">
                    <asp:Label CssClass="CamKet" ID="lbCamKet" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <div class="cmt">
            <label>Nhận xét</label>
            <br />
            <textarea runat="server" placeholder="Nhập bình luận của bạn" id="txtCmt" cols="20" rows="2"></textarea>
            <div class="vote_ver01">
                <asp:RadioButtonList CssClass="rad_Star" ID="radlist" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="1">1<img src="Image/icon_Star.png" /></asp:ListItem>
                    <asp:ListItem Value="2">2<img src="Image/icon_Star.png" /></asp:ListItem>
                    <asp:ListItem Value="3">3<img src="Image/icon_Star.png" /></asp:ListItem>
                    <asp:ListItem Value="4">4<img src="Image/icon_Star.png" /></asp:ListItem>
                    <asp:ListItem Selected="True" Value="5">5<img src="Image/icon_Star.png" /></asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button CssClass="btn_BinhLuan" ID="btnGui" runat="server" Text="Bình luận" OnClick="btnGui_Click" />
            </div>
        </div>
        <div class="cmt2">
            <asp:DataList ID="dtcmt" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                <ItemTemplate>
                    <did class="khungBL">
                        <fieldset>
                            <asp:Label CssClass="title_Bold" ID="Label1" runat="server" Text='<%# Eval("TaiKhoan") + "- đã đánh giá " %>'></asp:Label> 
                            <asp:Label CssClass="title_Bold" ID="Label3" runat="server" Text='<%# Eval("DanhGia") %>'></asp:Label>
                            <img src="Image/icon_Star.png" style="width: 13px; height: 13px; padding-bottom: 4px;" />
                            <br />
                            <fieldset>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                            </fieldset>
                        </fieldset>
                    </did>
                </ItemTemplate>
            </asp:DataList>
        </div>
        
        <div class="cmt3">
            <input class="btnHT_AB" type="button" id="visible" value="Hiển thị" />
            <br />
            <div class="DSBL">
                <asp:DataList ID="dtBLMax" runat="server">
                    <ItemTemplate>
                        <fieldset class="fs_BL">
                            <asp:Label CssClass="title_Bold" ID="Label1" runat="server" Text='<%# Eval("TaiKhoan") + " - đã đánh giá " %>'></asp:Label>
                            <asp:Label ID="idDanGia" runat="server" Text='<%# Eval("IMG") %>'></asp:Label>
                            <asp:Label CssClass="date" ID="Label4" runat="server" Text='<%# Eval("NgayGio") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                            </fieldset>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <br />
            <input class="btnHT_AB" type="button" id="hide" value="Ản bớt" hidden="hidden" />
            <script>
                $(document).ready(function () {
                    $('#visible').click(function () {
                        $('.DSBL').show(100);
                        $('#visible').hide(100);
                        $('#hide').show(100);
                    })
                    $('#hide').click(function () {
                        $('.DSBL').hide(100)
                        $('#hide').hide(100);
                        $('#visible').show(100);
                    })

                })
            </script>
        </div>
    </div>
        
</asp:Content>
