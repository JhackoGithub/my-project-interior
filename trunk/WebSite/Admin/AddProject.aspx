<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="WebSite.Admin.AddProject" Theme="BocaTheme" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
    <style type="text/css">
        #wrapper-tab
        {
            background-color: #F4F0EE;
            border-top: 1px solid #ccc;
            /*border-bottom: 1px solid #ccc;*/
            height: 550px;
            padding: 10px;
        }

        #tabs > div
        {
            height: 550px;
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

        .rbl
        {
            margin-top: 0 !important;
        }

            .rbl label
            {
                display: block;
            }

            .rbl td
            {
                text-align: center;
            }
    </style>
    <script src="../Scripts/jquery.carouFredSel-6.0.4-packed.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div class="admin-projet-info">
        <div style="height: 300px;">
            <div class="admin-project-info-left">
                <div class="admin-project-add">
                    <div class="admin-project-add-label">Loại dự án</div>
                    <div class="admin-project-add-control" style="display: table-caption;">
                        <label style="vertical-align: baseline; width: 100px; float: left;">
                            <input type="radio" id="rdArchi" name="rdType" value="0" checked="checked" style="width: 25px;" />Công trình
                        </label>
                        <label style="vertical-align: baseline; width: 100px; float: left;">
                            <input type="radio" id="rdInteri" name="rdType" value="1" style="width: 25px;" />Nội thất
                        </label>
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
                    <div class="admin-project-add-control" style="height: 235px; width: 240px; overflow: auto;">
                        <div class="admin-project-cate" style="float: left; width: 220px;">
                            <%--<asp:Literal runat="server" ID="ltMenu"></asp:Literal>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="clear: both;"></div>
        <div id="wrapper-tab">
            <div id="pager">
            </div>
            <div id="tabs">
                <div id="project-info">
                    <h3 style="display: none;">Thông tin</h3>
                    <telerik:RadEditor runat="server" ID="radEditorInfo" Width="940" Height="550" Skin="Metro"
                        EditModes="Design">
                        <ImageManager MaxUploadFileSize="157286400" SearchPatterns="*.gif,*.jpg,*.jpeg,*.png,*.bmp" ViewPaths="~/Images/Uploads/News" UploadPaths="~/Images/Uploads/News" DeletePaths="~/Images/Uploads/News"></ImageManager>
                        <Modules>
                            <telerik:EditorModule Name="RadEditorHtmlInspector" Enabled="true" Visible="false" />
                            <telerik:EditorModule Name="RadEditorNodeInspector" Enabled="true" Visible="false" />
                            <telerik:EditorModule Name="RadEditorDomInspector" Enabled="false" Visible="False" />
                            <telerik:EditorModule Name="RadEditorStatistics" Enabled="false" Visible="False" />
                        </Modules>
                        <Content>
                        </Content>

                        <TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
                    </telerik:RadEditor>
                </div>
                <div id="project-desc">
                    <h3 style="display: none;">Thuyết minh</h3>
                    <telerik:RadEditor runat="server" ID="radEditorDesc" Width="940" Height="550" Skin="Metro" EditModes="Design">
                        <ImageManager MaxUploadFileSize="157286400" SearchPatterns="*.gif,*.jpg,*.jpeg,*.png,*.bmp" ViewPaths="~/Images/Uploads/News" UploadPaths="~/Images/Uploads/News" DeletePaths="~/Images/Uploads/News"></ImageManager>
                        <Modules>
                            <telerik:EditorModule Name="RadEditorStatistics" Visible="false" Enabled="false"></telerik:EditorModule>
                            <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="false"></telerik:EditorModule>
                            <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="false"></telerik:EditorModule>
                            <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="false"></telerik:EditorModule>
                        </Modules>
                        <Content>
                        </Content>

                        <TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
                    </telerik:RadEditor>
                </div>
            </div>
        </div>
    </div>
    <div style="text-align: right; padding-top: 5px; margin: 10px auto 0 auto;">
        <a class="k-button k-button-icontext k-grid-update" id="save" onclick="closePopup()"><span class="k-icon k-grid-update"></span>Tạo mới</a>
        <a class="k-button k-button-icontext k-grid-cancel" id="closepoup" onclick="closePopup()"><span class="k-icon k-cancel"></span>Hủy</a>
    </div>
    <div id="containerimages"></div>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            var wnd;
            $(document).ready(function () {
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
                
                bindMenu();
            });
            
            function showPopupImages() {
                $("#containerimages").html("");
                var url = "../Contents/ImageManager.aspx";
                wnd = ShowPopupIframe(750, 530, "Chọn thư mục ảnh dự án", "containerimages", url);
                $("#containerimages").parent().width(750).height(530);
            }
            
            function closePopup() {
                window.parent.closePopup();
            }

            function closeChildPopup() {
                wnd.close();
            }
            
            $("input:radio[name=rdType]").click(function () {
                bindMenu();
            });
            
            function bindMenu() {
                var resType = $('input[name=rdType]:checked').val();
                var url = "../Handler/MenuHanlder.ashx?funcname=getall&frm=project&type=" + resType;
                callMenuHandler(url, null, AjaxConst.GetRequest, bindMenuCallback);
            }
            
            function bindMenuCallback(data) {
                $('.admin-project-cate').html(data.menu);
            }
            
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
