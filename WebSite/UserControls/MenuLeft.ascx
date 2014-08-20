<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLeft.ascx.cs" Inherits="WebSite.UserControls.MenuLeft" %>

<div id='cssmenu' style="float: left; width: 205px;">
    <asp:Literal runat="server" ID="ltMenu"></asp:Literal>
</div>
<script type="text/javascript">
    $(function() {
        var cate = getParameterByName('cate');
        var type = getParameterByName('type');
        var page = 'Project.aspx?type=' + type + '&tab=1&cate=' + cate;
        $('#cssmenu ul li ul li a').each(function() {
            var link = $(this).attr('href');
            if (link.indexOf(page) >= 0) {
                $(this).children().addClass('active');
            }
        });
    });
</script>