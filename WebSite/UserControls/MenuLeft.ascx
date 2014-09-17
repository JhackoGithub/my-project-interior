<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLeft.ascx.cs" Inherits="WebSite.UserControls.MenuLeft" %>

<div id='cssmenu' style="float: left; width: 220px;">
    <asp:Literal runat="server" ID="ltMenu"></asp:Literal>
</div>
<script type="text/javascript">
    $(function() {
        var page = '<%= Page.Request.Path%>';
        $('#cssmenu ul ul li a').each(function() {
            var link = $(this).attr('href');
            if (link == page) {
                $(this).children().addClass('active');
            }
        });
    });
</script>