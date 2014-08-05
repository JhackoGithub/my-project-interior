<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageManager.aspx.cs" Inherits="WebSite.Contents.ImageManager" Theme="BocaTheme" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/Kendo/kendo.common.min.css" rel="stylesheet" />
    <link href="../Content/Kendo/kendo.default.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
        <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
        <div style="width: 680px; height: 530px; padding: 10px; margin: 0 auto;">
            <div style="float: left; height: 530px; border-right: 1px gray solid; overflow: auto;">
                <telerik:RadTreeView runat="server" ID="tvFolderImg" Skin="Metro">
                </telerik:RadTreeView>
            </div>
            <div style="float: right;">
            </div>
            <div style="text-align: right; padding-top: 10px; clear: both;">
                <a class="k-button k-button-icontext k-grid-update" id="save" onclick="closePopup() "><span class="k-icon k-grid-update"></span>Tạo mới</a>
                <a class="k-button k-button-icontext k-grid-cancel" id="closepoup" onclick="closePopup() "><span class="k-icon k-cancel"></span>Hủy</a>
            </div>
        </div>
        <script type="text/javascript">
            function closePopup() {
                window.parent.closePopup();
            }
        </script>
    </form>
</body>
</html>
