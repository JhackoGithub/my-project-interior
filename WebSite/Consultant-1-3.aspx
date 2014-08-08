<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultant-1-3.aspx.cs" Inherits="WebSite.Consultant_1_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">

    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-502" class="page">
                <div class="grid_12 ">
                    <div class="tabs">
                        <div class="tab-menu">
                            <ul>
                                <li><a href="Architecture.aspx">Công trình</a></li>
                                <li><a href="Consultant.aspx" class="active">Tư vấn</a></li>
                                <li><a href="Refer.aspx">Tham khảo</a></li>
                                <li><a href="Question.aspx">Hỏi đáp</a></li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="tab-wrapper">
                            <div id='cssmenu' style="float: left; width: 220px;">
                                <asp:Literal runat="server" ID="ltMenuLeft"></asp:Literal>
                            </div>
                            <div id="tab1" class="tab" style="display: block; float: right; width: 700px;">
                                <div class="Consultant-info">
                                    <p style="font-size: 13pt;">Quy trình Thiết kế</p>
                                    <p>
                                        1. Tiếp nhận yêu cầu thiết kế
                                        <br />
                                        <br />
                                        Sau khi nhận được yêu cầu thiết kế của Quý khách, Bộ phận Dịch vụ Khách hàng của Chúng tôi sẽ tư vấn để Quý khách hoàn thiện yêu cầu thiết kế; tư vấn tổng quát về giải pháp thiết kế, thống nhất về nội dung công việc thiết kế, tiến độ thực hiện, giá thiết kế, phương thức thanh toán, ...
                                    </p>
                                    <p>
                                        2. Khảo sát hiện trạng khu đất và thiết kế phương án sơ bộ
                                        <br />
                                        <br />
                                        Kiến trúc sư tiến hành khảo sát hiện trạng khu đất xây dựng (chụp ảnh, đo vẽ, thu thập các số liệu quy hoạch chung của khu vực, ...) và thiết kế phương án sơ bộ trên cơ sở kết quả khảo sát và yêu cầu của khách hàng.
                                        <br />
                                        Việc thiết kế sơ bộ sẽ được thực hiện tuần tự từ kiến trúc đến nội ngoại thất. Quý khách cần thống nhất thiết kế sơ bộ kiến trúc trước khi triển khai tiếp thiết kế sơ bộ nội ngoại thất.
                                        Thời gian thiết kế phương án sơ bộ tùy theo quy mô và tính chất công trình, xin liên hệ để biết thêm chi tiết.
                                    </p>
                                    <p>
                                        3. Báo cáo và thống nhất thiết kế sơ bộ với khách hàng
                                        <br />
                                        <br />
                                        Kiến trúc sư báo cáo thiết kế sơ bộ với khách hàng. Khách hàng có thể góp ý, yêu cầu điều chỉnh lại thiết kế nếu chưa cảm thấy hài lòng.
                                    </p>
                                    <p>
                                        4. Thiết kế bản vẽ thi công
                                        <br />
                                        <br />
                                        Công ty ACT tiến hành thiết kế bản vẽ thi công theo phương án thiết kế sơ bộ đã được khách hàng thống nhất. Trong quá trình triển khai, khách hàng có thể liên hệ với kiến trúc sư để bổ xung các yêu cầu chi tiết hoặc để được giải thích rõ hơn về kỹ thuật.
                                        Thời gian thiết kế bản vẽ thi công và lập dự toán thi công tùy theo quy mô và tính chất công trình, xin liên hệ để biết thêm chi tiết.
                                    </p>
                                    <p>
                                        5. Bàn giao hồ sơ thiết kế bản vẽ thi công
                                        <br />
                                        <br />
                                        Công ty ACT và khách hàng tiến hành bàn giao hồ sơ thiết kế bản vẽ thi công và nghiệm thu, thanh quyết toán hợp đồng thiết kế. Công ty ACT chịu hoàn toàn trách nhiệm về pháp lý và kỹ thuật của hồ sơ thiết kế sau khi thanh quyết toán hợp đồng. Mọi sai sót do lỗi thiết kế sẽ được chỉnh sửa nhanh chóng và hoàn toàn miễn phí.
                                    </p>
                                    <p>
                                        6. Thực hiện giám sát tác giả
                                        <br />
                                        <br />
                                        Công ty ACT sẽ thực hiện giám sát tác giả theo lịch thống nhất với Khách hàng, tại các thời điểm quan trọng của quá trình thi công, làm rõ về hồ sơ thiết theo yêu cầu của khách hàng và đơn vị thi công.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="img-bottom-info" style="padding-left: 260px;">
                            <img src="Images/products/8.jpg" />
                            <img src="Images/products/2.jpg" />
                            <img src="Images/products/3.jpg" />
                            <img src="Images/products/4.jpg" />
                            <img src="Images/products/5.jpg" />
                            <img src="Images/products/6.jpg" />
                            <img src="Images/products/7.jpg" />
                            <img src="Images/products/9.jpg" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="pagination">
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function() {

            $('.sf-menu #menu-item-2').addClass('current_page_item');


            $('#cssmenu > ul > li ul').each(function(index, e) {
                var count = $(e).find('li').length;
                var content = '<span class="cnt">' + count + '</span>';
                $(e).closest('li').children('a').append(content);
            });
            $('#cssmenu ul ul li:odd').addClass('odd');
            $('#cssmenu ul ul li:even').addClass('even');
            $('#cssmenu > ul > li > a').click(function() {
                $('#cssmenu li').removeClass('active');
                $(this).closest('li').addClass('active');
                var checkElement = $(this).next();
                if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                    $(this).closest('li').removeClass('active');
                    checkElement.slideUp('normal');
                }
                if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                    $('#cssmenu ul ul:visible').slideUp('normal');
                    checkElement.slideDown('normal');
                }
                if ($(this).closest('li').find('ul').children().length == 0) {
                    return true;
                } else {
                    return false;
                }
            });


        });
    </script>

</asp:Content>