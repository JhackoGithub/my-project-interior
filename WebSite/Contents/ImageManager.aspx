<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageManager.aspx.cs" Inherits="WebSite.Contents.ImageManager" Theme="Windows7" %>

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
            <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
            <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
            <div style="height: 460px; margin: 0 auto; padding: 10px; width: 730px;">
                <div style="background-color: lightcyan; float: left; height: 460px; min-width: 330px; overflow: auto;">
                    <telerik:RadTreeView runat="server" ID="tvFolderImg" ClientIDMode="Static" Skin="Windows7" OnClientNodeClicked=" ClientNodeClicked " OnClientLoad="onLoad">
                    </telerik:RadTreeView>
                </div>
                <telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadGrid"></telerik:RadAjaxLoadingPanel>
                <telerik:RadAjaxPanel ID="radAjaxPanel" runat="server" LoadingPanelID="radAjaxLoadGrid">
                    <div class="admin-image-gallary" runat="server"></div>
                </telerik:RadAjaxPanel>
            </div>
            <div style="border-top: gray solid 1px; clear: both; margin: 10px auto 0 auto; padding-top: 5px; text-align: right; width: 730px;">
                <button type="button" id="save" >Chọn thư mục</button>
                <button type="button" id="closepoup" >Hủy chọn</button>
            </div>
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">

                $(document).ready(function () {

                });

                $('#closepoup').click(function() {
                    window.parent.closeChildPopup();
                });
                
                $('#save').click(function () {
                    if ($('.admin-image-gallary').html() == '') {
                        return;
                    }
                    var treeView = $find("<%= tvFolderImg.ClientID %>");
                    var node = treeView.get_selectedNode();
                    if (node == null) {
                        return;
                    }
                    var imgselected = $('input:radio[name=projectimage]:checked').val();
                    var folderelected = node.get_value();
                    window.parent.getFolder(folderelected, imgselected);
                });
                
                function ClientNodeClicked(sender, eventArgs) {
                    var node = eventArgs.get_node();
                    var data = JSON.stringify(node.get_value());
                    var url = "../Handler/ImageHandler.ashx?funcname=select";
                    callAjaxHandler(url, data, AjaxConst.PostRequest, bindImageGridCallback);
                }

                function bindImageGridCallback(data) {
                    $('.admin-image-gallary').html(data.html);
                    var imgselected = window.parent.document.getElementById("lblImageSelected").innerHTML;
                    if (imgselected == null || imgselected == '')
                        return;
                    
                    var $inpuimage = $('input:radio[name=projectimage]');
                    var strfilterimg = '[value="' + imgselected + '"]';
                    $inpuimage.filter(strfilterimg).click();
                }
                
                function onLoad(sender, args) {
                    var tree = $find("<%= tvFolderImg.ClientID %>");
                    if (tree == null)
                        return;
                    var value = window.parent.document.getElementById("lblFolderSelected").innerHTML;
                    if (value == null || value == '')
                        return;
                    var node = tree.findNodeByValue(value);
                    if (node == null)
                        return;
                    node.get_parent().expand();
                    node.select();
                    var data = JSON.stringify(node.get_value());
                    var url = "../Handler/ImageHandler.ashx?funcname=select";
                    callAjaxHandler(url, data, AjaxConst.PostRequest, bindImageGridCallback);
                    
                    node = node.get_parent();
                    while (node != null) {
                        if (node.expand) {
                            node.expand();
                        }
                        node = node.get_parent();
                    }
                }

            </script>
            </telerik:RadCodeBlock>
        </form>
    </body>
</html>