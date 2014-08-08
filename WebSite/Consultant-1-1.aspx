<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultant-1-1.aspx.cs" Inherits="WebSite.Consultant_1_1" %>

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
                                    <p style="font-size: 13pt;">Kiến thức cần thiết khi xây nhà</p>
                                    <p>
                                        Xây nhà là việc hệ trọng của cả đời người, một công việc khó khăn và phức tạp đối với phần lớn gia chủ. Xây được một ngôi nhà đẹp, tiện nghi với chi phí hợp lý chưa bao giờ là việc dễ dàng. Eo hẹp về tài chính chỉ là một trong nhiều nguyên nhân dẫn đến ngôi nhà không được như mong đợi. Nhìn vào bộ mặt đô thị ở Việt Nam bạn có thể nhận thấy điều đó. Chúng ta có không ít những ngôi nhà to, xây dựng tốn kém nhưng lại có quá ít những ngôi nhà đẹp. Theo chúng tôi, người dân cần phải được trang bị những kiến thức cần thiết khi xây nhà, bắt đầu từ việc ý thức được tầm quan trọng của thiết kế, sau đó là làm thế nào để tìm được một nhà thiết kế tốt, một đơn vị thi công tốt, một đơn vị giám sát tốt, ...
                                    </p>
                                    <p>
                                        Khi xây dựng Chủ đề "Kiến thức Cần thiết khi Xây nhà", chúng tôi hy vọng sẽ giúp độc giả và khách hàng có được những kiến thức bổ ích khi xây nhà. Các thông tin được cung cấp dưới đây cũng có thể đồng thời áp dụng cho nhà ở và các công trình nhỏ có nguồn vốn cá nhân khác. Quý khách có những thắc mắc cần tư vấn thêm có thể sử dụng dịch vụ Tư vấn Miễn phí của chúng tôi. Chủ đề bao gồm 08 bài viết, được sắp xếp theo trình tự của quá trình xây nhà:
                                    </p>
                                    <div style="line-height: 24px; padding-left: 10px;">
                                        <a href='Lesson.aspx?type=<%= Level %>&id=1&tab=2'><span>Bài 1 | Kế hoạch tài chính</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=2&tab=2'><span>Bài 2 | Các bước chuẩn bị đầu tiên</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=3&tab=2'><span>Bài 3 | Làm việc với kiến trúc sư</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=4&tab=2'><span>Bài 4 | Chọn nhà thầu thi công</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=5&tab=2'><span>Bài 5 | Chọn vật liệu xây dựng</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=6&tab=2'><span>Bài 6 | Công tác giám sát</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=7&tab=2'><span>Bài 7 | Tiến hành thi công</span></a><br />
                                        <a href='Lesson.aspx?type=<%= Level %>&id=8&tab=2'><span>Bài 8 | Kiểm tra, nghiệm thu và hoàn công</span></a>
                                    </div>
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

    <script type="text/javascript"> </script>

</asp:Content>