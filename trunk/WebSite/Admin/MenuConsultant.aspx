<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="MenuConsultant.aspx.cs" Inherits="WebSite.Admin.MenuConsultant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 50%; float: left; margin: 10px;">
        <div id="divType" style="height: 40px;">
            <label style="vertical-align: baseline; width: 160px; float: left;">
                <input type="radio" id="parent" name="rdType" value="parent" checked="checked" style="width: 25px;" />Tạo menu đầu mục
            </label>
            <label style="vertical-align: baseline; width: 200px; float: left;">
                <input type="radio" id="child" name="rdType" value="child" style="width: 25px;" />Tạo menu con
            </label>
        </div>
        <div id="divControl" style="clear: both;">
            <div id="divPos" style="float: left;">
                <label>Vị trí sắp xếp</label>
                <asp:TextBox runat="server" ID="tbPos" placeholder="chỉ nhập số" Width="100"></asp:TextBox>
            </div>
            <div id="divParent" style="float: left; display: none;">
                <label>Chọn menu đầu mục</label>
                <asp:DropDownList runat="server" ID="ddlParent" Width="200"/>
            </div>
        </div>
        <div style="clear: both;">
            <label>Tiêu đề</label>
            <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
        </div>
        <div style="clear: both;">
            <asp:Button runat="server" ID="btnCreate" Text="Tạo mới" OnClick="btnCreate_Click"></asp:Button>
            <asp:Button runat="server" ID="btnCancel" Text="Hủy"></asp:Button>
        </div>
    </div>
    <div id='cssmenu' style="border-left: lightgray 1px solid; float: left; margin: 10px;">
        <asp:Literal runat="server" ID="ltMenu"></asp:Literal>
    </div>
    <script type="text/javascript">
        $(function() {
            $("#divType input").click( function() {
                if(this.value == 'parent') {
                    $("#divControl #divPos").css("display", "block");
                    $("#divControl #divParent").css("display", "none");
                } else {
                    $("#divControl #divPos").css("display", "none");
                    $("#divControl #divParent").css("display", "block");
                }
                
            });
        });
    </script>
</asp:Content>
