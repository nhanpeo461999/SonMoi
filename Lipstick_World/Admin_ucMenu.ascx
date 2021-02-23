<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Admin_ucMenu.ascx.cs" Inherits="Lipstick_World.Admin_ucMenu" %>
<style>
    .menu_admin{
        width: 90%;
        margin: 0 7% 0 3%;
    }
    .menu_admin fieldset{
        width: 100%;
        display: block;
        margin: 10px 1%;
        height: auto;
        border: ridge
    }
    fieldset div{
        text-align: center;
    }
    fieldset div.left{
        float: left;
        width: 70%;
        height: 100%;
    }
    fieldset div.right{
        float: right;
        width: 30%;
        height: 100%;
    }
    div.right label{
        display: block;
        font-size: 20px;
        margin: 10px 0;
    }
    div.right input[type=button]{
        margin: 40px 0;
        font-size: 18px;
        padding: 5px 3px;
        background-color: snow;
        font-weight: bold;
        border-color: black;
    }
    div.right input[type=button]:hover{
        background-color: black;
        color: snow;
    }
    div.left img{
        margin-top: 45px;
        width: 150px;
        height: 150px;
    }
    .btn_Chart{
        margin: 2px 0;
        font-size: 12px;
        padding: 5px 0;
        border: solid;
        width: 100%;
        background-color: snow;
        border-color: black;
    }
    .btn_Chart:hover{
        background-color: black;
        color: snow;
    }
    .btn_QL_admin{
        border: solid;
        margin: 40px 0;
        font-size: 18px;
        padding: 5px 3px;
        background-color: snow;
        font-weight: bold;
        border-color: black;
    }
    .btn_QL_admin:hover{
        background-color: black;
        color: snow;
    }
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div class="menu_admin">
    <fieldset>
        <div class="left">
            <img src="Image/admin_menu_KhachHang.png" /><p>KHÁCH HÀNG</p>
        </div>
        <div class="right">
            <label>Số lượng khách hàng: <asp:Label ID="lbkh" runat="server" Text="0"></asp:Label></label>
            <label>Số lượng admin: <asp:Label ID="lbad" runat="server" Text="0"></asp:Label></label>
            <input type="button" value="Quản lý danh sách khách hàng" />
        </div>
    </fieldset>
        
    <fieldset>
        <div class="left">
            <div id="chart_KhachHang">
                <div id="chart"></div>
                
            </div>
            <p>SẢN PHẨM</p>
        </div>
        <div class="right">
            <asp:Button CssClass="btn_Chart" ID="charTuan" runat="server" OnClick="charTuan_Click" Text="Tổng" />
            <asp:Button CssClass="btn_Chart" ID="Button1" runat="server" OnClick="Button1_Click" Text="Theo tháng" />
            <asp:Button CssClass="btn_Chart" ID="Button2" runat="server" OnClick="Button2_Click" Text="Theo năm" />
            <input type="button" value="Quản lý danh sách sản phẩm" />
        </div>
    </fieldset>
    <fieldset>
        <div class="left">
            <img src="Image/icon_mess.png" /><p>LIÊN HỆ</p>
        </div>
        <div class="right">
            <input type="button" value="coming soon" /><br />
            <a class="btn_QL_admin" href="#">Tin nhắn<asp:Label ForeColor="Red" Font-Size="12px" ID="lbTN" runat="server" Text="Label"></asp:Label></a>
        </div>
    </fieldset>
    <fieldset>
        <div class="left">
            <img src="Image/icon_oder_admin.png" /><p>ĐƠN HÀNG</p>
        </div>
        <div class="right">
            <input type="button" value="coming soon" /><br />
            <a class="btn_QL_admin" href="#">Quản lý đơn hàng<asp:Label ForeColor="Red" Font-Size="12px" ID="lbDH" runat="server" Text="Label"></asp:Label></a>
        </div>
    </fieldset>
</div>
<div style="display:none;">
    <input type="text" id="sp1" value="SP1" runat="server" />
    <input type="text" id="sp2" value="SP2" runat="server" />
    <input type="text" id="sp3" value="SP3" runat="server" />
    <input type="text" id="sp4" value="SP4" runat="server" />
    <input type="text" id="sp5" value="SP5" runat="server" />
    <input type="text" id="sp6" value="SP6" runat="server" />
    <input type="text" id="sp7" value="SP7" runat="server" />
    <input type="text" id="sp8" value="SP8" runat="server" />
    <input type="text" id="sp9" value="SP9" runat="server" />
    <input type="text" id="sp10" value="SP10" runat="server" />

    <input type="text" id="title" value="SP5" runat="server" />

    <input type="text" id="num1" value="40" runat="server" />
    <input type="text" id="num2" value="45" runat="server" />
    <input type="text" id="num3" value="60" runat="server" />
    <input type="text" id="num4" value="75" runat="server" />
    <input type="text" id="num5" value="80" runat="server" />
    <input type="text" id="num6" value="80" runat="server" />
    <input type="text" id="num7" value="80" runat="server" />
    <input type="text" id="num8" value="80" runat="server" />
    <input type="text" id="num9" value="80" runat="server" />
    <input type="text" id="num10" value="80" runat="server" />

</div>
<script type="text/javascript">
    var sp1 = document.getElementById("ContentPlaceHolder1_Admin_ucMenu_sp1").value;
    var sp2 = document.getElementById("ContentPlaceHolder1_Admin_ucMenu_sp2").value;
    var sp3 = document.getElementById("ContentPlaceHolder1_Admin_ucMenu_sp3").value;
    var sp4 = document.getElementById("ContentPlaceHolder1_Admin_ucMenu_sp4").value;
    var sp5 = document.getElementById("ContentPlaceHolder1_Admin_ucMenu_sp5").value;

    var titlsp = document.getElementById("ContentPlaceHolder1_Admin_ucMenu_title").value;

    var num1 = Number(document.getElementById("ContentPlaceHolder1_Admin_ucMenu_num1").value);
    var num2 = Number(document.getElementById("ContentPlaceHolder1_Admin_ucMenu_num2").value);
    var num3 = Number(document.getElementById("ContentPlaceHolder1_Admin_ucMenu_num3").value);
    var num4 = Number(document.getElementById("ContentPlaceHolder1_Admin_ucMenu_num4").value);
    var num5 = Number(document.getElementById("ContentPlaceHolder1_Admin_ucMenu_num5").value);

    var data;
    var options;
    
    google.charts.load('current', { packages: ['corechart'] });
    
    $(document).ready(function () {
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Tạo data table
            data = new google.visualization.DataTable();
            data.addColumn('string', 'Sản phẩm');
            data.addColumn('number', 'Số lượng');
            data.addRows([
                [sp1, num1],
                [sp2, num2],
                [sp3, num3],
                [sp4, num4],
                [sp5, num5]
            ]);

            // Set option của biểu đồ
            options = {
                'title': titlsp,
                'width': 750,
                'height': 200,
            };

            // Vẽ biểu đồ từ data và option đã khai báo
            var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
            chart.draw(data, options);
        }
    });

</script>