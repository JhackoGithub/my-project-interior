<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Admin.Project" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-bottom: 10px">
        <button type="button" onclick="showPopup()">Tạo mới dự án</button>
    </div>
    <div id="containerproject"></div>

<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        
        var wnd;
        function showPopup() {
            $("#containerproject").html("");
            var url = "../Contents/AddProject.aspx";
            wnd = ShowPopupIframe(900, 790, "Tạo mới dự án", "containerproject", url);
            $("#containerproject").parent().width(900).height(790);
        }
        
        function closePopup() {
            wnd.close();
        }
    </script>
</telerik:RadCodeBlock>
</asp:Content>
