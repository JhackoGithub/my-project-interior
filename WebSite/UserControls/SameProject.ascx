<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SameProject.ascx.cs" Inherits="WebSite.UserControls.ContentRight" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<style type="text/css">
    .grid-block {
        margin: auto !important;
    }
</style>
<span style="font-weight: bold; padding-left: 5px;">Sản phẩm khác</span>
<div class="container">
    <div id="va-accordion" class="va-container" style="width: 200px !important;">
        <div class="va-nav">
            <span class="va-nav-prev">Previous</span>
            <span class="va-nav-next">Next</span>
        </div>
        <div class="va-wrapper">
            <asp:Literal runat="server" ID="ltProjects"></asp:Literal>
        </div>
    </div>
</div>
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script src="<%: Page.ResolveUrl("~/Scripts/jquery.vaccordion.js") %>" > </script>
    <script type="text/javascript">
        $(function () {
            $('#va-accordion').vaccordion();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.grid-block').hover(
                function () {
                    $(this).find('.captions').slideDown(250);
                },
                function () {
                    $(this).find('.captions').slideUp(250);
                }
            );
        });
    </script>
</telerik:RadCodeBlock>

