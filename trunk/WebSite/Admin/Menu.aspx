﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebSite.Admin.Menu" Theme="BocaTheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
        <div id="divControl" style="clear: both; height: 70px;">
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
            <button type="button" id="btnCancel" onclick="">Hủy</button>
        </div>
    </div>
    <div class="admin-project-cate" style="border-left: lightgray 1px solid; float: left; margin: 10px; width: 200px; padding-left: 30px;">
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
          
            bindMenu();
            
            $('.action-image').click(function () {
                var id = $(this).attr('value');
                console.log("id: " + id);
            });
            
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

        $('#btnCreate').click(function () {
            var menu = new Object();
            var resType = $('input[name=rdType]:checked').val();
            menu.type = resType;
            var resKind = $('input[name=rdKind]:checked').val();
            if(resKind == "0") {
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
            var data = JSON.stringify(menu);
            var url = "../Handler/MenuHanlder.ashx?funcname=create&type= " + resType;
            callMenuHandler(url, data, AjaxConst.PostRequest, addMenuCallback);
        });

        function addMenuCallback(data) {
            if (data != "0") {
                bindMenu();
            }
        }

        function bindMenu() {
            var resType = $('input[name=rdType]:checked').val();
            var url = "../Handler/MenuHanlder.ashx?funcname=getall&type= " + resType;
            callMenuHandler(url, null, AjaxConst.GetRequest, bindMenuCallback);
        }

        function bindMenuCallback(data) {
            $('.admin-project-cate').html(data.menu);
            $('#parentid').html(data.dropdown);
        }

        


    </script>
</asp:Content>