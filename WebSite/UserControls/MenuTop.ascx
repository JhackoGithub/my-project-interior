<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuTop.ascx.cs" Inherits="WebSite.UserControls.MenuTop" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<div class="tab-menu">
    <asp:Literal runat="server" ID="ltMenuLeft"></asp:Literal>
    <div class="clear"></div>
</div>
<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        $(function () {
            var tab = '<%= int.Parse(Page.RouteData.Values["tab"].ToString())%>';
            if (tab == '1') {
                $('.tab-menu #menu-tab-1').addClass('active');
            } else if (tab == '2') {
                $('.tab-menu #menu-tab-2').addClass('active');
            } else if (tab == '3') {
                $('.tab-menu #menu-tab-3').addClass('active');
            } else if (tab == '4') {
                $('.tab-menu #menu-tab-4').addClass('active');
            }
        });
    </script>
</telerik:RadCodeBlock>
