<%@ Page Title="" Language="C#" MasterPageFile="~/MastetPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lipstick_World.WebForm1" %>

<%@ Register Src="~/UC/SP_NoiBat.ascx" TagPrefix="uc1" TagName="SP_NoiBat" %>
<%@ Register Src="~/UC/Slide.ascx" TagPrefix="uc1" TagName="Slide" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Slide runat="server" ID="Slide" />
    <uc1:SP_NoiBat runat="server" ID="SP_NoiBat" />
</asp:Content>
