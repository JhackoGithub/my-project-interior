<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageManager.aspx.cs" Inherits="WebSite.Contents.ImageManager" Theme="BocaTheme" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <link href="../Content/Kendo/kendo.common.min.css" rel="stylesheet" />
        <link href="../Content/Kendo/kendo.default.min.css" rel="stylesheet" />
        <link href="../Content/Site.css" rel="stylesheet" />
        <script src="../Scripts/jquery-1.8.2.min.js"> </script>
        <script src="../Scripts/Script.js"> </script>
    </head>
    <body>
        <form id="form1" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
            <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
            <div style="height: 460px; margin: 0 auto; padding: 10px; width: 730px;">
                <div style="background-color: lightcyan; float: left; height: 460px; min-width: 330px; overflow: auto;">
                    <telerik:RadTreeView runat="server" ID="tvFolderImg" ClientIDMode="Static" Skin="Metro" OnClientNodeClicked=" ClientNodeClicked ">
                    </telerik:RadTreeView>
                </div>
                <telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadGrid"></telerik:RadAjaxLoadingPanel>
                <telerik:RadAjaxPanel ID="radAjaxPanel" runat="server" LoadingPanelID="radAjaxLoadGrid">
                    <div class="admin-image-gallary" runat="server"></div>
                </telerik:RadAjaxPanel>
            </div>
            <div style="border-top: gray solid 1px; clear: both; margin: 10px auto 0 auto; padding-top: 5px; text-align: right; width: 730px;">
                <a class="k-button k-button-icontext k-grid-update" id="save" onclick=" selectFolder() "><span class="k-icon k-grid-update"></span>Chọn</a>
                <a class="k-button k-button-icontext k-grid-cancel" id="closepoup" onclick=" closePopup() "><span class="k-icon k-cancel"></span>Hủy</a>
            </div>
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function closePopup() {
                    window.parent.closeChildPopup();
                }

                function ClientNodeClicked(sender, eventArgs) {
                    var node = eventArgs.get_node();
                    var data = JSON.stringify(node.get_value());
                    var url = "../Handler/ImageHandler.ashx?funcname=select";
                    callAjaxHandler(url, data, AjaxConst.PostRequest, bindImageGridCallback);
                }

                function selectFolder() {
                    if($('.admin-image-gallary').html() == '') {
                        return;
                    }
                    var treeView = $find("<%= tvFolderImg.ClientID %>");
                    var node = treeView.get_selectedNode();
                    if (node == null) {
                        return;
                    }
                    var imgselected = $('input[name=projectimage]:checked').val();
                    var folderelected = node.get_value();
                    window.parent.getFolder(folderelected, imgselected);
                }

                function bindImageGridCallback(data) {
                    $('.admin-image-gallary').html(data.html);
                }

            </script>
            </telerik:RadCodeBlock>
        </form>
    </body>
</html>