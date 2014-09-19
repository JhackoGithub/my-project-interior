<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="WebSite.News" %>

<%@ Register Src="~/UserControls/SameProject.ascx" TagPrefix="ucSameProject" TagName="SameProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContainer" runat="server">
    <style type="text/css">
        .tab p {
            color: rgb(51, 51, 51);
            text-align: justify;
        }

        .tab .news-title {
            margin: 10px 0px 0px;
        }

            .tab .news-title h1 {
                font-size: 20px;
                line-height: 32px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                padding-left: 0px;
                padding-right: 0px;
                padding-top: 0px;
                color: #005FAC;
            }

        .tab .news-subcontent {
            color: #535353;
            float: left;
            font-size: 14px;
            font-weight: 700;
            line-height: 18px;
            margin: 0px;
            padding: 0px 0px 10px;
        }

        .tab .news-contents {
            background-color: #ffffff;
            color: #444444;
            float: left;
            font-family: arial;
            line-height: 18px;
            margin: 0px;
            padding: 0px 0px 10px;
        }

        .tab .news-relative {
            padding-top: 50px;
        }

        .tab .news-relateditemtitle {
            color: #666;
            font-weight: bold;
            margin-left: 5px;
            margin-right: 5px;
            text-align: left;
        }

        .tab .mt3 {
            margin-bottom: 10px;
            margin-top: 15px;
        }

        .tab .img130 {
            float: left;
            margin-right: 5px;
            padding: 2px;
            width: 130px;
        }

        .tab .icon-detail {
            background-position: 100% 2px;
            float: right;
            padding-right: 10px;
        }

        .tab .line1 {
            background: #dbdbdb;
            height: 1px;
            overflow: hidden;
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
                                                <a title="" href="<%# Page.ResolveUrl(string.Format("/tin-tuc/2/{0}", Eval("Id"))) %>"><img class="img130" src="<%# Page.ResolveUrl(string.Format("/Images/Uploads/News/{0}", Eval("ImageUrl") ?? "no-image.png")) %>" alt="">
                                                </a>
                                                <div>
                                                    <h2><a title="" href="<%# Page.ResolveUrl(string.Format("/tin-tuc/2/{0}", Eval("Id"))) %>"><%#Eval("Title") %>
                                                    </a></h2>
                                                    <div><%#Eval("SubContent") %></div>
                                                    <a class="icon-detail" href="<%# Page.ResolveUrl(string.Format("/tin-tuc/2/{0}", Eval("Id"))) %>">Xem tiếp</a>
                                                </div>
                                            </div>
                                            <div class="line1"></div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlDetails" Visible="False">
                                    <div class="news-title">
                                        <h1>
                                            <asp:Label runat="server" ID="lbTitle"></asp:Label></h1>
                                    </div>
                                    <div style="float: left; text-align: right;">
                                        <span style="padding-right: 3px; float: right;">
                                            <a href="javascript:;" onclick="share_linkhay();" style="padding: 0 2px;">
                                                <img border="0" src="/Images/linkhay.gif" alt="Share on linkhay" title="Share on linkhay"></a>
                                        </span>
                                        <span style="padding-right: 3px; float: right;">
                                            <a href="javascript:;" onclick="share_zing();" style="padding: 0 2px;">
                                                <img border="0" src="/Images/zingme.png" alt="Share on zingme" title="Share on zing"></a>
                                        </span>
                                        <span style="padding-right: 3px; float: right;">
                                            <a href="javascript:;" onclick="share_twitter();" style="padding: 0 2px;">
                                                <img border="0" src="/Images/tw.png" alt="Share on twitter" title="Share on twitter"></a>
                                        </span>
                                        <span style="padding-right: 3px; float: right;">
                                            <a href="javascript:;" onclick="share_facebook();" style="padding: 0 2px;">
                                                <img border="0" src="/Images/fb.png" alt="Share on Facebook" title="Share on Facebook"></a>
                                        </span>
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
                            <div style="float: left; margin-left: 15px; width: 265px;">
                                <ucSameProject:SameProject runat="server" ID="sameProject" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pagination">
            </div>
        </div>
    </div>
</asp:Content>
