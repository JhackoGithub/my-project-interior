<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultant.aspx.cs" Inherits="WebSite.Consultant" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">

    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-502" class=" page">
                <div class="grid_12 ">
                    <div class="tabs">
                        <ucMenuTop:MenuTop ID="menuTop" runat="server" />
                        <div class="tab-wrapper">
                            <div id='cssmenu' style="float: left; width: 220px;">
                                <asp:Literal runat="server" ID="ltMenuLeft"></asp:Literal>
                            </div>
                            <div id="tab1" class="tab" style="display: block; float: right; width: 700px;">
                                <div class="Consultant-info">
                                    <p style="font-size: 13pt;">Chuyên trang thiết kế nhà ở</p>
                                    <p>
                                        Kiến trúc và nội thất nhà ở có lẽ là lĩnh vực được nhiều sự quan tâm nhất. Bạn cũng như
                                        chúng tôi, mỗi người đều có một mái nhà và dù chúng là những ngôi biệt thự sang trọng hay những
                                        căn hộ bình dị thì chúng vẫn thật gần gũi với tất cả chúng ta.
                                    </p>
                                    <p>
                                        Cùng với sự phát triển về kinh tế xã hội, khi nhu cầu của mỗi người không chỉ dừng ở "ăn no, mặc ấm" mà đang
                                        chuyển thành "ăn ngon, mặc đẹp" thì một ngôi nhà không chỉ cần bền chắc mà còn phải đẹp và thật sự tiện nghi. Để
                                        làm được điều đó không thể thiếu vai trò của các Kiến trúc sư. Một bản thiết kế tốt sẽ đem lại cho bạn cái Đẹp sự Tiện nghi,
                                        giúp bạn Tiết kiệm chi phí đầu tư, hạn chế phát sinh chi phí khi thi công...
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
</asp:Content>