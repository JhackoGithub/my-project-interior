<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuSubTop.ascx.cs" Inherits="WebSite.UserControls.MenuSubTop" %>
<ul id="minitabs">
    <asp:Literal runat="server" ID="ltSubtab"></asp:Literal>
</ul>

<script type="text/javascript">
    $(function() {
        var tab = getParameterByName('subtab');
        switch (tab) {
        case '2':
            $('#minitabs #subtab-2').children().attr('id', 'current');
            break;
        case '3':
            $('#minitabs #subtab-3').children().attr('id', 'current');
            break;
        default:
            $('#minitabs #subtab-1').children().attr('id', 'current');
            break;
        }
    });
</script>