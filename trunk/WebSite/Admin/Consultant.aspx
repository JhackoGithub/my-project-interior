<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Consultant.aspx.cs" Inherits="WebSite.Admin.Consultant" %>
<%@ Register Src="~/UserControls/NewsManagement.ascx" TagPrefix="ucNewsMng" TagName="NewsMng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ucNewsMng:NewsMng runat="server" ID="ucNews" />
</asp:Content>