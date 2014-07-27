<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLeft.ascx.cs" Inherits="WebSite.UserControls.MenuLeft" %>

<div id='cssmenu' style="float: left; width: 220px;">
    <asp:Literal runat="server" ID="ltMenu"></asp:Literal>
</div>
<script type="text/javascript">
    $(function () {
        var cate = getParameterByName('cate');
        var page = 'Architecture.aspx?type=0&tab=1&cate=' + cate;
        $('#cssmenu ul li ul li a').each(function () {
            var link = $(this).attr('href');
            if (link.indexOf(page) >= 0) {
                $(this).children().addClass('active');
            }
        });
    });
</script>