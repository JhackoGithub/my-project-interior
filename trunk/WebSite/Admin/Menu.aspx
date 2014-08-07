<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebSite.Admin.Menu" Theme="BocaTheme" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:radscriptmanager runat="server" ID="RadScriptManager1" />
    <telerik:radskinmanager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
    <telerik:radformdecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div style="width: 50%; float: left; margin: 10px;">
        <div style="height: 40px; display: inline-flex;">
            <label style="vertical-align: baseline; width: 180px; float: left;">
                <input type="radio" id="rdArchi" name="rdType" value="0" checked="checked" style="width: 25px;" />Menu Công trình
            </label>
            <label style="vertical-align: baseline; width: 160px; float: left;">
                <input type="radio" id="rdInteri" name="rdType" value="1" style="width: 25px;" />Menu Nội thất
            </label>
            <label style="vertical-align: baseline; width: 160px; float: left;">
                <input type="radio" id="rdConsul" name="rdType" value="2" style="width: 25px;" />Menu Tư vấn
            </label>
        </div>
        <div id="divType" style="height: 40px;">
            <label style="vertical-align: baseline; width: 180px; float: left;">
                <input type="radio" id="rdParent" name="rdKind" value="0" checked="checked" style="width: 25px;" />Tạo menu đầu mục
            </label>
            <label style="vertical-align: baseline; width: 200px; float: left;">
                <input type="radio" id="rdChild" name="rdKind" value="1" style="width: 25px;" />Tạo menu con
            </label>
        </div>
        <div id="divControl" style="clear: both; height: 50px;">
            <div id="divPos" style="float: left;">
                <label>Vị trí sắp xếp</label>
                <input type="text" id="tbPos" placeholder="chỉ nhập số" style="width: 80px;"/>
            </div>
            <div id="divParent" style="float: left; display: none;">
                <label>Chọn menu đầu mục</label>
                <select id="parentid" style="width: 145px; height: 30px;">
                </select>
            </div>
        </div>
        <div style="clear: both;">
            <label>Tiêu đề</label>
            <input type="text" id="tbName"/>
        </div>
        <div style="clear: both;">
            <button type="button" id="btnCreate" onclick="">Tạo mới</button>
            <button type="button" id="btnCancel" onclick="location.reload()">Hủy</button>
        </div>
    </div>
    <div class="admin-project-cate" style="border-left: lightgray 1px solid; float: left; margin: 10px; width: 200px; padding-left: 30px;">
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
            callMenuHandler(url, data, AjaxConst.PostRequest, addMenuCallback);
        });

        function addMenuCallback(data) {
            if (data != "0") {
                bindMenu();
            }
        }

        function bindMenu() {
            var resType = $('input[name=rdType]:checked').val();
            var url = "../Handler/MenuHanlder.ashx?funcname=getall&type=" + resType;
            callMenuHandler(url, null, AjaxConst.GetRequest, bindMenuCallback);
        }

        function bindMenuCallback(data) {
            $('.admin-project-cate').html(data.menu);
            $('#parentid').html(data.dropdown);
        }

        function editMenu(id) {
            _id = id;
            var resType = $('input[name=rdType]:checked').val();
            var url = "../Handler/MenuHanlder.ashx?funcname=edit&id=" + id + "&type=" + resType;
            callMenuHandler(url, null, AjaxConst.GetRequest, getMenuByIdCallback);
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
            if(!res)
                return;
            var url = "../Handler/MenuHanlder.ashx?funcname=delete&id=" + id;
            callMenuHandler(url, null, AjaxConst.PostRequest, deleteMenuCallback);
        }

        function deleteMenuCallback(data) {
            if (data != "0") {
                bindMenu();
            }
        }
    </script>
</asp:Content>
