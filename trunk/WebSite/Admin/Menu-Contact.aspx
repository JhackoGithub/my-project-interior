<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Menu-Contact.aspx.cs" Inherits="WebSite.Admin.Menu_Contact" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="Buttons, RadioButtons, Textbox, Fieldset" EnableRoundedCorners="false" />

    <div class="admin-projet-info">
        <div style="float: left; margin: 10px; width: 54%;">
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
            <div style="clear: both; padding-left: 10px;">
                <label id="lblmsg" style="color: red; display: none;">* Bấm nút Lưu thay đổi để hoàn tất</label><br />
                <button type="button" id="btnCreate">Tạo mới</button>
                <button type="button" id="btnCancel" onclick=" location.reload() ">Hủy</button>
            </div>
        </div>
        <div class="admin-project-cate" style="border-left: lightgray 1px solid; float: left; margin: 10px; padding-left: 30px; width: 310px;"></div>
    </div>
    <div id="divloading" class="loading" />
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                bindMenu();
            });
            
            function bindMenu() {
                var url = "../Handler/MenuHanlder.ashx?funcname=getall&type=3";
                callAjaxHandler("divloading", url, null, AjaxConst.GetRequest, bindMenuCallback);
            }
            
            function bindMenuCallback(data) {
                $('.admin-project-cate').html(data.menu);
                $('select').html(data.dropdown);
            }
            
            $("input:radio[name=rdKind]").click(function () {
                var value = $(this).val();
                if (value == '0') {
                    $("#divParent").css("display", "none");
                } else {
                    $("#divParent").css("display", "block");
                }
            });
            
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
