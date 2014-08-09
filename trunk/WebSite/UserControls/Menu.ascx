<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebSite.UserControls.Menu" %>

<ul id="topnav" class="sf-menu">
    <li id="menu-item-1" class="current-menu-item">
        <a href="../Default.aspx">trang chủ</a>
    </li>
    <li id="menu-item-2" class="current-menu-item">
        <a href="../Project.aspx?type=0&tab=1">kiến trúc</a>
    </li>
    <li id="menu-item-3" class="current-menu-item">
        <a href="../Project.aspx?type=1&tab=1">nội thất</a>
    </li>
    <li id="menu-item-4" class="current-menu-item">
        <a href="../News.aspx?type=2">tin tức</a>
    </li>
    <li id="menu-item-5" class="current-menu-item">
        <a href="http://www.xemngay.com/Default.aspx?blog=huongnha2" target="_blank">phong thủy</a>
    </li>
    <li id="menu-item-6" class="current-menu-item">
        <a href="../Contact.aspx?type=4&id=0">liên hệ</a>
    </li>
</ul>

<script type="text/javascript">
    $(function() {

        $(this).siblings('li').removeClass('current_page_item');
        var type = getParameterByName('type');
        switch (type) {
        case '0':
            $('.sf-menu #menu-item-2').addClass('current_page_item');
            break;
        case '1':
            $('.sf-menu #menu-item-3').addClass('current_page_item');
            break;
        case '2':
            $('.sf-menu #menu-item-4').addClass('current_page_item');
            break;
        case '3':
            $('.sf-menu #menu-item-5').addClass('current_page_item');
            break;
        case '4':
            $('.sf-menu #menu-item-6').addClass('current_page_item');
            break;
        default:
            $('.sf-menu #menu-item-1').addClass('current_page_item');
            break;
        }

    });

</script>