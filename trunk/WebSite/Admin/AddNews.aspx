<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="WebSite.Admin.AddNews" Theme="BocaTheme" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/UserControls/NewsManagement.ascx" TagPrefix="ucNewsMng" TagName="NewsMng" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <ucNewsMng:NewsMng runat="server" ID="ucNews" />
    
    <div style="clear: both;"></div>
    <div style="text-align: right;">
        <asp:Button runat="server" ID="btnSave" Text="Lưu" OnClick="btnSave_Click" />
    </div>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">

            function confirmDialog(msg) {
                var res = confirm(msg);
                if (res) {
                    window.location.href = "/Admin/News.aspx";
                    return true;
                }
                return false;
            }

        </script>
    </telerik:RadCodeBlock>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
</asp:Content>
