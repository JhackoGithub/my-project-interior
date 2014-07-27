<%@ Page Title="Kiến trúc" Language="C#" MasterPageFile="~/NestedMasterPage.Master" AutoEventWireup="true" CodeBehind="Architecture.aspx.cs" Inherits="WebSite.Architecture" %>

<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeftContent" runat="server">
    <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" runat="server">
    <asp:Literal runat="server" ID="ltProjects"></asp:Literal>
</asp:Content>

