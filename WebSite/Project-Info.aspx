<%@ Page Language="C#" MasterPageFile="~/DetailMasterPage.master" AutoEventWireup="true" CodeBehind="Project-Info.aspx.cs" Inherits="WebSite.Project_Info" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/SameProject.ascx" TagPrefix="ucSameProject" TagName="SameProject" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <link href="<%: Page.ResolveUrl("~/Content/camera.css") %>" rel="stylesheet" />
    <style type="text/css">
        #wrapper {
            height: 500px;
            width: 900px;
        }

        #back_to_camera {
            clear: both;
            display: block;
            height: 80px;
            line-height: 40px;
            padding: 20px;
        }

        .fluid_container {
            height: 640px;
            margin: 0 auto;
            width: 900px;
        }

        #wrapper-tab {
            background-color: #F4F0EE;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
            padding: 10px;
            width: 680px;
        }

        #tabs > div {
            /*height: 250px;*/
            float: left;
            overflow: hidden;
            width: 660px;
        }

        #tabs img {
            display: block;
            float: left;
            margin: 0 25px 0 0;
        }

        #tabs h3 {
            font-size: 30px;
            line-height: 20px;
            margin: 60px 0 20px 0;
        }

        #tabs #project-desc img {
            margin-top: 30px;
            text-align: center;
        }

        #pager {
            margin: -61px auto 0px auto;
            text-align: center;
            width: 680px;
        }

        #pager a {
            border: 1px solid transparent;
            border-bottom: none;
            border-color: #ccc;
            border-left: none;
            /*color: #999;*/
            display: inline-block;
            font-size: 20px;
            height: 30px;
            line-height: 30px;
            padding: 10px 30px;
            text-decoration: none;
        }

        #pager a:hover {
            color: #666;
        }

        #pager a:first-child {
            border-left: 1px solid #ccc;
        }

        #pager a.selected {
            background-color: #F4F0EE;
            color: #333;
        }
    </style>
    <script src="<%: Page.ResolveUrl("~/Scripts/jquery.easing.1.3.js") %>" > </script>
    <script src="<%: Page.ResolveUrl("~/Scripts/camera.js") %>" > </script>
    <script src="<%: Page.ResolveUrl("~/Scripts/jquery.carouFredSel-6.0.4-packed.js") %>" > </script>
    <script type="text/javascript">
        $(function () {
            jQuery('#camera_wrap_2').camera({
                height: '520px',
                loader: 'bar',
                pagination: true,
                thumbnails: true,
                imagePath: '<%: Page.ResolveUrl("~/Images/")%>'
            });

            $('#tabs').carouFredSel({
                circular: false,
                items: 1,
                width: '100%',
                auto: false,
                pagination: {
                    container: '#pager',
                    anchorBuilder: function (nr) {
                        return '<a href="#">' + $(this).find('h3').text() + '</a>';
                    }
                }
            });
        });

    </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SlideProjectContent">
    <div id="wrapper">
        <div class="fluid_container">
            <div class="camera_wrap camera_magenta_skin" id="camera_wrap_2">
                <asp:Literal runat="server" ID="ltImages"></asp:Literal>
            </div>
        </div>
    </div>
    <%--<div style="float: left; text-align: right;">
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
    </div>--%>
    <iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fnoithatviet.am&amp;width=500&amp;layout=standard&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=30&amp;appId=648914558493847" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:500px; height:30px;" allowTransparency="true"></iframe>
    <div style="clear: both;"></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubContent" runat="server">
    <div id="wrapper-tab">
        <div id="pager">
        </div>
        <div id="tabs">
            <div id="project-info" style="padding: 10px;">
                <h3 style="display: none;">Thông tin</h3>
                <asp:Literal runat="server" ID="ltProjectInfo"></asp:Literal>
            </div>
            <div id="project-desc" style="padding: 10px;">
                <h3 style="display: none;">Thuyết minh</h3>
                <asp:Literal runat="server" ID="ltProjectDesc"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="server">
    <ucSameProject:SameProject runat="server" ID="sameProject" />
</asp:Content>
