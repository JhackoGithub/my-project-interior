<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultant-1-2.aspx.cs" Inherits="WebSite.Consultant_1_2" %>

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
                                    <p style="font-size: 13pt;">Giá trị của Thiết kế Chuyên nghiệp</p>
                                    <p>
                                        1. Tầm quan trọng của thiết kế chuyên nghiệp
                                        <br />
                                        <br />
                                        Một bản thiết kế tốt phải thỏa mãn 2 tiêu chí. Đó là "Đúng" và "Đẹp".
                                        <br />
                                        <br />
                                        - Đúng: Đồ án phải có tính khả thi cao. Đáp ứng công năng sử dụng và các yêu cầu chính đáng của chủ đầu tư, tuân thủ các quy chuẩn quy phạm xây dựng, sử dụng vật liệu và công nghệ thi công phù hợp điều kiện địa phương.
                                        <br />
                                        <br />
                                        - Đẹp: Ý tưởng thiết kế tốt, hòa hợp với cảnh quan và môi trường xung quanh.
                                        <br />
                                        <br />
                                        Một bản thiết kế tốt sẽ giúp bạn quản lý, sử dụng vốn đầu tư hiệu quả và hạn chế phát sinh khi thi công xây dựng. Theo kinh nghiệm của chúng tôi thì một công trình thi công theo bản thiết kế chuyên nghiệp sẽ rất ít khi phát sinh (không kể đến phát sinh do giá cả thị trường biến động), khối lượng phát sinh nếu có thường không quá 10%. Trong khi một công trình thi công không có thiết kế hoặc thiết kế không tốt có thể phát sinh tới 20 - 30% và bạn sẽ không thể kiểm soát được các chi phí phát sinh đó. Như vậy, một khoản chi hợp lý cho thiết kế (thường chiếm không quá 10% chi phí đầu tư xây dựng, tức là chỉ bằng 1/3 đến 1/2 số tiền phát sinh nếu thi công không có thiết kế hoặc thiết kế không tốt) là cách đầu tư hiệu quả, thông minh và tiết kiệm nhất.

                                    </p>
                                    <p>
                                        2. Một số lưu ý quan trọng khi bạn sử dụng dịch vụ thiết kế
                                        <br />
                                        <br />
                                        - Bạn nên đặt ra các tiêu chí cụ thể cho việc lựa chọn công ty thiết kế. Mỗi công ty đều có những thế mạnh riêng và bạn nên tìm hiểu thật kỹ để có thể tìm ra một đối tác phù hợp nhất. Cách tốt nhất là tiếp xúc trực tiếp và đề nghị họ cho bạn tham khảo các đồ án thiết kế đã thực hiện. Tuy nhiên, bạn không nên quá chú trọng vào một bản thiết kế cụ thể nào đó mà nên đánh giá tổng quát dựa trên 3 tiêu chí quan trọng nhất: Ý tưởng Sáng tạo, Chất lượng Thiết kế và Thương hiệu Uy tín.
                                        <br />
                                        <br />
                                        - Sau khi đã "chọn mặt gửi vàng", bạn hãy đề ra các yêu cầu thiết kế và cùng với KTS hoàn thiện các yêu cầu thiết kế. Bạn phải biết là mình muốn sống trong một ngôi nhà như thế nào và phải truyền đạt cho KTS tất cả ý muốn và sở thích của mình. Nhiệm vụ của kiến trúc sư là sáng tạo nên những không gian sống thẩm mỹ và phù hợp với yêu cầu của khách hàng chứ không phải là áp đặt ý thích của mình cho khách hàng.
                                        <br />
                                        <br />
                                        - Bạn hãy cố gắng xem xét kỹ lưỡng các đề xuất của KTS. Một KTS giỏi luôn muốn mang lại cho khách hàng những giá trị thẩm mỹ và công năng nhiều hơn những gì khách hàng mong đợi. Đừng sốt ruột khi thấy KTS vẽ khác với ý mình, hãy lắng nghe KTS trình bầy, giải thích và giúp họ hiểu cặn kẽ những yêu cầu, sở thích của bạn để họ hoàn thiện phương án thiết kế. Hãy tự trả lời câu hỏi: Bạn cần một thợ vẽ hay một KTS biết sáng tạo?
                                        <br />
                                        <br />
                                        - Sau khi ưng phương án thiết kế, hãy để các KTS và KS thực hiện bổn phận của mình là triển khai hồ sơ theo đúng phương án đã được bạn chấp thuận. Một KTS giỏi đương nhiên phải có ý tưởng sáng tạo, tuy nhiên anh ta cũng cần phải có kinh nghiệm để biến ý tưởng của mình thành các bản vẽ khả thi và đúng quy chuẩn, quy phạm. Một khoản đầu tư nhỏ (khoảng 3% phí thiết kế) để thuê một đơn vị độc lập và có uy tín về chuyên môn thẩm định hồ sơ thiết kế có thể sẽ khiến bạn yên tâm hơn.
                                        <br />
                                        <br />
                                        - Bạn cần giữ liên lạc thường xuyên với công ty thiết kế trong suốt quá trình thi công công trình. Kể cả khi bạn có một đội thi công rất chuyên nghiệp thì bạn vẫn cần sự tư vấn của các KTS, KS để đảm bảo họ làm đúng thiết kế. Theo Luật thì KTS giữ bản quyền tác giả của bản thiết kế, bạn chỉ được sử dụng bản vẽ thiết kế một lần tại địa điểm xác định trong hợp đồng. Họ có trách nhiệm hướng dẫn để công trình được thi công theo đúng thiết kế và họ cũng có quyền khởi kiện nếu bạn làm sai thiết kế, sử dụng lại thiết kế cho công trình khác hoặc cho mục đích khác mà không được sự đồng ý của tác giả.

                                    </p>
                                    <p>
                                        3. Kiến trúc và môi trường cảnh quan đô thị
                                        <br />
                                        <br />
                                        Một công trình kiến trúc chỉ đẹp một cách trọn vẹn khi nó hòa hợp, tôn trọng môi trường sinh thái, môi trường cảnh quan kiến trúc đô thị và các giá trị văn hóa lịch sử và cộng đồng. Chúng tôi muốn bạn hiểu là không thể có công trình kiến trúc đẹp nếu nó phá vỡ cảnh quan chung … Một số yếu tố cần quan tâm khi thiết kế công trình là:
                                        <br />
                                        <br />
                                        - Chỉ giới xây dựng: Khoảng xây lùi và khoảng đua ra hợp lý sẽ tạo ra một khoảng trống cần thiết để có thể đảm bảo tầm nhìn quan sát công trình, làm tăng thêm diện tích cây xanh và bảo vệ các tuyến hạ tầng kỹ thuật dọc theo các tuyến đường. Khoảng cách với các công trình lân cận hợp lý sẽ tránh được những ảnh hưởng tiêu cực, đảm bảo tiện nghi sinh hoạt
                                        <br />
                                        <br />
                                        - Chiều cao: Công trình phải tuân thủ quy định về chiều cao xây dựng theo quy hoạch. Chiều cao các tầng, kể cả chiều cao của tường rào đối với các nhà ở liên kế (nhà phố) nên thống nhất.
                                        <br />
                                        <br />
                                        - Vật liệu, chất phủ và màu sắc: Phải đảm bảo hài hòa với cảnh quan chung. Hạn chế dùng những mầu sắc phản cảm, chất liệu phản xạ ánh sáng mạnh, vật liệu gây ô nhiễm môi trường. Nên sử dụng các vật liệu, chất phủ, mầu sắc thân thiện với thiên nhiên.
                                        <br />
                                        <br />
                                        - Mái: Đường viền mái của công trình là một đặc điểm đáng chú ý trong cảnh quan và có đóng góp quan trọng vào đặc trưng của khu vực. Hình thức mái phải phù hợp với đặc trưng kiến trúc công trình.

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