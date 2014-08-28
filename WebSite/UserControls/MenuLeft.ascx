<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLeft.ascx.cs" Inherits="WebSite.UserControls.MenuLeft" %>

<div id='cssmenu' style="float: left; width: 220px;">
    <asp:Literal runat="server" ID="ltMenu"></asp:Literal>
</div>
<script type="text/javascript">
    $(function() {
        var cate = getParameterByName('cate');
        var type = getParameterByName('type');
        var tab = getParameterByName('tab');
        var page;
        if (tab == "1") {
            page = 'Project.aspx?type=' + type + '&tab=1&cate=' + cate;
        } else {
            var id = getParameterByName('id');
            page = 'Consultant.aspx?type=' + type + '&tab=2&id=' + id;
        }
        $('#cssmenu ul ul li a').each(function() {
            var link = $(this).attr('href');
            if (link.indexOf(page) >= 0) {
                $(this).children().addClass('active');
            }
        });
    });
</script>