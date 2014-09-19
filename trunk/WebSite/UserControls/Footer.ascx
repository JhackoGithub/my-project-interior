<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="WebSite.UserControls.Footer" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<footer id="footer">
    <div id="back-top-wrapper">
        <p id="back-top" style="display: block;">
            <a href="#"></a>
        </p>
    </div>
    <div class="splash">
        <div class="container_12 clearfix footer-top">
            <div class="grid_8">
                <nav class="footer">
                    <ul id="menu-footer-menu">
                        <li id="menu-item-240" class="current-menu-item current_page_item"><a href="../Default.aspx">Trang chủ</a></li>
                        <li id="menu-item-533"><a href="../Architecture.aspx?type=0&tab=1">Kiến trúc</a></li>
                        <li id="menu-item-532"><a href="../Interior.aspx?type=1&tab=1">Nội thất</a></li>
                        <li id="menu-item-243"><a href="../News.aspx?type=2">Tin tức</a></li>
                        <li id="menu-item-241"><a href="http://www.xemngay.com/Default.aspx?blog=huongnha2" target="_blank">Phong thủy</a></li>
                        <li id="menu-item-242"><a href="../Contact.aspx?type=4">Liên hệ</a></li>
                    </ul>
                </nav>
                <div class="contacts">
                    <span class="footer_address">64B Nguyễn Viết Xuân, P.Khương Mai, Q.Thanh Xuân, TP. Hà Nội</span>
                    <span class="footer_phone">04.35686999 | 0964.165.666 - 0917.955.866</span>
                    <a class="footer_email" href="#">noithatviet.am@gmail.com</a>
                </div>
            </div>
            <div class="grid_4" style="margin-top: 10px; width: 220px !important;">
                <div id="widget-footer" class="clearfix">
                    <div id="social_networks-2">
                        <h4>LIÊN KẾT</h4>
                        <ul class="social-networks">
                            <li>
                                <a rel="external" href="https://www.facebook.com/noithatviet.am" target="_blank">
                                    <img src="/Images/facebook.png" alt="">
                                </a>
                            </li>
                            <li>
                                <a rel="external" href="javascript:;" onclick="share_twitter();">
                                    <img src="/Images/twitter.png" alt="">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 30px; margin-top: 10px; text-align: center;">
            <small>Copyright © 2014 Bản quyền thuộc về noithatviet.com.vn.</small>
        </div>
    </div>
    <telerik:RadCodeBlock runat="server">
    <script src="<%: Page.ResolveUrl("~/Scripts/portal.js") %>"> </script>
        <script type="text/javascript">
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/vi_VN/all.js#xfbml=1";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".fb-comments").attr("data-href", window.location.href);
            });
        </script>
    </telerik:RadCodeBlock>
</footer>
