<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Consultant.aspx.cs" Inherits="WebSite.Admin.Consultant" Theme="Windows7" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="Buttons, RadioButtons, Textbox, Fieldset" EnableRoundedCorners="false" />
    
    <div class="admin-projet-info">
        <div style="float: left; margin: 10px; width: 54%;">
            <div class="divMenuType">
                <label>
                    <input type="radio" id="rdConsulGeneral" name="rdConsulType" value="2" checked="checked"/>Tạo bài viết chung
                </label>
            </div>
            <div class="divMenuType">
                <label>
                    <input type="radio" id="rdConsulArchi" name="rdConsulType" value="0" />Tạo câu hỏi Tư vấn Kiến trúc
                </label>
            </div>
            <div class="divMenuType">
                <label>
                    <input type="radio" id="rdConsulInteri" name="rdConsulType" value="1" />Tạo câu hỏi Tư vấn Nội thất
                </label>
            </div>
            
            <div id="divType" style="height: 40px;">
                <label style="float: left; vertical-align: baseline; width: 160px;">
                    <input type="radio" id="rdParent" name="rdKind" value="0" style="width: 25px;" />Tạo menu đầu mục
                </label>
                <label style="float: left; vertical-align: baseline; width: 200px;">
                    <input type="radio" id="rdChild" name="rdKind" value="1" checked="checked" style="width: 25px;" />Tạo menu con
                </label>
            </div>
            <div style="clear: both;">
                <label id="lblTitle">Tiêu đề:</label>
                <input type="text" id="tbName" style="width: 300px;" /><span style="color: red;"> *</span>
            </div>
            <div id="divParent">
                <div class="parentid">
                    <label>Chọn menu đầu mục:</label>
                    <select id="parentid" style="height: 30px;"></select><span style="color: red;"> *</span>   
                </div>
                <div class="link-news">
                    <label>Liên kết tới bài viết: </label>
                    <a id="linkadd" href="javascript:;" style="display: inline-block;">Tạo liên kết</a>
                    <label id="lblnewid" style="display: none;"></label>    
                </div>
            </div>
            <div style="clear: both; padding-left: 10px; padding-top: 10px;">
                <button type="button" id="create">Tạo mới</button>
                <button type="button" id="cancel" onclick=" location.reload() ">Hủy</button>
            </div>
            
        </div>
        <div style="border-left: lightgray 1px solid; float: left; margin: 10px; padding-left: 30px; width: 310px;">
            <div class="admin-project-cate"></div>    
        </div>
    </div>
    <script id="kendo-temp" type="text/x-kendo-template">
        <div id="kendo-temp-edit">
            <div style="padding-top: 5px;">
                <label id="lblEditTitle">Tiêu đề:</label>
                <input type="text" id="tbEditName" style="width: 300px;" /><span style="color: red;"> *</span>
            </div>
            <div id="temp-childgroup" style="padding-top: 5px; height: 115px;">
                <div class="parentid">
                    <label>Chọn menu đầu mục:</label>
                    <select id="selection" style="height: 30px;"></select><span style="color: red;"> *</span>   
                </div>
                <div class="link-news" style="padding-top: 5px;">
                    <label>Liên kết tới bài viết: </label>
                    <a id="temp-addlink" href="javascript:;" style="display: inline-block;">Tạo liên kết</a>
                    <span id="temp-linktitle" style="cursor: pointer; text-decoration: underline;"></span>
                    <a id="temp-changelink" href="javascript:;" style="display: inline-block;">Thay đổi liên kết | </a><a id="temp-removelink" href="javascript:;" style="display: inline-block;">Xóa liên kết</a>
                </div>
            </div>
            <div style="border-top: gray solid 1px; padding-top: 5px; text-align: right; width: 430px;">
                <button type="button" id="update" >Lưu thay đổi</button>
                <button type="button" id="closepoup" >Hủy</button>
            </div>
            
        </div>
    </script>
    <div id="containernews"></div>
    <div id="containeredit"></div>
    <div id="divloading" class="loading" />
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            var _id = 0;
            var _isParent = true;
            var menu = new Object();
            var wndNews, wndEdit;
            $(document).ready(function () {
                bindMenu();
            });
        
            $("input:radio[name=rdKind]").click(function () {
                var value = $(this).val();
                if (value == '0') {
                    $("#divParent").css("display", "none");
                } else {
                    $("#divParent").css("display", "block");
                }
            });
        
            $("input:radio[name=rdConsulType]").click(function () {
                $("#rdChild").attr('disabled', false);;
                bindMenu();
                $('#tbName').val('');
                var resSubType = $('input:radio[name=rdConsulType]:checked').val();
                if(resSubType != '2') {
                    $("#lblTitle").html("Câu hỏi: ");
                } else {
                    $("#lblTitle").html("Tiêu đề: ");
                }
                if ($("#addlink").css('display') == 'none') {
                    $("#addlink").css("display", "inline-block");
                }
            });
        
            function bindMenu() {
                var subType = $('input:radio[name=rdConsulType]:checked').val();
                var url = "../Handler/MenuHanlder.ashx?funcname=getall&type=2&subtype=" + subType;
                callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindMenuCallback);
            }

            function bindMenuCallback(data) {
                $('.admin-project-cate').html(data.menu);
                $('#parentid').html(data.dropdown);
                if(data.dropdown == '') {
                    var $rdKind = $('input:radio[name=rdKind]');
                    $rdKind.filter('[value="0"]').click();
                    $("#rdChild").attr('disabled', true);
                }else {
                    if($('#rdChild').is('[disabled=disabled]')) {
                        $("#rdChild").attr('disabled', false);
                    }
                }
            }
        
            function bindControlToEntity(menu) {
                menu.type = 2;
                var resKind = $('input:radio[name=rdKind]:checked').val();
                if (resKind == "0") {
                    menu.position = 10;
                    menu.parentid = null;
                } else {
                    menu.position = null;
                    menu.parentid = $('#parentid').val();
                }
                var resSubType = $('input:radio[name=rdConsulType]:checked').val();
                menu.subtype = resSubType;

                var newsid = $('#lblNewsId').text();
                menu.link = newsid == '' ? null : newsid;
                var name = $('#tbName').val();
                menu.name = name;
            }
        
            $('#create').click(function () {
                var menu = new Object();
                bindControlToEntity(menu);
                var data = JSON.stringify(menu);
                var url = "../Handler/MenuHanlder.ashx?funcname=create&type=2";
                callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, addMenuCallback);
            });
            
            function addMenuCallback(data) {
                if (data != "0") {
                    bindMenu();
                }
            }

            function editMenu(id, isParent) {
                _id = id;
                _isParent = isParent;
                var url = "../Handler/MenuHanlder.ashx?funcname=edit&id=" + id + "&type=2";
                callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindEntityToControl);
            }

            function bindEntityToControl(data) {
                menu = data;
                wndEdit = ShowPopupTemplate(450, 200, "Thay đổ thông tin", "containeredit", "kendo-temp");
                if (menu.ParentId != null) {
                    var $options = $("#parentid > option").clone();
                    $('#containeredit #selection').append($options);
                    $('#containeredit #selection').val(menu.ParentId);
                } else {
                    $('#containeredit #temp-childgroup').css('visibility', 'hidden');
                }
                if (menu.Link > 0 && menu.Title != '') {
                    $("#lblnewid").text(menu.Link);
                    $('#containeredit #temp-linktitle').html(menu.Title);
                    $('#containeredit #temp-addlink').css('display', 'none');
                } else {
                    $('#containeredit #temp-changelink').css('display', 'none');
                    $('#containeredit #temp-removelink').css('display', 'none');
                }
                $('#containeredit #tbEditName').val(menu.Name);
                // save event
                $("#containeredit #update").click(function () {
                    update();
                    wndEdit.close();
                });
                // close event
                $("#containeredit #closepoup").click(function () {
                    wndEdit.close();
                });
                // add link event
                $("#containeredit #temp-addlink").click(function () {
                    showPopupLinkNews("containernews");
                });
                // change link event
                $("#containeredit #temp-changelink").click(function () {
                    showPopupLinkNews("containernews");
                });
                // remove link event
                $("#containeredit #temp-removelink").click(function () {
                    $("#lblnewid").text('');
                    $('#containeredit #temp-linktitle').html('');
                    $('#containeredit #temp-changelink').css('display', 'none');
                    $('#containeredit #temp-removelink').css('display', 'none');
                    $('#containeredit #temp-addlink').css('display', 'inline-block');
                });
            }

            function update() {
                var name = $('#containeredit #tbEditName').val();
                menu.Name = name;
                if (!_isParent) {
                    var newsid = $('#lblnewid').text();
                    menu.Link = newsid == '' ? null : newsid;
                    menu.ParentId = $('#parentid').val();
                }

                var data = JSON.stringify(menu);
                var url = "../Handler/MenuHanlder.ashx?funcname=update&type=2";
                callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, updateMenuCallback);
            }

            function updateMenuCallback(data) {
                if(data!= "0") {
                    bindMenu();
                }
            }
            
            function deleteMenu(id) {
                var res = confirm('Bạn có muốn xóa menu này?');
                if (!res)
                    return;
                var url = "../Handler/MenuHanlder.ashx?funcname=delete&id=" + id;
                callAjaxHandler("divloading", url, null, AjaxConst.PostRequest, deleteMenuCallback);
            }

            function deleteMenuCallback(data) {
                if (data != "0") {
                    bindMenu();
                }
            }
            
            $('#linkadd').click(function () {
                showPopupLinkNews("containernews");
            });

            function showPopupLinkNews(container) {
                $("#" + container).html("");
                var url = "../Contents/NewsCollection.aspx";
                wndNews = ShowPopupIframe(750, 450, "Chọn bài viết", container, url);
                $("#" + container).parent().width(750).height(450);
            }
            
            $('#linkdelete').click(function() {
                $('#lblNewsId').text('');
                $('#link' + _id).css("display", 'none');
            });
            
            function getNewsId(val, title) {
                $('#lblnewid').text(val);
                $('#containeredit #temp-linktitle').html(title);
                closeChildPopup();
            }
            
            function closeChildPopup() {
                wndNews.close();
            }
            
        </script>
    </telerik:RadCodeBlock>
</asp:Content>