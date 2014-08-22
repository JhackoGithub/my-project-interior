<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebSite.Admin.Menu" Theme="Windows7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
    <style type="text/css">
        .divMenuType
        {
            clear: both;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div class="admin-projet-info">
        <div style="float: left; margin: 10px; width: 50%;">

            <fieldset style="padding: 20px; display: block; margin-bottom: 10px;">
                <legend style="display: block !important">Chọn loại menu</legend>
                <div class="divMenuType">
                    <label style="float: left; vertical-align: baseline; width: 160px;">
                        <input type="radio" id="rdArchi" name="rdType" value="0" checked="checked" style="width: 25px;" />Menu dự án Kiến trúc
                    </label>
                </div>
                <div class="divMenuType">
                    <label style="float: left; vertical-align: baseline; width: 160px;">
                        <input type="radio" id="rdInteri" name="rdType" value="1" style="width: 25px;" />Menu dự án Nội thất
                    </label>
                </div>
                <div class="divMenuType">
                    <label style="float: left; vertical-align: baseline; width: 160px;">
                        <input type="radio" id="rdConsul" name="rdType" value="2" style="width: 25px;" />Menu Tư vấn
                    </label>
                    <div>
                        <label style="float: left; vertical-align: baseline; width: 160px;">
                            <input type="radio" id="Radio1" name="rdType" value="0" checked="checked" style="width: 25px;" />Menu dự án Kiến trúc
                        </label>
                        <label style="float: left; vertical-align: baseline; width: 160px;">
                            <input type="radio" id="Radio2" name="rdType" value="1" style="width: 25px;" />Menu dự án Nội thất
                        </label>
                    </div>
                </div>
                <div class="divMenuType">
                    <label style="float: left; vertical-align: baseline; width: 160px;">
                        <input type="radio" id="rdContact" name="rdType" value="3" style="width: 25px;" />Menu Liên hệ
                    </label>
                </div>
            </fieldset>
            <%--<div style="clear: both;"></div>
            <fieldset style="padding: 20px; display: block; margin-bottom: 10px;">
                <legend style="display: block !important">Menu tin và bài viết</legend>
                
                
            </fieldset>--%>
            <div id="divType" style="height: 40px; padding-left: 20px;">
                <label style="float: left; vertical-align: baseline; width: 160px;">
                    <input type="radio" id="rdParent" name="rdKind" value="0" checked="checked" style="width: 25px;" />Tạo menu đầu mục
                </label>
                <label style="float: left; vertical-align: baseline; width: 200px;">
                    <input type="radio" id="rdChild" name="rdKind" value="1" style="width: 25px;" />Tạo menu con
                </label>
            </div>
            <div id="divControl" style="clear: both; height: 50px; padding-left: 20px;">
                <div id="divPos" style="float: left;">
                    <label>Vị trí sắp xếp</label>
                    <input type="text" id="tbPos" placeholder="chỉ nhập số" style="width: 80px;" />
                </div>
                <div id="divParent" style="display: none; float: left;">
                    <label>Chọn menu đầu mục</label>
                    <select id="parentid" style="height: 30px; width: 145px;">
                    </select>
                </div>
            </div>
            <div style="clear: both; padding-left: 20px;">
                <label>Tiêu đề</label>
                <input type="text" id="tbName" />
            </div>
            <div style="clear: both; padding-top: 10px; padding-left: 20px;">
                <button type="button" id="btnCreate">Tạo mới</button>
                <button type="button" id="btnCancel" onclick=" location.reload() ">Hủy</button>
            </div>
        </div>
        <div class="admin-project-cate" style="border-left: lightgray 1px solid; float: left; margin: 10px; padding-left: 30px; width: 310px;">
        </div>
    </div>
    <script type="text/javascript">

        var _id = 0;

        $(document).ready(function () {

            bindMenu();

        });

        $("input:radio[name=rdKind]").click(function () {
            var value = $(this).val();
            if (value == '0') {
                $("#divControl #divPos").css("display", "block");
                $("#divControl #divParent").css("display", "none");
            } else {
                $("#divControl #divPos").css("display", "none");
                $("#divControl #divParent").css("display", "block");
            }
        });

        $("input:radio[name=rdType]").click(function () {
            bindMenu();
        });

        function bindControlToEntity(menu) {
            var resType = $('input:radio[name=rdType]:checked').val();
            menu.type = resType;
            var resKind = $('input:radio[name=rdKind]:checked').val();
            if (resKind == "0") {
                var pos = $('#tbPos').val();
                menu.position = pos;
                menu.parentid = null;
            } else {
                menu.position = null;
                var parentid = $('#parentid').val();
                menu.parentid = parentid;
            }
            var name = $('#tbName').val();
            menu.name = name;
        }

        $('#btnCreate').click(function () {
            var menu = new Object();
            bindControlToEntity(menu);
            var data = JSON.stringify(menu);
            var action = _id == 0 ? 'create' : 'update';
            var url = "../Handler/MenuHanlder.ashx?funcname=" + action + "&id=" + _id + "&type=" + menu.type;
            callAjaxHandler(url, data, AjaxConst.PostRequest, addMenuCallback);
        });

        function addMenuCallback(data) {
            if (data != "0") {
                bindMenu();
            }
        }

        function bindMenu() {
            var resType = $('input[name=rdType]:checked').val();
            var url = "../Handler/MenuHanlder.ashx?funcname=getall&type=" + resType;
            callAjaxHandler(url, null, AjaxConst.GetRequest, bindMenuCallback);
        }

        function bindMenuCallback(data) {
            $('.admin-project-cate').html(data.menu);
            $('#parentid').html(data.dropdown);
        }

        function editMenu(id) {
            _id = id;
            var resType = $('input[name=rdType]:checked').val();
            var url = "../Handler/MenuHanlder.ashx?funcname=edit&id=" + id + "&type=" + resType;
            callAjaxHandler(url, null, AjaxConst.GetRequest, getMenuByIdCallback);
        }

        function getMenuByIdCallback(data) {
            var $rdType = $('input:radio[name=rdType]');
            var $rdKind = $('input:radio[name=rdKind]');
            $rdKind.attr('disabled', false);
            $rdType.attr('disabled', false);

            var strfilter = data.ParentId == null ? '[value="0"]' : '[value="1"]';
            $rdKind.filter(strfilter).click();

            if (data.ParentId == null) {
                $('#tbPos').val(data.Position);
            } else {
                $('#parentid').val(data.ParentId);
            }

            $rdKind.attr('disabled', true);
            $rdType.attr('disabled', true);

            $('#tbName').val(data.Name);
            $('#btnCreate').html('Lưu thay đổi');
        }

        function deleteMenu(id) {
            var res = confirm('Bạn có muốn xóa menu này?');
            if (!res)
                return;
            var url = "../Handler/MenuHanlder.ashx?funcname=delete&id=" + id;
            callAjaxHandler(url, null, AjaxConst.PostRequest, deleteMenuCallback);
        }

        function deleteMenuCallback(data) {
            if (data != "0") {
                bindMenu();
            }
        }
    </script>
</asp:Content>
