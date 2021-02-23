<%@ Page validateRequest="false" Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Lipstick_World.WebForm2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .chart{
            width: 100%;
        }
        .chart {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        Private key:<textarea id="txtPrK" cols="20" runat="server" rows="2"></textarea><br />
        Public key:<textarea id="txtPuK" cols="20" runat="server" rows="2"></textarea>
        <br />
        <textarea id="txtBanGhi1" cols="20" runat="server" rows="2"></textarea>
        <textarea id="txtBanMa" cols="20" runat="server" rows="2"></textarea>
        <textarea id="txtBanGhi2" cols="20" runat="server" rows="2"></textarea>
        <br />
        <asp:Button ID="Button1" runat="server" Text="key" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="ma hoa" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="giai ma" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Button" />
    </form>
</body>
</html>
