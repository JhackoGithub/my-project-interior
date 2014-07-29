<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSite._Default" %>

<%@ Register Src="~/UserControls/Menu.ascx" TagPrefix="ucMenu" TagName="Menu" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="ucFooter" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
    <head runat="server">
        <meta charset="utf-8" />
        <title><%: Page.Title %> - noithatviet.net.vn</title>
        <link href="~/Content/camera.css" rel="stylesheet" />
        <link href="~/Content/normalize.css" rel="stylesheet" />
        <link href="~/Content/StyleSheet.css" rel="stylesheet" />
        <link href="~/Content/prettyPhoto.css" rel="stylesheet" />
        <link href="~/Content/grid.css" rel="stylesheet" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <meta name="viewport" content="width=device-width" />
    
        <style type="text/css">
            #back_to_camera {
                clear: both;
                display: block;
                height: 80px;
                line-height: 40px;
                padding: 20px;
            }

            .fluid_container {
                margin: 0 auto;
                height: 640px;
                width: 960px;
            }
        </style>


        <script src="Scripts/jquery-1.8.2.min.js"></script>
        <script src="Scripts/jquery.easing.1.3.js"> </script>
        <script src="Scripts/camera.js" type="text/javascript"> </script>
        <script src="Scripts/Script.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(function () {
                jQuery('#camera_wrap_2').camera({
                    height: '520px',
                    loader: 'bar',
                    pagination: false,
                    thumbnails: true,
                    imagePath: '/Images/'
                });
                
                $('ul li:first').addClass('current_page_item');
            });
        </script>

    </head>
    <body class="home page" style="color: #878786;">
        <form runat="server">
            <div id="main">
                <header id="header">
                    <div class="splash">
                        <div class="tail-top">
                            <div class="tail-bottom">
                                <div class="container_12 clearfix header">
                                    <div class="grid_12">
                                        <div class="logo">
                                            <div style="padding: 5px; float: left;">
                                                <a href="#">
                                                    <img src="Images/logo.png" width="100px" /></a>
                                            </div>
                                            <div style="float: left; width: 190px; padding-top: 20px;">
                                                <div style="text-transform: uppercase; text-align: left; color: white; text-decoration: underline; font-family: sans-serif; font-size: 10pt; line-height: 1.6em;">
                                                    công ty cổ phần tư vấn thiết kế và xây dựng a&m
                                                </div>
                                            </div>
                                        </div>
                                        <div class="primary">
                                            <ucMenu:Menu ID="ucMenu" runat="server" />
                                        </div>
                                        <div id="top-search">
                                            <input type="text" name="s" class="input-search" />
                                            <input type="submit" id="submit" value="" />
                                        </div>

                                    </div>
                                </div>
                                <div class="fluid_container">
                                    <div class="camera_wrap camera_magenta_skin" id="camera_wrap_2">
                                        <div data-thumb="/Images/slides/thumbs/slide01.jpg" data-src="/Images/slides/slide01.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide02.jpg" data-src="/Images/slides/slide02.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide03.jpg" data-src="/Images/slides/slide03.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide04.jpg" data-src="/Images/slides/slide04.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide05.jpg" data-src="/Images/slides/slide05.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide06.jpg" data-src="/Images/slides/slide06.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide07.jpg" data-src="/Images/slides/slide07.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide08.jpg" data-src="/Images/slides/slide08.jpg"></div>
                                        <div data-thumb="/Images/slides/thumbs/slide09.jpg" data-src="/Images/slides/slide09.jpg"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <div class="container_12 primary_content_wrap clearfix" style="padding-top: 50px;">
                    <div class="clearfix" style="border-bottom: 1px solid #e5e5e5;">
                    </div>
                    <div class="clearfix">
                        <div id="my_requestquotewidget-2" class="grid_3">
                            <div class="top-box">
                                <div class="inner-bg">
                                    <figure class="icon">
                                        <img src="Images/home_img01.png" />
                                    </figure>
                                    <div class="box-button">
                                        <a href="/Architecture.aspx?type=0&tab=1">thiết kế kiến trúc</a>
                                    </div>
                                </div>
                                <div class="box-shadow"></div>
                            </div>
                        </div>
                        <div id="my_requestquotewidget-3" class="grid_3">
                            <div class="top-box">
                                <div class="inner-bg">
                                    <figure class="icon">
                                        <img src="Images/home_img02.png" />
                                    </figure>
                                    <div class="box-button">
                                        <a href="/Interior.aspx?type=1&tab=1">thiết kế nội thất</a>
                                    </div>
                                </div>
                                <div class="box-shadow"></div>
                            </div>
                        </div>
                        <div id="my_requestquotewidget-4" class="grid_3">
                            <div class="top-box">
                                <div class="inner-bg">
                                    <figure class="icon">
                                        <img src="Images/home_img03.png" />
                                    </figure>
                                    <div class="box-button">
                                        <a href="commingsoon.aspx">thiết kế nhà hàng</a>
                                    </div>
                                </div>
                                <div class="box-shadow"></div>
                            </div>
                        </div>
                        <div id="Div1" class="grid_3">
                            <div class="top-box">
                                <div class="inner-bg">
                                    <figure class="icon">
                                        <img src="Images/home_img05.png" />
                                    </figure>
                                    <div class="box-button">
                                        <a href="http://www.xemngay.com/Default.aspx?blog=huongnha2" target="_blank">tư vấn phong thủy</a>
                                    </div>
                                </div>
                                <div class="box-shadow"></div>
                            </div>
                        </div>
                    </div>
                    <div id="second-content-area">
                        <div id="text-3" class="widget-content grid_4" style="width: 100%;">
                            <div class="inner">
                                <h3>Welcome!</h3>
                                <div>
                                    <p>
                                        Công ty CP tư vấn thiết kế và xây dựng A&M là một trong những công ty chuyên nghiệp
                                        về thiết kế kiến trúc nội ngoại thất và thi công nội thất. Với đội ngũ kiến trúc sư
                                        giỏi có nhiều năm kinh nghiệm, các sản phẩm của chúng tôi luôn được khách hàng đánh giá
                                        cao về tính thẩm mỹ cũng như chất lượng thi công. Chúng tôi tự tin và chắc chắn phục vụ tốt
                                        nhu cầu ngày càng cao của quý khách hàng.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="menu-bottom">
                        <div>
                            <a href="/Consultant.aspx?type=0&tab=2" title="Read more" class="button">TƯ VẤN THIẾT KẾ</a>
                        </div>
                        <div>
                            <a href="/Lesson.aspx?type=0&id=7&tab=2" title="Read more" class="button">THI CÔNG</a>
                        </div>
                        <div>
                            <a href="/Lesson.aspx?type=0&id=6&tab=2" title="Read more" class="button">TƯ VẤN GIÁM SÁT</a>
                        </div>
                    </div>
                </div>
            </div>
            <ucFooter:Footer ID="footer" runat="server" />
        </form>
    </body>
</html>