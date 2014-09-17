<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebSite.Contact" Theme="Windows7" %>

<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContainer" runat="server">
    <script type="text/javascript">
        jQuery(function() {
            $('.sf-menu #menu-item-6').addClass('current_page_item');

        });

    </script>
    <style type="text/css">
        .cus-info { padding-bottom: 5px; }

        .cus-info span { color: red; }
    </style>
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-14" class="page" style="padding-left: 10px;">
                <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
                <div style="display: inline; float: left; height: 100%; margin-left: 10px; margin-right: 10px; width: 710px;">
                    <div id="divIframe" style="display: none;">
                        <asp:Literal runat="server" ID="ltContents"></asp:Literal>
                    </div>
                    <div id="divMap" style="display: block;">
                        <h2>Bản đồ đến công ty</h2>
                        <div class="google-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.8736005821547!2d105.82702340000003!3d20.9977033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac8871297549%3A0xb2a892bf045f4851!2zNjQgTmd1eeG7hW4gVmnhur90IFh1w6JuLCBLaMawxqFuZyBNYWksIFRoYW5oIFh1w6JuLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1405071611175" width="670" height="450" frameborder="0" style="border: 0"></iframe>
                        </div>
                    </div>
                    <div id="divInves" style="display: none; width: 710px;">
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
                            <label>Số điện thoại(<span>*</span>)</label><br />
                            <asp:TextBox ID="tbPhone" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Email(<span>*</span>)</label><br />
                            <asp:TextBox ID="tbEmail" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Địa chỉ(<span>*</span>)</label><br />
                            <asp:TextBox ID="tbAddress" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Thành phố(<span>*</span>)</label><br />
                            <asp:TextBox ID="tbCity" runat="server" Width="200"></asp:TextBox>
                        </div>

                        <p><strong>THÔNG TIN CÔNG TRÌNH</strong></p>
                        <div class="cus-info">
                            <label>Kích thước mảnh đất: Đơn vị: mét, chiều rộng X chiều dài...</label><br />
                            <asp:TextBox ID="tbSize" runat="server" Width="200"></asp:TextBox>(hoặc gửi bản ảnh hay scan sổ đỏ <a href="#">tại đây</a>)
                        </div>
                        <div class="cus-info">
                            <label>Hướng nhà</label><br />
                            <asp:TextBox ID="tbDirection" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Số tiền dự định đầu tư xây dựng (Triệu VNĐ)</label><br />
                            <asp:TextBox ID="tbCost" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>
                                Ngày tháng năm sinh người đứng chủ: (Mong quý vị gửi ngày sinh âm lịch chính xác để chúng tôi
                                xem xét phương án thiết kế)</label><br />
                            <asp:TextBox ID="TextBox1" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Số người trong gia đình: (Nên ghi cụ thể, Ví dụ: 2 người già, 2 người lớn, 1 trẻ em)</label><br />
                            <asp:TextBox ID="tbNumberOfPerson" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Số phòng định xây: (Nên ghi cụ thể, Ví dụ: 3 phòng ngủ, 1 phòng khách, 1 phòng ăn)</label><br />
                            <asp:TextBox ID="tbNumberOfRoom" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Yêu cầu khác</label><br />
                            <asp:TextBox ID="tbOther" runat="server" Width="500" Height="100" TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <p><strong>THÔNG TIN SỞ THÍCH CÁ NHÂN</strong></p>
                        <div class="cus-info">
                            <label>Màu sắc cho ngôi nhà (Ví dụ: Hồng đỏ tím vàng)</label><br />
                            <asp:TextBox ID="tbColor" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Đường nét yêu thích (Ví dụ: Nét cong, thẳng, kết hợp)</label><br />
                            <asp:TextBox ID="tbLineStyle" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Kiểu nhà yêu thích (Ví dụ: Lệch tầng, thẳng tầng, nhà biệt thự cổ, nhà vườn...</label><br />
                            <asp:TextBox ID="tbStyle" runat="server" Width="200"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <label>Yêu cầu khác (Không gian giải trí, làm việc, thể dục thể thao)</label><br />
                            <asp:TextBox ID="tbOtherPersonal" runat="server" Width="500" Height="100" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="cus-info">
                            <asp:Button runat="server" ID="btnSend" Text="Gửi yêu cầu tư vấn" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var id = '<%= Page.RouteData.Values["id"] == null ? "0" : Page.RouteData.Values["id"].ToString() %>';
            var page = '<%= Page.Request.Path%>';
            $('#cssmenu ul ul li a').each(function() {
                var link = $(this).attr('href');
                if (link == page) {
                    $(this).children().addClass('active');
                    getDirectPage(id);
                }
            });
        });

        function getDirectPage(id) {
            if (id != "0") {
                $('#divMap').css('display', 'none');
                $('#divInves').css('display', 'none');
                $('#divIframe').css('display', 'block');
            } else {
                var name = '<%= Page.RouteData.Values["name"] == null ? string.Empty : Page.RouteData.Values["name"].ToString() %>';
                $('#divIframe').css('display', 'none');
                if (name == "0") {
                    $('#divInves').css('display', 'none');
                    $('#divMap').css('display', 'block');
                } else {
                    $('#divMap').css('display', 'none');
                    $('#divInves').css('display', 'block');
                }
            }
        }
    </script>
</asp:Content>