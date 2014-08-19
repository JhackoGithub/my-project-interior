<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Images.aspx.cs" Inherits="WebSite.Admin.Images" Theme="Windows7" %>

<%@ Register Src="~/UserControls/ImageManager.ascx" TagPrefix="uc1" TagName="ImageManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:ImageManager runat="server" ID="ImageManager" />    
</asp:Content>
