<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="WebSite.Contents.AddProject" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #wrapper-tab
        {
            background-color: #F4F0EE;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            width: 830px;
            height: 440px;
            padding: 10px;
        }

        #tabs > div
        {
            width: 830px;
            height: 440px;
            float: left;
            overflow: hidden;
            padding-top: 2px;
        }

        #tabs img
        {
            display: block;
            margin: 0 25px 0 0;
            float: left;
        }

        #tabs h3
        {
            font-size: 30px;
            line-height: 20px;
            margin: 60px 0 20px 0;
        }

        #tabs #project-desc img
        {
            margin-top: 30px;
            text-align: center;
        }

        #pager
        {
            width: 830px;
            margin: -41px auto 0px auto;
            text-align: left;
        }

            #pager a
            {
                border: 1px solid transparent;
                border-bottom: none;
                border-left: none;
                border-color: #ccc;
                color: #999;
                font-size: 17px;
                text-decoration: none;
                /*line-height: 30px;*/
                display: inline-block;
                /*height: 30px;*/
                padding: 5px 20px;
            }

                #pager a:hover
                {
                    color: #666;
                }

                #pager a:first-child
                {
                    border-left: 1px solid #ccc;
                }

                #pager a.selected
                {
                    background-color: #F4F0EE;
                    color: #333;
                }
    </style>
    <link href="../Content/Kendo/kendo.common.min.css" rel="stylesheet" />
    <link href="../Content/Kendo/kendo.default.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/jquery.carouFredSel-6.0.4-packed.js"></script>
    <script src="../Scripts/kendo.core.min.js"></script>
    <script src="../Scripts/kendo.web.min.js"></script>
    <script src="../Scripts/Script.js"></script>

    <script type="text/javascript">
        $(function () {
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
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
        <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
        <div class="admin-projet-info">
            <div style="height: 260px;">
                <div class="admin-project-info-left">
                    <div class="admin-project-add">
                        <div class="admin-project-add-label">Loại dự án</div>
                        <div class="admin-project-add-control">
                            <asp:DropDownList runat="server" ID="ddlType">
                                <Items>
                                    <asp:ListItem Value="0" Text="Công trình" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Nội thất"></asp:ListItem>
                                </Items>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="admin-project-add">
                        <div class="admin-project-add-label">Tên dự án</div>
                        <div class="admin-project-add-control">
                            <asp:TextBox runat="server" ID="tbName" Width="200"></asp:TextBox>
                        </div>
                    </div>
                    <div class="admin-project-add">
                        <button type="button" onclick="showPopupImages()">Chọn thư mục hình ảnh</button>
                    </div>
                </div>
                <div class="admin-project-info-right">
                    <div class="admin-project-add">
                        <div class="admin-project-add-label">Kiểu dự án</div>
                        <div class="admin-project-add-control" style="height: 200px; width: 240px; overflow: auto;">
                        <div class="admin-project-cate" style="float: left; width: 220px;">
                            <ul>
                                <li><span>Biệt thự</span>
                                    <ul>
                                        <li class="even">
                                            <asp:RadioButton runat="server" GroupName="Project-Type" ID="rdVillaModern" Text="Hiện đại" />
                                        </li>
                                        <li class="last odd">
                                            <asp:RadioButton runat="server" GroupName="Project-Type" ID="rdVillaClassic" Text="Cổ điển" />
                                        </li>
                                    </ul>
                                </li>
                                <li><span>Nhà lô phố</span><ul>
                                    <li class="even">
                                        <asp:RadioButton runat="server" GroupName="Project-Type" ID="rdBatchModern" Text="Hiện đại" />
                                    </li>
                                    <li class="last odd">
                                        <asp:RadioButton runat="server" GroupName="Project-Type" ID="rdBatchClassic" Text="Cổ điển" />
                                    </li>
                                </ul>
                                </li>
                            </ul>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="wrapper-tab">
                <div id="pager">
                </div>
                <div id="tabs">
                    <div id="project-info">
                        <h3 style="display: none;">Thông tin</h3>
                        <telerik:RadEditor runat="server" ID="radEditorInfo" Width="830" Height="440" Skin="Metro"
                            EditModes="Design">
                            <ImageManager MaxUploadFileSize="157286400" SearchPatterns="*.gif,*.jpg,*.jpeg,*.png,*.bmp" ViewPaths="~/Images/Uploads/News" UploadPaths="~/Images/Uploads/News" DeletePaths="~/Images/Uploads/News"></ImageManager>
                            <Modules>

                                <telerik:EditorModule Name="RadEditorHtmlInspector" Enabled="true" Visible="false" />
                                <telerik:EditorModule Name="RadEditorNodeInspector" Enabled="true" Visible="false" />
                                <telerik:EditorModule Name="RadEditorDomInspector" Enabled="false" Visible="False" />
                                <telerik:EditorModule Name="RadEditorStatistics" Enabled="false" Visible="False" />

                            </Modules>
                            <Content></Content>
                        </telerik:RadEditor>
                    </div>
                    <div id="project-desc">
                        <h3 style="display: none;">Thuyết minh</h3>
                        <telerik:RadEditor runat="server" ID="radEditorDesc" Width="830" Height="440" Skin="Metro" EditModes="Design">
                            <ImageManager MaxUploadFileSize="157286400" SearchPatterns="*.gif,*.jpg,*.jpeg,*.png,*.bmp" ViewPaths="~/Images/Uploads/News" UploadPaths="~/Images/Uploads/News" DeletePaths="~/Images/Uploads/News"></ImageManager>
                            <Modules>
                                <telerik:EditorModule Name="RadEditorStatistics" Visible="false" Enabled="false"></telerik:EditorModule>
                                <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="false"></telerik:EditorModule>
                                <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="false"></telerik:EditorModule>
                                <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="false"></telerik:EditorModule>
                            </Modules>
                            <Content></Content>
                        </telerik:RadEditor>
                    </div>
                </div>
            </div>
            <div style="text-align: right; padding-top: 10px;">
                <a class="k-button k-button-icontext k-grid-update" id="save" onclick="closePopup() "><span class="k-icon k-grid-update"></span>Tạo mới</a>
                <a class="k-button k-button-icontext k-grid-cancel" id="closepoup" onclick="closePopup() "><span class="k-icon k-cancel"></span>Hủy</a>
            </div>
        </div>
        <div id="containerimages"></div>
        <script type="text/javascript">

            var wnd;
            function showPopupImages() {
                $("#containerimages").html("");
                var url = "../Contents/ImageManager.aspx";
                wnd = ShowPopupIframe(700, 600, "Tạo mới dự án", "containerimages", url);
                $("#containerimages").parent().width(700).height(600);
            }
            function closePopup() {
                window.parent.closePopup();
            }
        </script>
    </form>
</body>
</html>
