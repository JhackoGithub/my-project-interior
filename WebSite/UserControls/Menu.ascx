<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebSite.UserControls.Menu" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<ul id="topnav" class="sf-menu">
    <li id="menu-item-1" class="current-menu-item">
        <a href="<%: Page.ResolveUrl("/") %>">trang chủ</a>
    </li>
    <li id="menu-item-2" class="current-menu-item">
        <a href="<%:Page.ResolveUrl("/kien-truc/cong-trinh-kien-truc/0/1") %>">kiến trúc</a>
    </li>
    <li id="menu-item-3" class="current-menu-item">
        <a href="<%:Page.ResolveUrl("/noi-that/cong-trinh-noi-that/1/1") %>">nội thất</a>
    </li>
    <li id="menu-item-4" class="current-menu-item">
        <a href="<%:Page.ResolveUrl("/tin-tuc/2/0") %>">tin tức</a>
    </li>
    <li id="menu-item-5" class="current-menu-item">
        <a href="http://www.xemngay.com/Default.aspx?blog=huongnha2" target="_blank">phong thủy</a>
    </li>
    <li id="menu-item-6" class="current-menu-item">
        <a href="<%:Page.ResolveUrl("/lien-he/dia-diem-cong-ty/4/0/0") %>">liên hệ</a>
    </li>
</ul>
<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        $(function() {
            $(this).siblings('li').removeClass('current_page_item');
            var type = '<%= Page.RouteData.Values["type"] == null ? "-1" : Page.RouteData.Values["type"].ToString() %>';
            if (type == "-1")
                return;
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
</telerik:RadCodeBlock>
