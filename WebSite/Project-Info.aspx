<%@ Page Title="" Language="C#" MasterPageFile="~/DetailMasterPage.master" AutoEventWireup="true" CodeBehind="Project-Info.aspx.cs" Inherits="WebSite.Project_Info" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/SameProject.ascx" TagPrefix="ucSameProject" TagName="SameProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
    <link href="Content/camera.css" rel="stylesheet" />
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
    <script src="Scripts/jquery.easing.1.3.js"> </script>
    <script src="Scripts/camera.js" type="text/javascript"> </script>
    <script src="Scripts/jquery.carouFredSel-6.0.4-packed.js"> </script>
    <script type="text/javascript">
        $(function () {
            jQuery('#camera_wrap_2').camera({
                height: '520px',
                loader: 'bar',
                pagination: true,
                thumbnails: true,
                imagePath: '/Images/'
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

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SlideProjectContent">
    <div id="wrapper">
        <div class="fluid_container">
            <div class="camera_wrap camera_magenta_skin" id="camera_wrap_2">
                <asp:Literal runat="server" ID="ltImages"></asp:Literal>
            </div>
        </div>
    </div>
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
