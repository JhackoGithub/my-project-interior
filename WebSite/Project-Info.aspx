<%@ Page Title="" Language="C#" MasterPageFile="~/DetailMasterPage.master" AutoEventWireup="true" CodeBehind="Project-Info.aspx.cs" Inherits="WebSite.Project_Info" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/SameProject.ascx" TagPrefix="ucSameProject" TagName="SameProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
    <style type="text/css">
        #wrapper {
            height: 400px;
            width: 900px;
            /*margin: -200px 0 0 -450px;
			position: absolute;
			top: 50%;
			left: 50%;*/
        }

        #carousel img {
            border: none;
            display: block;
            float: left;
            position: relative;
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
            width: 680px;
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
            color: #999;
            display: inline-block;
            font-size: 20px;
            height: 30px;
            line-height: 30px;
            padding: 10px 30px;
            text-decoration: none;
        }

        #pager a:hover { color: #666; }

        #pager a:first-child { border-left: 1px solid #ccc; }

        #pager a.selected {
            background-color: #F4F0EE;
            color: #333;
        }
    </style>
    <script src="Scripts/jquery.carouFredSel-6.0.4-packed.js"> </script>
    <script type="text/javascript">
        $(function() {
            var _center = {
                width: 600,
                height: 400,
                marginLeft: 0,
                marginTop: 0,
                marginRight: 0
            };
            var _left = {
                width: 300,
                height: 200,
                marginLeft: 0,
                marginTop: 150,
                marginRight: -150
            };
            var _right = {
                width: 300,
                height: 200,
                marginLeft: -150,
                marginTop: 150,
                marginRight: 0
            };
            var _outLeft = {
                width: 150,
                height: 100,
                marginLeft: 150,
                marginTop: 200,
                marginRight: -200
            };
            var _outRight = {
                width: 150,
                height: 100,
                marginLeft: -200,
                marginTop: 200,
                marginRight: 50
            };
            $('#carousel').carouFredSel({
                width: 900,
                height: 400,
                align: false,
                items: {
                    visible: 3,
                    width: 100
                },
                scroll: {
                    items: 1,
                    duration: 400,
                    timeoutDuration: 2500,
                    easing: 'swing',
                    pauseOnHover: 'immediate',
                    onBefore: function(data) {
                        data.items.old.eq(0).animate(_outLeft);
                        data.items.visible.eq(0).animate(_left);
                        data.items.visible.eq(1).animate(_center);
                        data.items.visible.eq(2).animate(_right).css({ zIndex: 1 });
                        data.items.visible.eq(2).next().css(_outRight).css({ zIndex: 0 });

                        setTimeout(function() {
                            data.items.old.eq(0).css({ zIndex: 1 });
                            data.items.visible.eq(0).css({ zIndex: 2 });
                            data.items.visible.eq(1).css({ zIndex: 3 });
                            data.items.visible.eq(2).css({ zIndex: 2 });
                        }, 300);
                    }
                }
            });
            $('#carousel').children().eq(0).css(_left).css({ zIndex: 2 });
            $('#carousel').children().eq(1).css(_center).css({ zIndex: 3 });
            $('#carousel').children().eq(2).css(_right).css({ zIndex: 2 });
            $('#carousel').children().eq(3).css(_outRight).css({ zIndex: 1 });


            $('#tabs').carouFredSel({
                circular: false,
                items: 1,
                width: '100%',
                auto: false,
                pagination: {
                    container: '#pager',
                    anchorBuilder: function(nr) {
                        return '<a href="#">' + $(this).find('h3').text() + '</a>';
                    }
                }
            });

            $("#carousel").mouseover(function() {
                $("#carousel").trigger('pause', true);
            });
        });

    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SlideProjectContent">
    <div id="wrapper">
        <div id="carousel">
            <asp:Literal runat="server" ID="ltImages"></asp:Literal>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubContent" runat="server">
    <div id="wrapper-tab">
        <div id="pager">
        </div>
        <div id="tabs">
            <div id="project-info">
                <h3 style="display: none;">Thông tin</h3>
                <asp:Literal runat="server" ID="ltProjectInfo"></asp:Literal>
            </div>
            <div id="project-desc">
                <h3 style="display: none;">Thuyết minh</h3>
                <asp:Literal runat="server" ID="ltProjectDesc"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="server">
    <ucSameProject:SameProject runat="server" ID="sameProject" />
</asp:Content>