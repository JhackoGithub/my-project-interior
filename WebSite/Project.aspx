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

    <div id="container-project" class="isotope"></div>

    <script type="text/javascript">
        $(function() {
            bindProjects();
        });

        function bindProjects() {
            var type = getParameterByName('type');
            var cateid = getParameterByName('cate');
            var url = "../Handler/ProjectHandler.ashx?funcname=getall&type=" + type + "&cate=" + cateid;
            callAjaxHandler(url, null, AjaxConst.GetRequest, bindProjectCallback);
        }

        function bindProjectCallback(data) {
            $('#container-project').html(data.html);

            window.setTimeout(reloadgrid, 1000);
        }

        function reloadgrid() {
            $('#container-project').isotope({
                itemSelector: '.box-project',
            });
        }
    </script>
</asp:Content>