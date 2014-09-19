<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.Master" AutoEventWireup="true" CodeBehind="Refer.aspx.cs" Inherits="WebSite.Refer" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeftContent" runat="server">
    <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" runat="server">
    <link href="<%: Page.ResolveUrl("~/Content/camera.css") %>" rel="stylesheet" />
    <style type="text/css">
        #wrapper {
            height: 600px;
            width: 720px;
        }

        #back_to_camera {
            clear: both;
            display: block;
            height: 80px;
            line-height: 40px;
            padding: 20px;
        }

        .fluid_container {
            height: 530px;
            margin: 0 auto;
            width: 700px;
        }
    </style>

    <div id="pro-refer-info" style="display: none;">
        <div id="wrapper">
            <div class="fluid_container">
                <div class="camera_wrap camera_magenta_skin" id="camera_wrap_2"></div>
            </div>
        </div>
    </div>
    <div id="container-project" style="padding-bottom: 20px;"></div>
    <div id="divloading" class="loading" />
    <telerik:RadCodeBlock runat="server">
        <script src="<%: Page.ResolveUrl("~/Scripts/modernizr.custom.js") %>"> </script>
        <script src="<%: Page.ResolveUrl("~/Scripts/camera.js") %>"> </script>

        <script type="text/javascript">
            $(function () {
                bindProjects();
            });

            function bindProjects() {
                var path = '<%= Page.ResolveUrl(string.Format("~/Handler/ProjectHandler.ashx?funcname=getrefer&type={0}", int.Parse(Page.RouteData.Values["type"].ToString()))) %>';
            callAjaxHandler("divloading", path, null, AjaxConst.GetRequest, bindProjectCallback);
        }

        function bindProjectCallback(data) {
            $('#container-project').html(data.html);

            $('#container-project .detail').click(function () {
                var $lbl = $(this).find("label");
                var path = $lbl.html();
                showDetails(path);
            });
        }

        function showDetails(path) {
            var url = '<%= Page.ResolveUrl("~/Handler/ProjectHandler.ashx?funcname=getreferdetails")%>';
            var data = JSON.stringify(path);
            callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, bindDetailsCallback);
        }

        function bindDetailsCallback(data) {
            if (data == null || data.html == '')
                return;
            $('#camera_wrap_2').html(data.html);
            $('#pro-refer-info').css("display", "block");
            jQuery('#camera_wrap_2').camera({
                height: '520px',
                loader: 'bar',
                pagination: true,
                thumbnails: true,
                imagePath: '<%: Page.ResolveUrl("~/Images/")%>'
            });
        }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
