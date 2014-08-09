<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Project" Theme="BocaTheme" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeftContent" runat="server">
    <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" runat="server">
    
    <div id="project-list">
        
    </div>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                bindProjects();
            });

            function bindProjects() {
                var type = getParameterByName('type');
                var cateid = getParameterByName('cate');
                var url = "../Handler/ProjectHandler.ashx?funcname=getall&type=" + type + "&cate="+cateid;
                callAjaxHandler(url, null, AjaxConst.GetRequest, bindProjectCallback);
            }

            function bindProjectCallback(data) {
                $('#project-list').html(data.html);
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>


