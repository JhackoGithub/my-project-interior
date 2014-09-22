<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultant.aspx.cs" Inherits="WebSite.Consultant" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-502" class=" page">
                <div class="grid_12 ">
                    <div class="tabs">
                        <ucMenuTop:MenuTop ID="menuTop" runat="server" />
                        <div class="tab-wrapper">
                            <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
                            <div id="tab1" class="tab" style="display: block; float: right; width: 700px;">
                                <div class="Consultant-info">
                                    <asp:Literal runat="server" ID="ltContents"></asp:Literal>
                                </div>
                                <div style="line-height: 24px; padding-left: 10px;">
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/ke-hoach-tai-chinh/{0}/2/1", Page.RouteData.Values["type"])) %>">Bài 1 | Kế hoạch tài chính</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/cac-buoc-chuan-bi-dau-tien/{0}/2/2", Page.RouteData.Values["type"])) %>">Bài 2 | Các bước chuẩn bị đầu tiên</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/lam-viec-voi-kien-truc-su/{0}/2/3", Page.RouteData.Values["type"])) %>">Bài 3 | Làm việc với kiến trúc sư</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/chon-nha-thau-thi-cong/{0}/2/4", Page.RouteData.Values["type"])) %>">Bài 4 | Chọn nhà thầu thi công</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/chon-vat-lieu-xay-dung/{0}/2/5", Page.RouteData.Values["type"])) %>">Bài 5 | Chọn vật liệu xây dựng</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/cong-tac-giam-sat/{0}/2/6", Page.RouteData.Values["type"])) %>">Bài 6 | Công tác giám sát</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/tien-hanh-thi-cong/{0}/2/7", Page.RouteData.Values["type"])) %>">Bài 7 | Tiến hành thi công</a><br/>
                                    <a href="<%: Page.ResolveUrl(string.Format("/kien-thuc-can-thiet-khi-xay-nha/kiem-tra-nghiem-thu-va-hoan-cong/{0}/2/8", Page.RouteData.Values["type"])) %>">Bài 8 | Kiểm tra, nghiệm thu và hoàn công</a><br/>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="img-bottom-info" style="padding-left: 260px;">
                            <img src="<%: Page.ResolveUrl("~/Images/products/8.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/2.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/3.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/4.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/5.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/6.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/7.jpg") %>" />
                            <img src="<%: Page.ResolveUrl("~/Images/products/9.jpg") %>" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>