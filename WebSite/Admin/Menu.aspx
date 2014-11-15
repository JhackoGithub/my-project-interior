<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebSite.Admin.Menu" Theme="Windows7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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
                    <input type="radio" id="rdArchi" name="rdType" value="0" checked="checked" />Dự án kiểu Kiến trúc
                </label>
            </div>
            <div class="divMenuType">
                <label>
                    <input type="radio" id="rdInteri" name="rdType" value="1" />Dự án kiểu Nội thất
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
            <div id="divParent" style="padding-top: 10px;">
                <label>Chọn menu đầu mục:</label>
                <input id="parentid"/>
            </div>
            <div style="clear: both; padding-left: 10px;">
                <label id="lblmsg" style="color: red; display: none;">* Bấm nút Lưu thay đổi để hoàn tất</label><br />
                <button type="button" id="btnCreate">Tạo mới</button>
                <button type="button" id="btnCancel" onclick=" location.reload() ">Hủy</button>
            </div>
        </div>
        <div class="admin-project-cate" style="border-left: lightgray 1px solid; float: left; margin: 10px; padding-left: 30px; width: 310px;">
            <ul id="adminprojectcate"></ul>
        </div>
    </div>
    <script type="text/html" id="tempMenuProject">
        # for(var i = 0; i < data.length; i ++) { #
            # var menuParent = data[i]; #
            <li>
                <div style="height: 20px;">
                    <div style="float: left; text-transform: uppercase; padding-top: 5px;">#: menuParent.Name#</div>
                    <div style="float: right;">
                        <img onclick="editMenu(#: menuParent.Id#, true)" src="../Images/iEdit.png" width="16" title="Sửa"><img onclick="deleteMenu(#: menuParent.Id#)" src="../Images/iDelete.png" width="16" title="Xóa"></div>
                </div>
                #if(menuParent.Childs.length == 0){#
                 </li>
                #} else {#
                <ul>
                    # var childs = menuParent.Childs; #
                    # for(var x = 0; x < childs.length; x ++) { #
                        # var child = childs[x]; #
                        <li>
                            <div><span>#: child.Name#</span><div>
                                <img onclick="editMenu(#: child.Id#)" src="../Images/iEdit.png" width="16" title="Sửa">
                                <img onclick="deleteMenu(#: child.Id#)" src="../Images/iDelete.png" width="16" title="Xóa"></div>
                            </div>
                        </li>
                    #}#
                </ul>
             #}#
        #}#
    </script>

    <div id="divloading" class="loading" />
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

        $("input:radio[name=rdType]").click(function () {
            bindMenu();
        });

        $('#btnCreate').click(function () {
            var menu = new Object();
            bindControlToEntity(menu);
            var data = JSON.stringify(menu);
            var action = _id == 0 ? 'create' : 'update';
            var url = "../Handler/MenuHanlder.ashx?funcname=" + action + "&id=" + _id + "&type=" + menu.type;
            callAjaxHandler("divloading", url, data, AjaxConst.PostRequest, addMenuCallback);
        });

        function addMenuCallback(data) {
            if (data != "0") {
                bindMenu();
            }
        }

        function bindMenu() {
            var resType = $('input[name=rdType]:checked').val();
            var param = "&type=" + resType;
            var url = "../Handler/MenuHanlder.ashx?funcname=getall" + param;
            callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindMenuCallback);
        }

        function bindMenuCallback(data) {
            
            bindTemplate('adminprojectcate', "tempMenuProject", data.parent);
            dropdownBinding(data.parent, "parentid", "Name", "Id");
        }

        function bindControlToEntity(menu) {
            var resType = $('input:radio[name=rdType]:checked').val();
            menu.type = resType;
            var resKind = $('input:radio[name=rdKind]:checked').val();
            if (resKind == "0") {
                menu.position = 10;
                menu.parentid = null;
            } else {
                menu.position = null;
                menu.parentid = $('#parentid').val();
            }
            menu.subtype = null;
            menu.link = null;
            var name = $('#tbName').val();
            menu.name = name;
        }

        function bindEntityToControl(data) {
            var $rdType = $('input:radio[name=rdType]');
            var $rdKind = $('input:radio[name=rdKind]');

            $rdKind.attr('disabled', false);
            $rdType.attr('disabled', false);

            var filterkind = data.ParentId == null ? '[value="0"]' : '[value="1"]';
            $rdKind.filter(filterkind).click();

            var filtertype = '[value="' + data.Type + '"]';
            $rdType.filter(filtertype).click();

            if (data.ParentId != null) {
                dropdownSeletedValue("parentid", data.ParentId);
                //$('#parentid').val(data.ParentId);
            }

            $rdKind.attr('disabled', true);
            $rdType.attr('disabled', true);

            $('#tbName').val(data.Name);
            $('#btnCreate').html('Lưu thay đổi');
            $('#lblmsg').css("display", 'none');
        }

        function editMenu(id) {
            _id = id;
            var resType = $('input[name=rdType]:checked').val();
            var url = "../Handler/MenuHanlder.ashx?funcname=edit&id=" + id + "&type=" + resType;
            callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindEntityToControl);
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


    </script>
</asp:Content>
