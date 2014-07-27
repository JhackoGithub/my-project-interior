<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuTop.ascx.cs" Inherits="WebSite.UserControls.MenuTop" %>
<div class="tab-menu">
    <asp:Literal runat="server" ID="ltMenuLeft"></asp:Literal>
    <div class="clear"></div>
</div>

<script type="text/javascript">
    $(function () {

        var tab = getParameterByName('tab');
        if (tab == 1) {
            $('.tab-menu #menu-tab-1').addClass('active');
        } else if (tab == 2) {
            $('.tab-menu #menu-tab-2').addClass('active');
        } else if (tab == 3) {
            $('.tab-menu #menu-tab-3').addClass('active');
        } else if (tab == 4) {
            $('.tab-menu #menu-tab-4').addClass('active');
        }
    });
</script>
