<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultant-1-4.aspx.cs" Inherits="WebSite.Consultant_1_4" %>

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
                                    <p style="font-size: 13pt;">Nội dung Hồ sơ Bản vẽ</p>
                                    <p>
                                        1. Hồ sơ xin phép xây dựng
                                        <br />
                                        <br />
                                        - Đơn xin cấp giấy phép xây dựng (theo mẫu) do chủ đầu tư đứng tên.
                                        <br />
                                        - Bản sao có thị thực một trong những giấy tờ về quyền sử dụng đất, kèm theo trích lục bản đồ hoặc trích đo trên thực địa hoặc trên bản đồ ranh giới khu đất
                                        <br />
                                        - Giấy đăng ký kinh doanh (nếu là công trình xây dựng của doanh nghiệp)
                                        <br />
                                        - Mặt bằng công trình trên lô đất, tỷ lệ 1/100-1/500, kèm theo sơ đồ vị trí công trình 
                                        <br />
                                        - Mặt bằng các tầng, các mặt đứng và các mặt cắt công trình tỷ lệ 1/100-1/200
                                        <br />
                                        - Bản vẽ mặt bằng móng tỷ lệ 1/100-1/200 và các chi tiết mặt cắt móng tỷ lệ 1/50.Kèm theo sơ đồ hệ thống - thoát nước mưa, xử lý nước thải, cấp nước, cấp điện tỷ lệ 1/100-1/200, giải pháp gia cố, chống đỡ khi tháo dỡ công trình cũ và xây dựng công trình mới nhằm đảm bảo an toàn cho công trình liền kề và cam kết chịu trách nhiệm(đối với công trình xây xen)
                                    </p>
                                    <p>
                                        2. Hồ sơ thiết kế phương án sơ bộ 
                                        <br />
                                        <br />
                                        - Phối cảnh công trình
                                        <br />
                                        - Mặt bằng các tầng, mặt bằng mái 
                                        <br />
                                        - Mặt cắt (đối với các công trình phức tạp)
                                        <br />
                                        - Các bản vẽ, sơ đồ, thuyết minh, ...nếu cần thiết để làm rõ ý tưởng thiết kế
                                    </p>
                                    <p>
                                        3. Hồ sơ thiết kế bản vẽ thi công kiến trúc công trình
                                        <br />
                                        <br />
                                        Phần hiện trạng (đối với công trình thiết kế cải tạo)
                                        <br />
                                        Phần kiến trúc: 
                                        <br />
                                        - Tổng mặt bằng và định vị công trình 
                                        <br />
                                        - Mặt bằng các tầng, mặt bằng mái công trình 
                                        <br />
                                        - Các mặt đứng công trình
                                        <br />
                                        - Triển khai chi tiết các mặt đứng công trình 
                                        <br />
                                        - Mặt cắt công trình 
                                        <br />
                                        - Chi tiết kiến trúc công trình: Các phòng vệ sinh, cầu thang, ban công, cổng rào, cửa sổ, cửa đi...
                                        <br />
                                        - Mặt bằng lát gạch nền, sàn, sân thượng... 
                                        <br />
                                        - Chỉ định vật liệu hoàn thiện cho toàn công trình
                                        <br />
                                        Phần kết cấu: 
                                        <br />
                                        - Mặt bằng kết cấu móng, dầm sàn, cột... 
                                        <br />
                                        - Chi tiết kết cấu móng, dầm sàn, cột, cầu thang, ban công... 
                                        <br />
                                        - Bố trí cốt thép 
                                        <br />
                                        - Thống kê, chỉ định thông số kỹ thuật, các chú ý khi thi công toàn bộ hệ thống kết cấu công trình 
                                        <br />
                                        Phần cấp điện, thông tin, chống sét: 
                                        <br />
                                        - Sơ đồ hệ thống cấp điện, thông tin toàn công trình 
                                        <br />
                                        - Mặt bằng bố trí điện, thông tin các tầng nhà 
                                        <br />
                                        - Hệ thống chống sét cho công trình 
                                        <br />
                                        - Hệ thống bảo vệ (nếu có yêu cầu) 
                                        <br />
                                        - Thống kê, chỉ định thông số kỹ thuật toàn bộ hệ thống cấp điện, thông tin, chống sét công trình 
                                        <br />
                                        Phần cấp thoát nước: 
                                        <br />
                                        - Sơ đồ hệ thống cấp thoát nước toàn công trình 
                                        <br />
                                        - Mặt bằng bố trí hệ thống cấp thoát nước các tầng 
                                        <br />
                                        - Chi tiết cấp thoát nước các khu vệ sinh, bếp, ... 
                                        <br />
                                        - Thống kê, chỉ định thông số kỹ thuật toàn bộ hệ thống cấp thoát nước công trình 
                                        <br />
                                        Dự toán thi công xây dựng
                                    </p>
                                    <p>
                                        4. Hồ sơ thiết kế bản vẽ thi công nội thất công trình
                                        <br />
                                        <br />
                                        Phần hiện trạng (đối với công trình thiết kế cải tạo)
                                        <br />
                                        Phần bố trí nội thất
                                        <br />
                                        - Mặt bằng nội thất các phòng
                                        <br />
                                        - Mặt đứng khai triển nội thất các phòng
                                        <br />
                                        - Mặt bằng trần các phòng
                                        <br />
                                        - Mặt bằng nền, sàn các phòng
                                        <br />
                                        - Chỉ định hoàn thiện nội thất
                                        <br />
                                        Phần đồ và chi tiết nội thất
                                        <br />
                                        - Chi tiết đồ nội thất các phòng (giường, tủ, bàn, ghế, ...)
                                        <br />
                                        - Các chi tiết nội thất
                                        <br />
                                        - Thống kê và chỉ định hoàn thiện đồ và chi tiết nội thất
                                        <br />
                                        Phần kỹ thuật và thiết bị nội thất
                                        <br />
                                        - Hệ thống chiếu sáng, trang trí
                                        <br />
                                        - Hệ thống thông tin, bảo vệ
                                        <br />
                                        - Hệ thống cấp, thoát nước
                                        <br />
                                        - Thống kê, chỉ định thông số kỹ thuật các thiết bị lắp đặt (ổ cắm, công tắc điện, đèn, quạt, điều hoà, ...)
                                        <br />
                                        * Không bao gồm thiết kế mạng trục chính (thuộc hồ sơ thiết kế kỹ thuật thi công kiến trúc công trình)
                                        <br />
                                        Dự toán thi công xây dựng
                                    </p>
                                    <p>
                                        5. Hồ sơ thiết kế bản vẽ thi công sân vườn công trình
                                        <br />
                                        <br />
                                        - Mặt bằng hiện trạng (đối với công trình thiết kế cải tạo)
                                        <br />
                                        - Mặt bằng, mặt đứng bố trí ngoại thất, sân vườn
                                        <br />
                                        - Chi tiết cây xanh, tiểu cảnh , đồ ngoại thất, sân vườn (loại cây hoa, lối đi, bồn cây, hồ nước, ...)
                                        <br />
                                        - Chỉ định hoàn thiện trang trí ngoại thất, sân vườn
                                        <br />
                                        - Thống kê, chỉ định thông số kỹ thuật các thiết bị lắp đặt (ổ cắm, công tắc điện, đèn, tưới cây, ...)
                                        <br />
                                        * Không bao gồm thiết kế mạng trục chính (thuộc hồ sơ thiết kế kỹ thuật thi công kiến trúc công trình
                                        <br />
                                        - Dự toán thi công xây dựng

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