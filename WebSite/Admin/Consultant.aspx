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
                <input type="text" id="tbName" style="width: 300px;" />
            </div>
            <div id="divParent">
                <div class="parentid">
                    <label>Chọn menu đầu mục:</label>
                    <select id="parentid" style="height: 30px;"></select>    
                </div>
                <div class="link-news">
                    <label>Liên kết tới bài viết: </label>
                    <img id="linkadd" src="../Images/link_add.png" title="Tạo liên kết tới bài viết" width="25" style="cursor: pointer;" />
                    <img id="linkdelete" src="../Images/link_delete.png" title="Xóa liên kết tới bài viết" width="25" style="cursor: pointer; display: none;" />
                    <label id="lblNewsId" style="display: none;"></label>    
                </div>
            </div>
            <div style="clear: both; padding-left: 10px; padding-top: 10px;">
                <label id="lblmsg" style="color: red; display: none;">* Bấm nút Lưu thay đổi để hoàn tất</label><br />
                <button type="button" id="btnCreate">Tạo mới</button>
                <button type="button" id="btnCancel" onclick=" location.reload() ">Hủy</button>
            </div>

        </div>
        <div style="border-left: lightgray 1px solid; float: left; margin: 10px; padding-left: 30px; width: 310px;">
            <label>Menu chung cho Kiến trúc và Nội thất</label>
            <div id="project-cate-common" class="admin-project-cate" style="padding-top: 5px; padding-bottom: 15px;"></div>    
            <label>Câu hỏi tư vấn</label>
            <div id="project-cate-separate" class="admin-project-cate" style="padding-top: 5px;"></div>    
        </div>
        
    </div>
    <div id="divloading" class="loading" />
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            var _id = 0;
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
                bindMenu();
                var resSubType = $('input:radio[name=rdConsulType]:checked').val();
                if(resSubType != '2') {
                    $("#lblTitle").html("Câu hỏi: ");
                } else {
                    $("#lblTitle").html("Tiêu đề: ");
                }
            });
        
            function bindMenu() {
                var resSubType = $('input:radio[name=rdConsulType]:checked').val();
                var param = "&type=2&subtype=" + resSubType;
                var url = "../Handler/MenuHanlder.ashx?funcname=getall" + param;
                callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindMenuCallback);
            }

            function bindMenuCallback(data) {
                $('#project-cate-common').html(data.menu);
                $('select').html(data.dropdown);
            }
        
            function bindControlToEntity(menu) {
                menu.type = 2;
                var resKind = $('input:radio[name=rdKind]:checked').val();
                if (resKind == "0") {
                    menu.position = 10;
                    menu.parentid = null;
                } else {
                    menu.position = null;
                    var parentid = $('#parentid').val();
                    menu.parentid = parentid;
                }
                var resSubType = $('input:radio[name=rdConsulType]:checked').val();
                menu.subtype = resSubType;

                var newsid = $('#lblNewsId').text();
                menu.link = newsid == '' ? null : newsid;
                var name = $('#tbName').val();
                menu.name = name;
            }
        
            $('#btnCreate').click(function () {
                var menu = new Object();
                bindControlToEntity(menu);
                var data = JSON.stringify(menu);
                var action = _id == 0 ? 'create' : 'update';
                var url = "../Handler/MenuHanlder.ashx?funcname=" + action + "&id=" + _id + "&type=2";
                callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, addMenuCallback);
            });
        
            function addMenuCallback(data) {
                if (data != "0") {
                    bindMenu();
                }
            }

        </script>
    </telerik:RadCodeBlock>
</asp:Content>