<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Admin.Project" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-bottom: 10px">
        <button type="button" onclick="showPopupGroup()">Tạo mới dự án</button>
    </div>
    <div id="containerproject"></div>

<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        
        var wnd;
        function showPopupGroup() {
            $("#containerproject").html("");
            //var title = "";
            //if (id == 0) {
            //    action = 'new';
            //    title = "Add permission group";
            //} else if (action == 'view') {
            //    title = "Permissions of group";
            //} else {
            //    title = "Edit permission group";
            //}

            var url = "../Contents/AddProject.aspx";
            wnd = ShowPopupIframe(900, 700, "", "containerproject", url);
            $("#containerproject").parent().width(900).height(700);
        }
    </script>
</telerik:RadCodeBlock>
</asp:Content>
