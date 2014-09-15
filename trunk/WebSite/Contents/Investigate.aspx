<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Investigate.aspx.cs" Inherits="WebSite.Contents.Investigate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <meta name="keywords" content="Thiet ke noi that, Thiết kế nội thất, Thiết kế chung cư, Thiet ke chung cu, Thiết kế nội thất chung cư, Thiet ke noi that chung , Noi that biet thu, Nội thất biệt thự, Cai tao noi that, Cải tạo nội thất, Nhà đẹp, Nha dep" />
        <style type="text/css">
            .cus-info { padding-bottom: 5px; }

            .cus-info span { color: red; }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div style="width: 670px;">
                <p style="text-align: center;">
                    <strong>PHIẾU ĐIỀU TRA</strong><br />
                    <span style="font-style: italic; text-align: center;">(Quý khách vui lòng điền đầy đủ thông tin vào phiếu điều tra)</span>
                </p>
                <p><strong>THÔNG TIN KHÁCH HÀNG</strong></p>
                <div class="cus-info">
                    <label>Họ và Tên(<span>*</span>)</label><br />
                    <asp:DropDownList ID="ddl" runat="server">
                        <Items>
                            <asp:ListItem Text="Ông/Bà" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Ông" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bà" Value="2"></asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:TextBox ID="tbName" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Số điện thoại(<span>*</span>)</label><br/>
                    <asp:TextBox ID="tbPhone" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Email(<span>*</span>)</label><br/>
                    <asp:TextBox ID="tbEmail" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Địa chỉ(<span>*</span>)</label><br/>
                    <asp:TextBox ID="tbAddress" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Thành phố(<span>*</span>)</label><br/>
                    <asp:TextBox ID="tbCity" runat="server" Width="200"></asp:TextBox>
                </div>
            
                <p><strong>THÔNG TIN CÔNG TRÌNH</strong></p>
                <div class="cus-info">
                    <label>Kích thước mảnh đất: Đơn vị: mét, chiều rộng X chiều dài...</label><br/>
                    <asp:TextBox ID="tbSize" runat="server" Width="200"></asp:TextBox>(hoặc gửi bản ảnh hay scan sổ đỏ <a href="#">tại đây</a>)
                </div>
                <div class="cus-info">
                    <label>Hướng nhà</label><br/>
                    <asp:TextBox ID="tbDirection" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Số tiền dự định đầu tư xây dựng (Triệu VNĐ)</label><br/>
                    <asp:TextBox ID="tbCost" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Ngày tháng năm sinh người đứng chủ: (Mong quý vị gửi ngày sinh âm lịch chính xác để chúng tôi
                        xem xét phương án thiết kế)</label><br/>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Số người trong gia đình: (Nên ghi cụ thể, Ví dụ: 2 người già, 2 người lớn, 1 trẻ em)</label><br/>
                    <asp:TextBox ID="tbNumberOfPerson" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Số phòng định xây: (Nên ghi cụ thể, Ví dụ: 3 phòng ngủ, 1 phòng khách, 1 phòng ăn)</label><br/>
                    <asp:TextBox ID="tbNumberOfRoom" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Yêu cầu khác</label><br/>
                    <asp:TextBox ID="tbOther" runat="server" Width="500" Height="100" TextMode="MultiLine"></asp:TextBox>
                </div>
            
                <p><strong>THÔNG TIN SỞ THÍCH CÁ NHÂN</strong></p>
                <div class="cus-info">
                    <label>Màu sắc cho ngôi nhà (Ví dụ: Hồng đỏ tím vàng)</label><br/>
                    <asp:TextBox ID="tbColor" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Đường nét yêu thích (Ví dụ: Nét cong, thẳng, kết hợp)</label><br/>
                    <asp:TextBox ID="tbLineStyle" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Kiểu nhà yêu thích (Ví dụ: Lệch tầng, thẳng tầng, nhà biệt thự cổ, nhà vườn...</label><br/>
                    <asp:TextBox ID="tbStyle" runat="server" Width="200"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <label>Yêu cầu khác (Không gian giải trí, làm việc, thể dục thể thao)</label><br/>
                    <asp:TextBox ID="tbOtherPersonal" runat="server" Width="500" Height="100" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="cus-info">
                    <asp:Button runat="server" ID="btnSend" Text="Gửi yêu cầu tư vấn"/>
                </div>
            </div>
        </form>
    </body>
</html>