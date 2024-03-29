﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="WebSite.Admin.AddProject" Theme="Windows7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
    <style type="text/css">
        #wrapper-tab {
            height: 585px;
            padding-top: 25px;
        }

        #tabs > div {
            float: left;
            height: 550px;
            overflow: hidden;
            padding-top: 2px;
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
            margin: 0px auto;
            text-align: left;
        }

        #pager a {
            border: 1px solid transparent;
            border-bottom: none;
            border-color: #ccc;
            border-left: none;
            color: #999;
            /*line-height: 30px;*/
            display: inline-block;
            font-size: 17px;
            /*height: 30px;*/
            padding: 5px 20px;
            text-decoration: none;
        }

        #pager a:hover { color: #666; }

        #pager a:first-child { border-left: 1px solid #ccc; }

        #pager a.selected {
            background-color: #F4F0EE;
            color: #333;
        }

        .rbl { margin-top: 0 !important; }

        .rbl label { display: block; }

        .rbl td { text-align: center; }

    </style>
    <script src="../Scripts/jquery.carouFredSel-6.0.4-packed.js"> </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div class="admin-projet-info">
        <div class="notify-msg">Yêu cầu điền đầy đủ thống tin các trường có dấu *</div>
        <div style="height: 340px;">
            <div class="admin-project-info-left">
                <div class="admin-project-add">
                    <div class="admin-project-add-label">Loại dự án</div>
                    <div class="admin-project-add-control" style="display: table-caption;">
                        <label style="float: left; vertical-align: baseline; width: 100px;">
                            <input type="radio" id="rdArchi" name="rdType" value="0" checked="checked" style="width: 25px;" />Kiến trúc
                        </label>
                        <label style="float: left; vertical-align: baseline; width: 100px;">
                            <input type="radio" id="rdInteri" name="rdType" value="1" style="width: 25px;" />Nội thất
                        </label>
                    </div>
                </div>
                <div class="admin-project-add">
                    <div class="admin-project-add-label">Tên dự án</div>
                    <div class="admin-project-add-control">
                        <input type="text" id="tbName" maxlength="200" style="width: 400px;"/><span style="color: red;"> *</span>
                    </div>
                </div>
                <div class="admin-project-add">
                    <button type="button" id="showPopupImage" >Chọn thư mục hình ảnh</button><span style="color: red;"> *</span>
                    <label id="lblFolderSelected" style="display: block; background-color: lightcyan;"></label>
                    <label id="lblImageSelected" style="display: none;"></label>
                    <div style="text-align: center; border: 1px solid; margin-top: 5px;">
                        <img id="imgthumb" src="/Images/no-image.png" height="150"/>
                        <br/>
                        <span>(ảnh đại diện)</span>
                    </div>
                </div>
            </div>
            <div class="admin-project-info-right">
                <div class="admin-project-add">
                    <div class="admin-project-add-label">Kiểu dự án<span style="color: red;"> *</span></div>
                    <div class="admin-project-add-control" style="height: 235px; overflow: auto; width: 240px;">
                        <div class="admin-project-cate" style="float: left; width: 220px;">
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
                    <telerik:RadEditor runat="server" ID="radEditorInfo" ClientIDMode="Static" Width="940" Height="550" Skin="Windows7"
                                       EditModes="Design" BackColor="White" ContentAreaMode="Iframe">
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
                    <telerik:RadEditor runat="server" ID="radEditorDesc" ClientIDMode="Static" Width="940" Height="550" Skin="Windows7" 
                        EditModes="Design" BackColor="White" ContentAreaMode="Iframe">
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
    <div style="margin: 10px auto 0 auto; padding-top: 5px; text-align: right;">
        <button type="button" id="btnSave" >Tạo mới</button>
        <button type="button" id="closepoup" >Hủy</button>
    </div>
    <div id="containerimages"></div>
    <div id="divloading" class="loading" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            var wnd;
            var _id = 0;
            $(document).ready(function() {
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
                _id = getParameterByName('id');
                bindMenu();
                bindProjectById();
            });

            function bindProjectById() {
                if (_id == "0")
                    return;
                var url = "../Handler/ProjectHandler.ashx?funcname=edit&id=" + _id;
                callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindProjectByIdCallback);
            }

            function bindProjectByIdCallback(data) {
                if (data == null || data.project == null)
                    return;
                bindEntityToControl(data.project);
            }

            $('#showPopupImage').click(function () {
                $("#containerimages").html("");
                var url = "../Contents/ImageManager.aspx";
                wnd = ShowPopupIframe(750, 530, "Chọn thư mục ảnh dự án", "containerimages", url);
                $("#containerimages").parent().width(750).height(530);
            });

            function getFolder(folder, image) {
                $('#lblFolderSelected').text(folder);
                $('#lblImageSelected').text(image);
                var src = "\\Images\\projects\\" + folder + "\\" + image;
                $('#imgthumb').attr("src", src);
                closeChildPopup();
            }

            function closeChildPopup() {
                wnd.close();
            }

            $("input:radio[name=rdType]").click(function() {
                bindMenu();
            });

            function bindMenu() {
                var resType = $('input[name=rdType]:checked').val();
                var url = "../Handler/MenuHanlder.ashx?funcname=getall&frm=project&type=" + resType + "&projectid=" + _id;
                callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindMenuCallback);
            }

            function bindMenuCallback(data) {
                $('.admin-project-cate').html(data.menu);
            }

            function bindControlToEntity(project) {
                var resType = $('input:radio[name=rdType]:checked').val();
                var resKind = $('input:radio[name=rdKind]:checked').val();
                var name = $('#tbName').val();
                var pathImage = $('#lblFolderSelected').text();
                var imgName = $('#lblImageSelected').text();

                var editorDesc = $find("<%= radEditorDesc.ClientID %>");
                var editorInfo = $find("<%= radEditorInfo.ClientID %>");
                var textDesc = editorDesc.get_html();
                var textInfo = editorInfo.get_html();

                project.type = resType;
                project.categoryid = resKind;
                project.name = name;
                project.primaryimage = imgName;
                project.pathimage = pathImage;
                project.description = textDesc;
                project.information = textInfo;
            }

            function bindEntityToControl(project) {
                var $rdType = $('input:radio[name=rdType]');
                var strfilterType = project.Type == 0 ? '[value="0"]' : '[value="1"]';
                $rdType.filter(strfilterType).click();

                var editorDesc = $find("<%= radEditorDesc.ClientID %>");
                var editorInfo = $find("<%= radEditorInfo.ClientID %>");
                editorDesc.set_html(project.Description);
                editorInfo.set_html(project.Information);
                $('#tbName').val(project.Name);

                $('#lblFolderSelected').text(project.PathImage);
                $('#lblImageSelected').text(project.PrimaryImage);

                $('#btnSave').html('Lưu thay đổi');
                $rdType.attr('disabled', true);
            }

            $('#btnSave').click(function () {
                var res = validation();
                if (!res)
                    return;
                var project = new Object();
                bindControlToEntity(project);
                var data = JSON.stringify(project);
                var action = _id == 0 ? 'create' : 'update';
                var url = "../Handler/ProjectHandler.ashx?funcname=" + action + "&id=" + _id;
                callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, createProjectCallback);
            });

            function createProjectCallback(data) {
                if (data != "0") {
                    var msg = _id == 0 ? "Đã thêm mới thành công" : "Bản ghi đã được thay đổi";
                    alert(msg);
                    window.location.href = "/Admin/Project.aspx";
                }
            }

            function validation() {
                $(".notify-msg").css("display", "none");
                var name = $('#tbName').val();
                var pathImage = $('#lblFolderSelected').text();
                var resKind = $('input:radio[name=rdKind]:checked').val();
                if (name == '' || pathImage == '' || !resKind) {
                    $(".notify-msg").css("display", "block");
                    return false;
                }
                return true;
            }
           
        </script>
    </telerik:RadCodeBlock>
</asp:Content>