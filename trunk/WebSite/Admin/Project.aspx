<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Admin.Project" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-bottom: 10px">
        <button type="button" id="btnAdd" onclick="showPopup()">Tạo mới dự án</button>
    </div>
    <div id="containerproject"></div>

<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        $('#btnAdd').click(function() {
            location.href = 'AddProject.aspx';
        });
        //var wnd;
        //function showPopup() {
        //    $("#containerproject").html("");
        //    var url = "../Contents/AddProject.aspx";
        //    wnd = ShowPopupIframe(1000, 600, "Tạo mới dự án", "containerproject", url);
        //    $("#containerproject").parent().width(1000).height(600);
        //}
        
        //function closePopup() {
        //    wnd.close();
        //}
    </script>
</telerik:RadCodeBlock>
</asp:Content>
