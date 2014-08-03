<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebSite.Contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContainer" runat="server">
    <script type="text/javascript">
        jQuery(function () {
            $('.sf-menu #menu-item-6').addClass('current_page_item');
            
        });

        function resizeIframe(obj) {
            obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
        }

        function sourceIframe(content) {
            document.getElementById("cloudpreview").src = "/Contents/" + content;
        }
    </script>
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-14" class="page">
                <div id='cssmenu' style="width: 230px; display: inline; float: left; margin-left: 10px; margin-right: 10px;">
                    <ul>
                        <li class="has-sub"><a href="#"><span>Khách hàng</span></a>
                            <ul id="menucontact">
                                <li><a href="#"><span id="0">Địa điểm công ty</span></a></li>
                                <li><a href="#"><span id="1">Bảng báo giá Tư vấn</span></a></li>
                                <li><a href="#"><span id="2">Quy trình thiết kế</span></a></li>
                                <li class="last"><a href="#"><span id="3">Phiếu điều tra</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div style="width: 670px; height: 100%; display: inline; float: left; margin-left: 10px; margin-right: 10px;">
                    <div id="divIframe" style="display: none;">
                        <iframe id="cloudpreview" style="width: 670px; height: 100%;" scrolling="no" frameborder="0" onload='javascript:resizeIframe(this);'></iframe>
                    </div>
                    <div id="divMap" style="display: block;">
                        <h2>Bản đồ đến công ty</h2>
                        <div class="google-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.8736005821547!2d105.82702340000003!3d20.9977033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac8871297549%3A0xb2a892bf045f4851!2zNjQgTmd1eeG7hW4gVmnhur90IFh1w6JuLCBLaMawxqFuZyBNYWksIFRoYW5oIFh1w6JuLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1405071611175" width="670" height="450" frameborder="0" style="border: 0"></iframe>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#menucontact li span').click(function () {
            debugger;
            var id = $(this).attr('id');
            switch (id) {
                case '1':
                    $('#divMap').css('display', 'none');
                    $('#divIframe').css('display', 'block');
                    sourceIframe("Quote.html");
                    break;
                case '2':
                    $('#divMap').css('display', 'none');
                    $('#divIframe').css('display', 'block');
                    sourceIframe("Process.html");
                    break;
                case '3':
                    $('#divMap').css('display', 'none');
                    $('#divIframe').css('display', 'block');
                    break;
                case '0':
                default:
                    $('#divMap').css('display', 'block');
                    $('#divIframe').css('display', 'none');
                    break;
            }
        });
    </script>
</asp:Content>
