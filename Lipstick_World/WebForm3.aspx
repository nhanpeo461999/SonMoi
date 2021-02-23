<%@ Page validateRequest="false" Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Lipstick_World.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
    <asp:Label ID="lbPriKey" runat="server" Text="Label"></asp:Label>
    <textarea id="txtBanMa" runat="server" cols="20" rows="2"></textarea>
    <textarea id="txtBanGhi" runat="server" cols="20" rows="2"></textarea>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</body>
</html>
