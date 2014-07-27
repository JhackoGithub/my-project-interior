<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="WebSite.Question" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/SameProject.ascx" TagPrefix="ucSameProject" TagName="SameProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div class="page">
                <div class="grid_12 ">
                    <div class="tabs">
                        <ucMenuTop:MenuTop ID="menuTop" runat="server" />
                        <div class="tab-wrapper">

                            <div id="tab1" class="tab" style="display: block; float: left; width: 700px;">
                                <p>Giải đáp thắc mắc:
    <br/>
        Ai cũng có những khó khăn, khúc mắc nhất định trong quá trình từ khi bắt đầu có dự đinh
            xây dựng nhà, cải tạo nhà cửa, căn hộ chung cư, mặt bằng kinh doanh...<br />
        Hay đặt câu hỏi, chúng tôi sẽ cho bạn câu trả lời tốt nhất,hiệu quả nhất với công trình của bạn.
    </p>
    <p>Thông tin khách hàng:
    <br/>(Các thông tin của quý khách sẽ được bảo mật)</p>
    <asp:TextBox runat="server" ID="tbEmail" Width="300px"></asp:TextBox><br />
    <br />
    <asp:TextBox runat="server" ID="tbPhone" Width="300px"></asp:TextBox><br />
    <br />
    <asp:TextBox runat="server" ID="tbAddress" Width="300px"></asp:TextBox>
    <p>Nội dung câu hỏi</p>
    <asp:TextBox runat="server" ID="tbContent" TextMode="MultiLine" Width="489px" Height="104px"></asp:TextBox><br />
    <br />
    <asp:Button runat="server" ID="btSubmit" Text="Gửi" />
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
<div style="float: right; width: 230px; padding-top: 15px;">
                            <ucSameProject:SameProject runat="server" ID="sameProject"/>
</div>
                        </div>
                    </div>
                </div>
                <div class="pagination">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
