<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="WebSite.Lesson" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-502" class="page">
                <div class="grid_12 ">
                    <div class="tabs">
                        <ucMenuTop:MenuTop ID="menuTop" runat="server" />
                        <div class="tab-wrapper">
                            <div id="tab1" class="Consultant-info" style="display: block; float: left; margin: 10px; width: 650px;">
                                <asp:Panel runat="server" ID="Panel1" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Kế hoạch Tài chính
                                    </p>
                                    <p>
                                        Chúng ta sẽ bắt đầu bằng vấn đề thiết yếu nhất khi bạn nghĩ đến việc xây một ngôi nhà mới đó là tiền để xây nhà. Nếu bạn xem nhẹ việc lập kế hoạch chi tiêu cho việc xây nhà có thể bạn sẽ gặp khó khăn lớn khi đối diện với phát sinh hoặc kế hoạch tài chính hiện tại của gia đình bạn sẽ bị ảnh hưởng. Đừng để bạn phải chạy vạy khi nhà đang xây mà tiền mặt lại cạn do phát sinh. Hoặc giả như bạn hoàn thành ngôi nhà rồi mà tiền vốn dành cho việc chi tiêu khác cũng hết sạch... Đó cũng chỉ là một số trường hợp bạn có thể gặp phải khi không xác định trước khoản tiền chi tiêu để xây nhà.
                                    </p>
                                    <p>
                                        1. Ước tính chi phí đầu tư
                                    </p>
                                    <p>
                                        1.1. Chi phí xây dựng cơ bản
                                        <br />
                                        Đây là chi phí bạn cần để xây dựng ngôi nhà đến mức độ hoàn thiện phần kiên cố và có thể đã bao gồm các phần: Ốp lát, trần thạch cao, kệ bếp, gỗ và sơn nước trong ngoài. Theo cách tính phổ biến hiện nay, mọi người thường tính theo suất đầu tư (chí phí xây dựng cho một mét vuông sàn xây dựng), sau đó nhân với số mét vuông trên tổng diện tích sàn xây dựng thực tế của ngôi nhà. Bạn nên tham khảo số liệu thống kê về suất đầu tư từ các công ty thiết kế, thi công uy tín hoặc những người đã có kinh nghiệm xây nhà.
                                        <br />
                                        <br />
                                        1.2. Chi phí trang trí nội thất
                                        <br />
                                        Bạn có thể tính phần này bao gồm chi phí để mua thiết bị nhà tắm, bếp ga, bếp điện, máy lạnh, bàn ghế, đèn trang trí, rèm cửa và các trang thiết bị gia dụng khác cần sắm mới. Lý do chúng tôi đề nghị bạn tính riêng loại chi phí này vì đây là phần rời và hoàn toàn có thể được trang bị sau khi ngôi nhà hoàn thành. Thời gian trang bị thêm những đồ này không phụ thuộc vào thời gian xây nhà mà tuỳ vào tình hình tài chính của bạn. Một điểm nữa là bạn cũng có thể tách phần này ra khỏi công việc của nhà thầu xây dựng.
                                        <br />
                                        <br />
                                        Thực tế là việc xây dựng nhà luôn luôn có xu hướng phát sinh so với chi phí ước tính theo cách trên. Vì vậy với số tiền tạm tính trên, bạn nên dự trù thêm từ 10%-30%. Với khoản dự phòng này bạn sẽ yên tâm hơn khi trao đổi nhu cầu của mình với kiến trúc sư thiết kế rồi đến nhà thầu thi công.
                                        <br />
                                        <br />
                                        Lưu ý: Sau khi thiết kế của ngôi nhà đã hoàn thành, bạn hãy sử dụng Dự toán thi công xây dựng kèm theo Hồ sơ thiết kế để thay thế cho cách ước tính như trên. Dự toán thi công xây dựng có độ chính xác và tin cậy hơn cách ước tính chi phí.
                                    </p>
                                    <p>2. Phương án tài chính</p>
                                    <p>Hầu hết gia chủ khi quyết định xây nhà đã dự trù trước phương án tài chính. Tuy vậy trong phần này chúng tôi cũng muốn bổ sung thông tin theo tình hình hiện nay nhằm giúp các bạn có thêm phương án lựa chọn có lợi nhất cho mình. Ngoài cách truyền thống vay từ gia đình, người thân và bạn bè, bạn có thể vay tài chính từ bên ngoài để xây nhà. Đúng vậy với sự phát triển của hệ thống tài chính và ngân hàng tại Việt Nam hiện nay, bạn hoàn toàn có thể vay số tiền mà bạn cần để xây nhà bằng hình thức tín chấp hoặc thế chấp chính căn nhà đó. Chúng tôi khuyến khích bạn chọn phương án này nếu số tiền đó của bạn đang phục vụ việc kinh doanh, bạn sẽ thu lãi nhiều hơn số lãi vay. Nếu bạn quan tâm, hãy liên hệ trụ sở các ngân hàng gần nhất để biết thêm chi tiết trước khi bạn bắt đầu.</p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel2" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Các bước Chuẩn bị Đầu tiên
                                    </p>
                                    <p>
                                        Đây là những đề mục bạn nên liệt kê để thực hiện trước khi bạn tiến hành thiết kế ngôi nhà của mình. Bạn cũng có thể thuê một công ty hoặc một cá nhân để tư vấn cho bạn các vấn đề này. Tuy nhiên, chúng tôi khuyên bạn nên tự tìm hiểu và thực hiện vì hiện nay các thủ tục hành chính cho việc xây dựng đã được cải cách khá thông thoáng, thông tin cũng có thể tìm thấy dễ dàng qua mạng internet, và có thể bạn sẽ tiết kiệm được một khoản chi không cần thiết.
                                    </p>
                                    <p>
                                        1. Tìm hiểu về pháp lý liên quan đến việc sở hữu
                                        <br />
                                        Sở hữu ở đây là quyền sở hữu nhà và quyền sử dụng đất. Trên thực tế, có rất nhiều người do lịch sử gia đình, vấn đề chuyển giao giữa các thế hệ và mua đi bán lại mà việc sở hữu trở nên không rõ rãng về phương diện pháp lý. Vì thế những gì chúng tôi khuyến cáo bạn nên rà soát hiện trạng pháp lý ngôi nhà và khu đất mà bạn sẽ xây nhà mới để tránh những rắc rối khi xin phép xây dựng và thi công ngôi nhà. Nếu phát hiện ra vấn đề thì tốt nhất là nên giải quyết ổn thỏa trước khi thi công xây dựng công trình.
                                    </p>
                                    <p>
                                        2. Tìm hiểu về thông tin quy hoạch, pháp luật xây dựng và quy tắc cộng đồng
                                        <br />
                                        - Thông tin về quy hoạch tại vị trí khu đất của bạn;
                                        <br />
                                        - Những quy định bắt buộc khác của chính quyền địa phương liên quan đến khu vực xây nhà của bạn như: Khống chế tầng cao, chỉ giới xây dựng (khoảng xây lùi), diện tích sân vườn, phần sử dụng chung với các nhà xung quanh, mầu sắc, chất liệu, ...
                                        <br />
                                        - Những vấn đề quan hệ với hàng xóm như: Lối đi chung, đường, hẻm, cây xanh, ống thoát nước, ...

                                    </p>
                                    <p>
                                        3. Tìm hiểu về nhà cung cấp vật liệu xây dựng
                                        <br />
                                        Bạn nên tìm hiều từ giai đoạn này những địa điểm cung cấp vật tư xây dựng theo tiêu chí gần công trình của bạn, đủ chủng loại, giá hợp lý và có thể thanh toán từng đợt theo tiến độ nếu có thể. Điều này sẽ giúp công việc thi công của bạn thuận lợi về sau.
                                    </p>
                                    <p>
                                        4. Tìm kiếm và chọn nhà thầu thiết kế
                                        <br />
                                        Một bản thiết kế tốt là cơ sở của một ngôi nhà đẹp. "Đẹp" ở đây cần hiểu theo nghĩa rộng là đẹp về thẩm mỹ, hợp lý về sử dụng và tối ưu về chi phí đầu tư. Để có một bản thiết kế tốt thì bạn phải tìm được các kiến trúc sư, kỹ sư chuyên nghiệp. 
                                        Bạn nên đặt ra các tiêu chí cụ thể cho việc lựa chọn công ty thiết kế. Mỗi công ty đều có những thế mạnh riêng và bạn nên tìm hiểu thật kỹ để có thể tìm ra một đối tác phù hợp nhất. Cách tốt nhất là tiếp xúc trực tiếp và đề nghị họ cho bạn tham khảo các đồ án thiết kế đã thực hiện. Tuy nhiên, bạn không nên quá chú trọng vào một bản thiết kế cụ thể nào đó mà nên đánh giá tổng quát dựa trên 3 tiêu chí quan trọng nhất: Ý tưởng Sáng tạo, Chất lượng Thiết kế và Thương hiệu Uy tín.
                                    </p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel3" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Làm việc với Kiến trúc sư
                                    </p>
                                    <p>
                                        Sau khi tiến hành các bước trên, giờ là lúc bạn phải tiến hành làm việc với Kiến trúc sư (KTS). Bạn có thể tham khảo bài viết "Giá trị của Thiết kế Chuyên nghiệp" để cân nhắc lựa chọn một KTS phù hợp nhất với bạn. Sau khi đã "chọn mặt gửi vàng", bạn hãy đề ra các yêu cầu thiết kế và cùng với KTS hoàn thiện các yêu cầu thiết kế. Bạn phải biết là mình muốn sống trong một ngôi nhà như thế nào và phải truyền đạt cho KTS tất cả ý muốn và sở thích của mình. Nhiệm vụ của kiến trúc sư là sáng tạo nên những không gian sống thẩm mỹ và phù hợp với yêu cầu của khách hàng chứ không phải là áp đặt ý thích của mình cho khách hàng. Một quy trình thiết kế chuyên nghiệp thường bao gồm các bước sau:
                                    </p>
                                    <p>
                                        1. Trao đổi về yêu cầu thiết kế
                                        <br />
                                        <br />
                                        - Trình bày với KTS về yêu cầu sử dụng của các tầng, ý tưởng thẩm mỹ của bạn và gia đình, thời gian khởi công, thời gian mong muốn hoàn thành thi công, ngân sách tối đa bạn có thể dành cho ngôi nhà của mình, ...; 
                                        <br />
                                        - Nếu có băn khoăn hay thắc mắc về bất cứ vấn đề gì, hãy trình bầy cặn kẽ;
                                        <br />
                                        - Nếu có sở thích hay điều tối kỵ nào liên quan đến căn nhà (chẳng hạn vấn đề phong thuỷ như: Hướng đất, hướng nhà, cách bố trí phòng bếp, phòng ngủ, phòng thờ cúng, ...) bạn cũng nên thảo luận cùng KTS ở bước này;
                                        <br />
                                        - Sau khi trình bày ý kiến, bạn nên lắng nghe lời khuyên của KTS vì có thể một số yêu cầu đó không phù hợp yêu cầu thẩm mỹ và độ an toàn. Sau đó cùng với KTS hoàn thiện các yêu cầu thiết kế;
                                        <br />
                                        <br />
                                        Lưu ý: 
                                        <br />
                                        - Theo kinh nghiệm của chúng tôi thì rất ít khách hàng có thể trình bầy rõ ràng và đầy đủ các yêu cầu của mình. Vấn đề là họ không thể hình dung đầy đủ về căn nhà của mình khi chưa có những bản vẽ cụ thể. Thực tế, có tới 70% khách hàng chỉ có được hình dung được căn nhà và đưa các yêu cầu cụ thể, chính xác sau lần báo cáo phương án đầu tiên. Vì vậy, các yêu cầu thiết kế cần phải được bổ xung, hoàn thiện trong quá trình thiết kế.
                                        <br />
                                        - Bạn nên tìm hiểu qua những thuật ngữ xây dựng để có thể đọc hiểu bản vẽ và giao tiếp với KTS.
                                    </p>
                                    <p>
                                        2. Khảo sát hiện trạng khu đất
                                        <br />
                                        <br />
                                        Sau khi tiếp nhận yêu cầu thiết kế, KTS sẽ tiến hành khảo sát hiện trạng khu đất và lập hồ sơ hiện trạng để phục vụ thiết kế. Các công việc chủ yếu là:
                                        <br />
                                        - Khảo sát, kiểm tra hình dáng và kích thước khu đất. Đối với những khu đất có hình dáng đơn giản và thuận tiện cho việc đo vẽ, KTS có thể giúp bạn việc đo vẽ hiện trạng. Tuy nhiên, nếu khu đất phức tạp và khó đo vẽ, bạn sẽ phải thuê một đơn vị khảo sát chuyên nghiệp để đo vẽ bản đồ hiện trạng;
                                        <br />
                                        - Khảo sát các công trình, vật kiến trúc xung quanh khu đất, các tuyến đường, lối vào, ...
                                    </p>
                                    <p>
                                        3. Thiết kế phương án sơ bộ
                                        <br />
                                        <br />
                                        Đây là giai đoạn rất quan trọng, bạn và KTS sẽ thống nhất ý tưởng thiết kế chủ đạo cho căn nhà của mình. Việc thiết kế phương án sơ bộ là sự lặp đi, lặp lại của quá trình sau: ... KTS thiết kế phương án > Trình bầy với bạn > Bạn góp ý, phản biện > KTS giải thích, ghi nhận > KTS điều chỉnh thiết kế > Trình bầy với bạn > ...
                                        <br />
                                        Bạn hãy cố gắng xem xét kỹ lưỡng các đề xuất của KTS. Một KTS giỏi luôn muốn mang lại cho khách hàng những giá trị thẩm mỹ và công năng nhiều hơn những gì khách hàng mong đợi. Đừng sốt ruột khi thấy KTS vẽ khác với ý mình, hãy lắng nghe KTS trình bầy, giải thích và giúp họ hiểu cặn kẽ những yêu cầu, sở thích của bạn để họ hoàn thiện phương án thiết kế.
                                        <br />
                                        <br />
                                        Lưu ý:
                                        <br />
                                        - Công việc thiết kế ngôi nhà của bạn thường gồm 2 phần: Thiết kế kiến trúc và Thiết kế nội thất. Một KTS chuyên nghiệp sẽ thực hiện việc thiết kế phương án sơ bộ kiến trúc trước, sau khi bạn thống nhất họ sẽ triển khai đồng thời việc thiết kế chi tiết (thiết kế bản vẽ thi công) phần kiến trúc và thiết kế phương án sơ bộ nội thất. Như vậy, KTS có thể cập nhật các thông số chính xác của phần kiến trúc vào thiết kế sơ bộ nội thất, giúp cho phương án nội thất có tính khả thi và chính xác hơn.
                                        <br />
                                        - Hồ sơ thiết kế phương án sơ bộ thường bao gồm phối cảnh và các mặt bằng, có thể có thêm mặt cắt đối với công trình phức tạp.
                                    </p>
                                    <p>
                                        4. Thiết kế xin phép xây dựng
                                        <br />
                                        <br />
                                        Hồ sơ thiết kế xin phép xây dựng sẽ được nộp cho cơ quan quản lý xây dựng địa phương cùng với các giấy tờ liên quan tới sở hữu để xin cấp giấy phép xây dựng. Sau khi bạn thống nhất phương án sơ bộ kiến trúc là có thể triển khai lập hồ sơ này.
                                        <br />
                                        <br />
                                        Lưu ý:
                                        <br />
                                        - Thẩm quyền cấp phép xây dựng thuộc về sở xây dựng cấp tỉnh, thành phố hoặc phòng quản lý xây dựng cấp quận, huyện tùy theo vị trí và quy mô xây dựng công trình;
                                        <br />
                                        - Công ty thiết kế phải có pháp nhân và đăng ký kinh doanh phù hợp, cá nhân KTS thiết kế phải có chứng chỉ hành nghề. Các bản sao có công chứng các giấy tờ trên bạn sẽ phải nộp cho cơ quan cấp phép xây dựng cùng với hồ sơ.
                                    </p>
                                    <p>
                                        5. Thiết kế bản vẽ thi công
                                        <br />
                                        <br />
                                        Hồ sơ thiết kế bản vẽ thi công (hay còn gọi là hồ sơ thiết kế chi tiết) bao gồm các bản vẽ và dự toán thi công xây dựng là kết quả cuối cùng của quá trình thiết kế. Nguyên tắc của việc thiết kế hồ sơ bản vẽ thi công là phải đảm bảo để có thể thi công công trình theo đúng thiết kế và có thể lập được dự toán thi công xây dựng. Thành phần chính của hồ sơ bao gồm:
                                        <br />
                                        - Toàn bộ các bản vẽ mặt bằng các tầng (bao gồm cả mặt bằng lát sàn);
                                        <br />
                                        - Toàn bộ các bản vẽ mặt cắt qua nhà, các mặt đứng của nhà;
                                        <br />
                                        - Các bản vẽ chi tiết cấu tạo kiến trúc (cầu thang, cửa, khu vệ sinh, ban công, ...);
                                        <br />
                                        - Các bản vẽ tính toán kết cấu chịu lực của công trình;
                                        <br />
                                        - Các bản vẽ hệ thống kỹ thuật công trình (cấp điện và chiếu sáng, cấp thoát nước, thông tin, điều hòa và thông gió, chống sét, ...)
                                        <br />
                                        - Dự toán thi công xây dựng.
                                        <br />
                                        <br />
                                        Tất cả hồ sơ phải được đóng gọn gàng theo thứ tự của phần danh mục bản vẽ kèm theo, có chữ ký của các KTS, kỹ sư thiết kế và đóng dấu của công ty thiết kế.
                                        <br />
                                        <br />
                                        Lưu ý:
                                        <br />
                                        - Một khoản đầu tư nhỏ (khoảng 3% phí thiết kế) để thuê một đơn vị độc lập và có uy tín về chuyên môn thẩm định hồ sơ thiết kế có thể sẽ khiến bạn yên tâm hơn;
                                        - Để đảm bảo cho những chi tiết của thiết kế mà bạn và kiến trúc sư đã thống nhất, bạn có thể sử dụng những minh họa, hình chụp công trình mẫu, hình vẽ 3D để ràng buộc trong hợp đồng với nhà thầu thi công về sau.

                                    </p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel4" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Chọn Nhà thầu Thi công
                                    </p>
                                    <p>
                                        Theo Luật xây dựng thì nhà thầu trong hoạt động xây dựng là tổ chức, cá nhân có đủ năng lực hoạt động xây dựng, năng lực hành nghề xây dựng. Vì thế bạn hoàn toàn có quyền yêu cầu nhà thầu đưa ra các giấy tờ chứng minh năng lực hoạt động xây dựng năng lực hành nghề xây dựng của nhà thầu. Bạn cũng nên tham khảo với KTS về việc lựa chọn nhà thầu và nội dung hợp đồng ký kết với nhà thầu. Bạn có thể tham khảo một số tiêu chí sau cho việc lựa chọn nhà thầu:
                                    </p>
                                    <p>
                                        1. Tiêu chí kinh nghiệm và trình độ của nhà thầu
                                        Đánh giá chỉ tiêu này bạn cần tổng hợp thông tin từ nhiều nguồn. Một trong những nguồn đó chính là việc kiểm tra các công việc thực tế mà nhà thầu đã thực hiện. Bạn có thể yêu cầu nhà thầu đưa đến tham quan một số công trình tiêu biểu có phong cách và quy mô gần giống yêu cầu của Bạn. Bạn hãy trực tiếp hỏi chuyện các chủ nhà cũng như quan sát tỉ mỉ căn nhà đó nhằm rút ra nhận định của riêng bạn. Bên cạnh đó hãy yêu cầu nhà thầu đưa ra phương án thi công công trình và phương án điều động nhân công theo tiến độ. Phương án cần tính đến các điều kiện thực tế (hiện trường, công trình, đường vận chuyển vật liệu, ...).
                                    </p>
                                    <p>
                                        2. Tiêu chí thời gian
                                        Thực tế đây là mục nổi bật trong phương án thi công. Chúng tôi tách riêng nhằm nhấn mạnh tính quan trọng của tiêu chí này. Bạn cần thoả thuận với nhà thầu tiến độ công trình chi tiết và yêu cầu vật liệu từng thời điểm. Bảng tiến độ này sẽ là căn cứ để chủ nhà kiểm tra đôn đốc và hai bên tiến hành quyết toán theo hạng mục công việc thực hiện. Thông thường với dạng nhà phố đơn giản, điều kiện thi công thuận lợi thì quá trình thi công thường kéo dài trong khoảng 5 - 6 tháng. Với các công trình đòi hỏi hoàn thiện cầu kỳ hơn, nhà biệt thự có thể kéo dài tới 01 năm hoặc lâu hơn nữa.
                                    </p>
                                    <p>
                                        3. Tiêu chí giá cả
                                        Thị trường xây dựng nhà dân dụng hiện nay thường phân ra hai hình thức nhận thầu, tương ứng với 2 mức giá khác nhau:
                                
                                        <br />
                                        - Hình thức nhận thầu nhân công (khoán công - chủ nhà lo vật liệu): gồm nhân công cho các phần việc xây thô, hoàn thiện tuỳ theo sự thoả thuận giữa chủ nhà và nhà thầu. Tuy nhiên để có được mức giá sát thị trường, bạn nên tham khảo từ kiến trúc sư của mình tại thời điểm xây dựng. Các nhóm nhân công chính bao gồm: Nhân công đào móng, đóng cọc, đóng côp pha, đổ bê tông, thợ xây tô, thợ ốp lát, thợ điện, thợ mộc, thợ nước, thợ sơn, ...</>
                                        <br />
                                        - Hình thức nhận thầu toàn bộ cả nhân công và vật liệu (khoán trắng hay chìa khóa trao tay): Mức giá có sự dao động rất lớn do yêu cầu vật liệu của chủ nhà. Khi tiến hành hợp đồng với nhà thầu, chủ nhà cần nêu chỉ tiêu các điều kiện về vật liệu, sử dụng (xây thô và hoàn thiện) với các yếu tố: Mức giá tối thiểu, chủng loại, phẩm cấp, hạn mức sử dụng, xuất xứ và nhãn hiệu, ... Hợp đồng về vật liệu càng chi tiết bao nhiêu, việc thanh quyết toán và quan hệ giữa chủ nhà và nhà thầu càng thuận lợi bấy nhiêu.
                                    </p>
                                    <p>
                                        Lưu ý: Trong hợp đồng với nhà thầu, ngoài các điều kiện cơ bản, bạn nên lưu ý đề cập thêm những điều khoản sau:
                                
                                        <br />
                                        - Quy định an toàn lao động và bảo hiểm;
                                        <br />
                                        - Quy định tuân thủ nội quy sinh hoạt địa phương;
                                        <br />
                                        - Hình thức và thời hạn thanh toán (theo tiến độ hay theo thời gian và khối lượng công trình);
                                        <br />
                                        - Điều khoản liên quan đến bên giám sát xây dựng (nếu có);
                                        <br />
                                        - Điều khoản về cách tính chi phí phát sinh khi có thay đổi trong quá trình xây;
                                        <br />
                                        - Nếu có thể thương lượng được bạn nên yêu cầu nhà thầu ký quỹ bảo lãnh tại ngân hàng. Số tiền và thời gian bảo hành (tuỳ theo thương lượng) nhằm đảm bảo chất lượng xây dựng sau khi ngôi nhà xây xong.
                                    </p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel5" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Chọn Vật liệu Xây dựng
                                    </p>
                                    <p>Chọn vật liệu xây dựng (VLXD) là công việc khó khăn với tất cả mọi người. Dù bạn chọn phương án khoán công hay khoán trắng bạn vẫn nên tìm hiểu kỹ về VLXD. Vật liệu xây dựng quan trọng nhất là cát, gạch, thép, đá, nước và xi măng. Chúng tôi sẽ liệt kê một số điểm quan trọng để giúp bạn có được những tiêu chuẩn chung và có thể chọn từ những cái có sẵn.</p>
                                    <p>
                                        1. Xi măng
                                        Xi măng là một chất gắn kết các thành phần cát, đá và nước lại với nhau để hình thành đá nhân tạo (bê tông). Xi măng là thành phần quan trọng nhất trong công tác xây tô, và đổ bê tông. Chọn xi măng thích hợp sẽ đảm bảo sự vững chắc cho công trình xây dựng. Nên lựa chọn nhãn hiệu xi măng uy tín, có danh tiếng và được sự tin tưởng của nhà thầu cũng như kiến trúc sư.
                                        <br />
                                        Có thể phải tốn thêm chi tiết rất lớn sau này để sửa chữa nếu như tiết kiệm một vài nghìn đồng khi mua xi măng để xây rồi bạn không thể thay thế hoặc cải thiện nó như với mái ngói hoặc với một số các thứ khác. Nếu nó kém chất lượng bạn phải đập bỏ để làm lại. Chi phí mua xi măng chỉ chiếm một phần nhỏ trong tổng giá trị của công trình. Thông thường xi măng chiếm khoảng 7% - 9% tổng giá trị công trình. Vì vậy khi lựa chọn xi măng, bạn hãy chắc chắn mình đã quyết định đúng.
                                    </p>
                                    <p>
                                        2. Cát
                                        Cát chất lượng có thể được xác định một cách dễ dàng bằng cách lấy một vốc cát rồi nắm tay lại. Bầt kỳ chất bẩn nào (như bùn) sẽ dính lại vào lòng bàn tay bạn. Trong cát có đất sét, sạn hay các chất bẩn khác có thể sẽ làm ảnh hưởng đến công trình. Chúng cần được sàng lọc ra khỏi cát trước khi sử dụng. Một phương pháp kiểm tra khoa học hơn cách trên là đổ cát vào nửa bình thuỷ tinh, thêm một ít nước vào rồi quấy lên. Cát sẽ lắng xuống đáy, cát chất bẩn sẽ xuất hiện rõ. Có một nguyên tắc là nếu hàm lượng bùn hoặc bụi bẩn vượt quá 3% tổng trọng lượng cát thì cát đó cần được làm sạch trước khi sử dụng. Tóm lại cát chất lượng là cát không thể chứa đất sét, chất bẩn, mica hay vỏ sò, ... Không nên sử dụng cát nhiễm phèn hoặc nhiễm mặn trong bê tông và xây thô.
                                    </p>
                                    <p>
                                        3. Đá
                                        Cốt liệu thô thường là những viên đá nhỏ tăng thêm sức chịu lực của bê tông. Đá sử dụng cho bê tông thông dụng hiện nay là đá 1x2 (kích thước hạt lớn nhất 20mm - 25mm).Cốt liệu đá phải sạch tạp chất khi đưa vào trộn bê tông
                                        Trong khi lựa chọn đá, bạn cần lưu ý những yếu tố sau:
                                        <br />
                                        - Đá thông dụng có dạng hình khối, không có nhiều tạp chất và ít thành phần hạt dẹt;
                                        <br />
                                        - Cần loại bỏ ngay lập tức các tạp chất bằng cách sàng và rửa;
                                    </p>
                                    <p>
                                        4. Nước
                                        Nếu bạn sử dụng nước máy từ hệ thống cấp nước thì không cần phải lo. Trường hợp bạn dùng nước giếng hay nguồn khác thì nước cần phải sạch, không có chất bẩn. Tuyệt đối không dùng nước biển, nước phèn, nước ao hồ, nước lợ, nước có váng dầu, mỡ để xây nhà. Lượng nước phù hợp với tỷ lệ xi măng sẽ giúp công trình vững chắc.
                                    </p>
                                    <p>
                                        5. Bê tông và vữa
                                        Bê tông là loại vật liệu đá nhân tạo được hình thành bằng cách đổ khuân và làm rắn chắc hỗn hợp với tỷ lệ hợp lý của các thành phần gồm xi măng, nước, cát và phụ gia nếu có. Trong đó:
                                        - Đá và cát (cốt liệu) đóng vai trò là bộ khung chịu lực;
                                        <br />
                                        - Chất kết dính và nước (hồ) bao bọc xung quanh hạt cốt liệu đóng vai trò là chất bôi trơn và đồng thời lắp đầy các khoảng trống giữa các hạt cốt liệu;
                                        <br />
                                        - Vữa là hỗn hợp gồm cát, xi măng và nước theo một tỷ lệ nhất định;
                                        Bạn cũng cần lưu ý đến công tác bảo dưỡng. Chất lượng bê tông và vữa sẽ giảm (cường độ không đạt thiết kế ) nếu không có chế độ bảo dưỡng hợp lý và đúng cách:
                                        - Đối với vữa xây tô: nên bảo dưỡng ẩm liên tục từ 7-10 ngày
                                        - Đối với bê tông: Nên bảo dưỡng liên tục từ 10-14 ngày
                                        <br />
                                        Lưu ý:
                                        <br />
                                        - Nên sử dụng bê tống mác ≥250 (tỷ lệ 2:3:5 - 1 bao xi măng + 3 thùng đá) đối với các cấu kiện: Cọc bê tông cốt thép, móng, đá kiềng, công trình ngầm, cột, sàn sân thượng;
                                        <br />
                                        - Nên sử dụng mác bê tông ≥ 200 ( tỷ lệ 1:2:3 - 1 bao xi măng + 4 thùng cát + 6 thùng cát) đối với các chi tiết còn lại;
                                        <br />
                                        - Vữa xây sử dụng tỷ lệ: 8 thùng cát (tỷ lệ 1:4), cát sử dụng có độ lớn ≥ 2 (sử dụng cát bê tông càng tốt).
                                        <br />
                                        - Vữa tô sử dụng tỷ lệ: 10 thùng cát (tỷ lệ 1:5), nếu sử dụng cát quá nhỏ nên dùng tỷ lệ 1:4 hoặc 1: 4.5;
                                        <br />
                                        - "Thùng" ở đây là thùng sơn hoặc xô 18 lít. Lưu ý là các xô tôn thường có dung tích nhỏ hơn.
                                    </p>
                                    <p>
                                        6. Gạch
                                        Gạch có thể kiểm tra được thông qua quan sát. Thường có thì gạch tốt cần phải có hình dạng chuẩn với những góc cạnh sắc. Màu sắc tương đồng nhau cùng bảo đảm chất lượng tốt. Và sau đây là các cách kiểm tra gạch chất lượng:
                                        <br />
                                        - Khi làm vỡ một viên gạch, nó sẽ không vỡ vụn ra thành nhiều mãnh nhỏ;
                                        <br />
                                        - Đập 2 viên gạch vào nhau, gạch chất lượng sẽ phát ra âm thanh dứt khoát;
                                        <br />
                                        - Thử làm rơi một viên gạch ở độ cao khoảng 1 mét, gạch tốt sẽ không bị vỡ;
                                        <br />
                                        - Ngâm viên gạch vào trong nước khoảng 24 h sau đó kiểm tra trọng lượng của nó. Nếu trọng lượng nặng thêm hơn 15% bạn không nên sử dụng loại gạch này.
                                    </p>
                                    <p>
                                        7. Thép
                                        Bê tông có sức chịu lực nén tốt những chịu lực kéo và lực uốn kém. Để khắc phục điều này thanh thép cần phải được đặt trong bê tông để có thêm sức chịu lực cần thiết. Do đó mới xuất hiện thuật ngữ bê tông cốt thép. Hãy lựa chọn thép từ những thương hiệu uy tín trên thị trường. Bạn nên tham khảo kích cỡ và chủng loại thép từ kiến trúc sư của bạn.
                                        <br />
                                        Lưu ý: 
                                        Thép xây dựng gia công thường có đường kính nhỏ hơn thông số ghi trên thanh thép. VD: Thông số là phi 12 thì thực tế chỉ là phi 10.
                                    </p>
                                    <p>
                                        8. Cốp pha
                                        Cốp pha được sử dụng để làm khuôn đổ bê tông. Cốt pha phải đúng kích thước thiết kế mới đảm bảo được khả năng chịu lực của bê tông. Thực tế đây là việc của nhà thầu. Bạn có thể lưu ý với giám sát của bạn vấn đề này khi tiến hành xây dựng.
                                    </p>
                                    <p>
                                        9. Thiết bị điện, nước
                                        Các thiết bị này sẽ được lắp đặt bên trong công trình vì thế bạn nên chọ những sản phẩm có xuất xứ và chất lượng uy tín đồng thời có thiết kế phù hợp với ngôi nhà.
                                    </p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel6" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Công tác Giám sát
                                    </p>
                                    <p>Công tác giám sát bao gồm Giám sát Tác giả (GSTG) của KTS thiết kế và Giám sát Thi công (GSTC) do chủ đầu tư hoặc đơn vị tư vấn do chủ đầu tư thuê thực hiện. Đối với GSTG, tác giả thiết kế sẽ chỉ có mặt tại công trường khi thi công các công đoạn chính theo yêu cầu của chủ đầu tư hoặc để xử lý các sai sót trong hồ sơ thiết kế. Ngược lại, đối với GSTC, giám sát viên phải có mặt thường xuyên tại công trình để theo dõi, giám sát, hướng xử lý kịp thời các phát sinh và ghi nhật ký công trường.</p>
                                    <p>
                                        1. Giám sát Tác giả
                                        <br />
                                        KTS hoặc đại diện của KTS có quyền và trách nhiệm giám sát tác giả để đảm bảo công trình được thi công theo đúng thiết kế của họ, bao gồm cả việc giải thích về hồ sơ thiết kế với đơn vị thi công và giám sát thi công. Các công việc này được thực hiện theo một lịch trình được thỏa thuận với chủ đầu tư. Thường ở các công đoạn: Đào và xử lý móng, hoàn thành cốt thép và chuẩn bị đổ bê tông các cấu kiện chính, hoàn thiện các chi tiết quan trọng, ... Chi phí cho giám sát tác giả thường đã nằm trong chi phí thiết kế, trừ khi hai bên có thỏa thuận khác.
                                    </p>
                                    <p>
                                        2. Giám sát Thi công
                                    </p>
                                    <p>
                                        2.1 Nhiệm vụ chính của công tác giám sát
                                        <br />
                                        - Kiểm tra công việc và chất lượng thi công của nhà thầu;
                                        <br />
                                        - Theo dõi vật tư, yêu cầu nhà thầu thực hiện đúng mức vật tư, tránh lãng phí hoặc không đảm bảo chất lượng;
                                        <br />
                                        - Tiến hành nghiệm thu từng hạng mục công việc, thúc đẩy thi công đảm bảo thực hiện đúng tiến độ;
                                        <br />
                                        - Kiểm tra thực hiện an toàn lao động;
                                    </p>
                                    <p>
                                        2.2 Các hình thức Giám sát
                                        <br />
                                        - Tự giám sát: Chủ nhà có thể là người “đóng vai” giám sát hoặc nhờ người thân đảm nhận việc giám sát nếu có chuyên môn và hiểu biết thật sự về xây dựng;
                                        <br />
                                        - Thuê công ty tư vấn giám sát: Đây là những đơn vị có chuyên môn và giấy phép hành nghề giám sát theo quy định luật pháp.
                                    </p>

                                    <p>
                                        2.3 Vì sao cần bên giám sát
                                        <br />
                                        Vì đây là bên thay mặt và bảo vệ quyền lợi chủ nhà đồng thời họ cũng đủ trình độ và chuyên môn để nói chuyện “kỹ thuật” với nhà thầu, đảm bảo thi công đúng chất lượng. Tuỳ thuộc vào gói thầu mà phần việc của giám sát có bao gồm giám sát vật tư hay là không.
                                    </p>
                                    <p>
                                        2.4 Giá thuê giám sát
                                        <br />
                                        Chi phí thuê giám sát từ thường dao động trong khoảng 2% - 3% giá trị công trình. Đối với những công trình nhỏ có thể thỏa thuận theo mức lương tháng, tuần hoặc ngày. Thông tin trên chỉ mang tính chất tham khảo, bạn nên cập nhật thời giá từ các công ty tư vấn giám sát tại thời điểm thuê.
                                        <br />
                                        Lưu ý:
                                        <br />
                                        - Bạn nên tránh việc thuê đơn vị giám sát do chủ thầu giới thiệu để đảm bảo tính khách quan. Hãy hỏi người thân hoặc tham khảo ý kiến từ kiến trúc sư thiết kế;
                                        <br />
                                        - Chỉ nên tự giám sát hay giao cho người thân nếu có đủ kiến thức về chuyên môn. Nếu không am tường về kỹ thuật, không những không được việc mà bạn còn có thể làm ảnh hưởng đến tiến độ, chất lượng công trình.
                                    </p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel7" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Tiến hành Thi công
                                    </p>
                                    <p>
                                        Bây giờ là lúc bạn có thể khởi công xây dựng công trình. Thực tế đây là công đoạn phức tạp và kéo dài, nhưng bạn không cần phải tìm hiểu quá kỹ vì đây là những công việc thuần túy kỹ thuật, và thường đã có những kỹ sư giám sát đảm trách. Trong phần này chúng tôi chỉ liệt kê các hạng mục theo thứ tự trước và sau nhằm giúp bạn tiện theo dõi và kiểm tra trong quá trình xây nhà. Việc này cũng nhằm giúp bạn chủ động hơn trong trường hợp thay đổi thiết kế hay vật liệu xây dựng và trang trí.
                                    </p>
                                    <p>
                                        1. Chuẩn bị mặt bằng
                                        <br />
                                        - Thuê và dọn nhà sang chỗ ở tạm trong quá trình xây để giải phóng mặt bằng nếu xây trên nền nhà cũ;
                                        <br />
                                        - Phá dỡ nhà cũ (nếu có);
                                        <br />
                                        - Tập kết vật liệu xây dựng;
                                        <br />
                                        - Lán trại cho công nhân;
                                        <br />
                                        - Hàng rào che chắn, bạt phủ, vách ngăn cho công trình;
                                        <br />
                                        - Cung cấp nguồn điện và nước phục vụ công việc xây dựng.
                                    </p>
                                    <p>
                                        2. Thi công xây dựng
                                    </p>
                                    <p>
                                        2.1 Phần xây thô
                                        <br />
                                        - Đào móng, đóng cọc cừ tràm hay ép cọc bê tông (nếu có);
                                        <br />
                                        - Làm móng công trình ngầm (hố ga) đường ống đường thoát nước và hầm nhà;
                                        <br />
                                        - Thi công khung nhà (cột, dầm, sàn) đường ống điện, ống nước, máy lạnh, cáp TV, ...
                                        <br />
                                        - Xây tô (gạch nhúng nước);
                                        <br />
                                        - Cất mái;
                                        <br />
                                        - Lắp điện, nước, mộc;
                                        <br />
                                        - Bảo dưỡng các cấu kiện trong suốt quá trình làm móng, xây tô, khung nhà, mái, ...
                                        <br />
                                        - Làm vệ sinh, chuẩn bị cho phần hoàn thiện.
                                    </p>
                                    <p>
                                        2.2 Phần hoàn thiện
                                        <br />
                                        - Sơn, lát gạch, đóng trần;
                                        <br />
                                        - Lắp đặt thiết bị (bồn nước, vệ sinh, bóng đèn, máy lạnh, ...)
                                        <br />
                                        - Làm mộc cửa, cầu thang, bếp;
                                        <br />
                                        - Các phần nội thất khác như rèm cửa, tủ âm tường, ...
                                    </p>

                                    <p>
                                        2.3 Kiểm tra, xử lý sai sót
                                        <br />
                                        - Tổng kiểm tra nhà từ trên xuống dưới;
                                        <br />
                                        - Làm đẹp và xử lý những chỗ sai sót;
                                        <br />
                                        - Vệ sinh công nghiệp trước khi bàn giao.
                                    </p>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="Panel8" Visible="False">
                                    <p style="font-size: 13pt;">
                                        Kiểm tra, Nghiệm thu và Hoàn công
                                    </p>
                                    <p>
                                        Công việc Kiểm tra, Nghiệm thu là những công tác quan trọng để đảm bảo chất lượng thi công, giải quyết kịp thời các vấn đề phát sinh ảnh hưởng đến chất lượng công trình và là cơ sở để quyết toán công trình. Công việc Hoàn công sẽ giúp bạn có được những thông tin lưu trữ chân thực nhất của công trình đã hoàn thành. Hãy luôn ý thức tuân thủ tuyệt đối các trình tự dưới đây để việc thi ngôi nhà của bạn được thuận lợi và đạt chất lượng cao nhất.
                                    </p>
                                    <p>
                                        1. Kiểm tra
                                        <br />
                                        <br />
                                        Việc kiểm tra phải được thực hiện liên tục trong suốt quá trình xây nhà, giám sát viên hoặc chủ nhà nên thường xuyên kiểm tra khối lượng chất lượng, quy cách, kiểu dáng, ... Khi công trình hoàn thành và trước khi nhận bàn giao, chủ nhà nên cùng giám sát và chủ thầu kiểm tra đối chiếu lại so với bản vẽ, những nội dung phát sinh nếu có phải được kê thật chi tiết.
                                        <br />
                                        <br />
                                        Lưu ý:<br />
                                        Bạn nên kiểm tra chính công việc của người giám sát thi công, hãy đảm bảo rằng họ làm việc với sự cần mẫn, khách quan và liêm chính.

                                    </p>
                                    <p>
                                        2. Nghiệm thu
                                        <br />
                                        <br />
                                        Việc nghiệm thu phải được thực hiện đối với từng công việc từng bộ phận, từng hạng mục công trình, và toàn bộ công trình để đưa vào sử dụng theo quy định của pháp luật. Các bộ phận bị che khuất của công trình phải được nghiệm thu và vẽ bản vẽ hoàn công trước khi tiến hành các công việc tiếp theo. Những giấy tờ này cũng là cơ sở pháp lý để xin hoàn công sau đó. Bạn hãy căn cứ vào thoả thuận và hợp đồng của các bên để tiến hành nghiệm thu một cách cẩn trọng và chi tiết. Việc nghiệm thu được thực hiện bởi ít nhất các bên sau: Chủ đầu tư, nhà thầu thi công, giám sát thi công và phải lập thành các biên bản được đánh số thứ tự theo trình tự thời gian.
                                        <br />
                                        <br />
                                        Lưu ý:<br />
                                        Các biên bản nghiệm thu chính là căn cứ để thanh quyết toán hợp đồng thi công. Nếu bạn gặp khó khăn, hãy tham vấn ý kiến của KTS hoặc các chuyên gia.
                                    </p>
                                    <p>
                                        3. Hoàn công
                                        <br />
                                        <br />
                                        Hồ sơ hoàn công là các bản vẽ, ảnh chụp, ghi chép lại tình trạng thực tế của công trình, của bộ phận công trình bao gồm cả các hệ thống kỹ thuật bị che khuất. Bạn có thể thắc mắc là hồ sơ này dùng để làm gì?
                                        <br />
                                        <br />
                                        - Thủ tục hoàn công hay thủ tục hoàn tất thi công là một phần quan trọng nhất để có sổ hồng. Hồ sơ hoàn công sẽ được làm theo quy định và nộp tại cơ quan thẩm quyền (Phòng quản lý đô thị quận, huyện hoặc cơ quan có thẩm quyền khác theo quy định của pháp luật);
                                        <br />
                                        <br />
                                        - Hồ sơ hoàn công cũng được sử dụng khi cần bảo dưỡng, sửa chữa, cải tạo công trình. Việc chỉ sử dụng hồ sơ thiết kế cho mục đích này có thể gây ra những sai sót vì thực tế không có công trình nào được thi đúng 100% theo hồ sơ thiết kế mà bao giờ cũng có những sai lệch do trình độ và công nghệ thi công, do thay đổi điều chỉnh trong quá trình thi công.

                                    </p>
                                </asp:Panel>
                            </div>
                            <div id='cssmenu' style="float: left; width: 265px;">
                                <ul>
                                    <li class='has-sub'><a href='#'><span>Các bài liên quan</span></a>
                                        <ul>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=1&tab=2'><span>Bài 1 | Kế hoạch tài chính</span></a></li>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=2&tab=2'><span>Bài 2 | Các bước chuẩn bị đầu tiên</span></a></li>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=3&tab=2'><span>Bài 3 | Làm việc với kiến trúc sư</span></a></li>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=4&tab=2'><span>Bài 4 | Chọn nhà thầu thi công</span></a></li>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=5&tab=2'><span>Bài 5 | Chọn vật liệu xây dựng</span></a></li>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=6&tab=2'><span>Bài 6 | Công tác giám sát</span></a></li>
                                            <li><a href='/Lesson.aspx?type=<%= Level %>&id=7&tab=2'><span>Bài 7 | Tiến hành thi công</span></a></li>
                                            <li class='last'><a href='/Lesson.aspx?type=<%= Level %>&id=8&tab=2'><span>Bài 8 | Kiểm tra, nghiệm thu và hoàn công</span></a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="img-bottom-info">
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
                <div class="pagination">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function() {
            var page = window.location.pathname;
            var type = getParameterByName('type');
            var id = getParameterByName('id');
            var tab = getParameterByName('tab');
            var url = page + "?type=" + type + "&id=" + id + "&tab=" + tab;
            $('#cssmenu ul li ul li a').each(function() {
                var link = $(this).attr('href');
                if (link.indexOf(url) >= 0) {
                    $(this).children().addClass('active');
                }
            });
        });
    </script>
</asp:Content>