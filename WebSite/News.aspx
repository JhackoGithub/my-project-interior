<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="WebSite.News" %>

<%@ Register Src="~/UserControls/SameProject.ascx" TagPrefix="ucSameProject" TagName="SameProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">
    <style type="text/css">
        .tab p {
            text-align: justify;
            color: rgb(51, 51, 51);
        }

        .tab .news-title {
            margin: 10px 0px 0px;
            padding: 0px 0px 10px;
            font-family: arial;
            font-size: 12px;
            background-color: #ffffff;
        }

            .tab .news-title h1 {
                margin-top: 0px;
                margin-right: 0px;
                margin-left: 0px;
                padding-top: 0px;
                padding-right: 0px;
                padding-left: 0px;
                font-weight: 400;
                font-size: 28px;
                line-height: 32px;
            }

        .tab .news-subcontent {
            margin: 0px;
            padding: 0px 0px 10px;
            color: #444444;
            font-weight: 700;
            font-size: 14px;
            line-height: 18px;
            font-family: arial;
            float: left;
            background-color: #ffffff;
        }

        .tab .news-contents {
            margin: 0px;
            padding: 0px 0px 10px;
            color: #444444;
            line-height: 18px;
            font-family: arial;
            float: left;
            background-color: #ffffff;
        }

        .tab .news-relative {
            padding-top: 50px;
        }

        .tab .news-relateditemtitle {
            font-weight: bold;
            text-align: left;
            color: #666;
            margin-left: 5px;
            margin-right: 5px;
        }

        .tab .mt3 {
            margin-top: 15px;
            margin-bottom: 10px;
        }

        .tab .img130 {
            width: 130px;
            padding: 2px;
            float: left;
            margin-right: 5px;
        }

        .tab .icon-detail {
            background-position: 100% 2px;
            padding-right: 10px;
            float: right;
        }

        .tab .line1 {
            height: 1px;
            overflow: hidden;
            background: #dbdbdb;
        }
    </style>
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div class="page">
                <div class="grid_12 ">
                    <div class="tabs">
                        <div class="tab-wrapper">
                            <div class="tab" style="display: block; float: left; width: 650px;">
                                <asp:Panel ID="pnlTopNews" runat="server" Visible="true">
                                    <asp:Repeater ID="rptTopNews" runat="server">
                                        <ItemTemplate>
                                            <div class="mt3 clearfix">
                                                <a title="" href="News.aspx?type=2&id=<%# Eval("Id") %>">
                                                    <img class="img130" src="Images/Uploads/News/<%# Eval("ImageUrl") ?? "no-image.png" %>" alt="">
                                                </a>
                                                <div>
                                                    <h2><a title="" href="News.aspx?type=2&id=<%# Eval("Id") %>">
                                                        <%# Eval("Title") %>
                                                    </a></h2>
                                                    <div><%# Eval("SubContent") %></div>
                                                    <a class="icon-detail" href="News.aspx?type=2&id=<%# Eval("Id") %>">Xem tiếp</a>
                                                </div>
                                            </div>
                                            <div class="line1"></div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlDetails" Visible="False">
                                    <div class="news-title">
                                        <h1><asp:Label runat="server" ID="lbTitle"></asp:Label></h1>
                                    </div>
                                    <div class="news-subcontent">
                                        <asp:Literal runat="server" ID="ltSubContent"></asp:Literal>
                                    </div>
                                    <div class="news-contents">
                                        <asp:Literal runat="server" ID="ltContents"></asp:Literal>
                                    </div>
                                </asp:Panel>
                                <div class="news-relative">
                                    <hr color="maroon" width="100%">
                                    <span class="news-relateditemtitle">Các tin và bài khác:</span>
                                    <ul id="relateditemlist">
                                        <asp:Literal runat="server" ID="ltNewRelative"></asp:Literal>
                                    </ul>
                                </div>
                            </div>
                            <div style="float: left; width: 265px; margin-left: 15px;">
                                <ucSameProject:SameProject runat="server" ID="sameProject" />
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
