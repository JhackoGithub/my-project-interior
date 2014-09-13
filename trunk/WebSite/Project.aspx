<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Project" Theme="Windows7" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeftContent" runat="server">
    <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" runat="server">
    <script type="text/javascript" src="Scripts/ASPSnippets_Pager.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr.custom.js"></script>
    <style type="text/css">
        .Pager {
            text-align: center;
            padding-top: 20px;
        }

        .Pager span {
            text-align: center;
            color: #999;
            display: inline-block;
            width: 20px;
            background-color: #A1DCF2;
            margin-right: 3px;
            line-height: 150%;
            border: 1px solid #3AC0F2;
        }

        .Pager a {
            text-align: center;
            display: inline-block;
            width: 20px;
            background-color: #3AC0F2;
            color: #fff;
            border: 1px solid #3AC0F2;
            margin-right: 3px;
            line-height: 150%;
            text-decoration: none;
        }
    </style>

    <div id="masonry"></div>
    <div style="clear: both;"></div>
    <div class="Pager"></div>
    <div id="divloading" class="loading" />

    <script type="text/javascript">

        $(document).ready(function () {
            getProjects(1);
        });

        $(".Pager .page").live("click", function () {
            getProjects(parseInt($(this).attr('page')));
        });

        function getProjects(pageIndex) {
            var type = getParameterByName('type');
            var cateid = getParameterByName('cate');
            var url = "../Handler/ProjectHandler.ashx?funcname=getallbypageindex&type=" + type + "&cate=" + (cateid == "" ? "0" : cateid);
            var data = JSON.stringify(pageIndex);
            callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, OnSuccess);
        }

        function OnSuccess(response) {
            $('#masonry').html(response.html);
            $(".Pager").ASPSnippets_Pager({
                ActiveCssClass: "current",
                PagerCssClass: "pager",
                PageIndex: parseInt(response.pageindex),
                PageSize: parseInt(response.pagesize),
                RecordCount: parseInt(response.totalrows)
            });
        }

    </script>
</asp:Content>
