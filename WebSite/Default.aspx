<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSite._Default" %>

<%@ Register Src="~/UserControls/Menu.ascx" TagPrefix="ucMenu" TagName="Menu" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagPrefix="ucFooter" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
    <head runat="server">
        <meta charset="utf-8" />
        <title>noithatviet.net.vn</title>
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
                height: 640px;
                margin: 0 auto;
                width: 960px;
            }
            .camera_thumbs {
                margin-top: -50px;
            }
        </style>

        

        <script src="Scripts/jquery-1.8.2.min.js"> </script>
        <script src="Scripts/jquery.easing.1.3.js"> </script>
        <script src="Scripts/camera.js" type="text/javascript"> </script>
        <script src="Scripts/Script.js" type="text/javascript"> </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.grid-block').hover(
		            function () {
		                $(this).find('.captions').slideDown(250);
		            },
		            function () {
		                $(this).find('.captions').slideUp(250);
		            }
	            );
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
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
    <body class="home page">
        <form runat="server">
            <div id="main">
                <header id="header" style="z-index: 100;">
                    <div class="splash">
                        <div class="tail-top">
                            <div class="tail-bottom">
                                <div class="container_12 clearfix header">
                                    <div class="grid_12">
                                        <div class="logo">
                                            <div style="float: left; padding: 5px;">
                                                <a href="#">
                                                    <img src="Images/logo.png" width="100px" /></a>
                                            </div>
                                            <div style="float: left; padding-top: 20px; width: 190px;">
                                                <div style="color: white; font-family: sans-serif; font-size: 10pt; line-height: 1.6em; text-align: left; text-decoration: underline; text-transform: uppercase;">
                                                    công ty cổ phần tư vấn thiết kế và xây dựng a&m
                                                </div>
                                            </div>
                                        </div>
                                        <div class="primary">
                                            <ucMenu:Menu ID="imenu" runat="server" />
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
                <div class="container_12 clearfix" style="margin-top: 230px; border-top: 1px solid #e5e5e5; padding-top: 30px;">
                    <div class="clearfix" >
                        <div class="grid-block">
        	                <div class="captions">
            	                <h3>thiết kế kiến trúc</h3>
                                <p><a href="/Project.aspx?type=0&tab=1" class="learn-more">chi tiêt</a></p>
                            </div>
        	                <img src="Images/home_img01.png" />
                        </div>
                        <div class="grid-block">
        	                <div class="captions">
            	                <h3>thiết kế nội thất</h3>
                                <p><a href="/Project.aspx?type=1&tab=1" class="learn-more">chi tiêt</a></p>
                            </div>
        	                <img src="Images/home_img02.png" />
                        </div>
                        <div class="grid-block">
        	                <div class="captions">
            	                <h3>thiết kế nhà hàng</h3>
                                <p><a href="commingsoon.aspx" class="learn-more">chi tiêt</a></p>
                            </div>
        	                <img src="Images/home_img03.png" />
                        </div>
                        <div class="grid-block">
        	                <div class="captions">
            	                <h3>tư vấn phong thủy</h3>
                                <p><a href="http://www.xemngay.com/Default.aspx?blog=huongnha2" class="learn-more">chi tiêt</a></p>
                            </div>
        	                <img src="Images/home_img05.png" />
                        </div>
                    </div>
                    <div id="second-content-area">
                        <div id="text-3" style="margin-left: auto; margin-right: auto; width: 800px;">
                            <div class="inner">
                                <h3>Welcome!</h3>
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