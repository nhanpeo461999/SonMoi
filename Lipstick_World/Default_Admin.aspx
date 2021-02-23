<%@ Page Title="" Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Default_Admin.aspx.cs" Inherits="Lipstick_World.Admin.Default_Admin" %>

<%@ Register Src="~/Admin_ucMenu.ascx" TagPrefix="uc1" TagName="Admin_ucMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Admin_ucMenu runat="server" ID="Admin_ucMenu" />
</asp:Content>
