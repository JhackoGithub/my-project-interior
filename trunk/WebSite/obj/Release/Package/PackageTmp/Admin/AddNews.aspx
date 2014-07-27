<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="WebSite.Admin.AddNews" Theme="BocaTheme" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <script type="text/javascript">
        function RadEditorLoad(editor, eventArgs) {
            // Set the Editor Default Font to Arial
            editor.get_contentArea().style.fontFamily = 'Arial,Helvetica,Tahoma';
            editor.get_contentArea().style.fontSize = '11px';
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div class="content-wrapper">
        <label id="lblTitle">Tiêu đề bài viết</label><br />
        <asp:TextBox runat="server" ID="tbTitle" Width="500px"></asp:TextBox>
        <br />
        <label id="lblSubcontent">Nội dung mô tả</label><br />
        <asp:TextBox runat="server" ID="tbSubcontent" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
        <br />
        <label id="lblImage">Ảnh mô tả</label><br />
        <asp:Image ID="imgNews" runat="server" ImageUrl="~/Images/no-image.png" Width="150" Height="150" />
        <br />
        <asp:FileUpload ID="fileUpload" runat="server" Width="299px" />
        <asp:Button ID="btnUpload" runat="server" Text="Tải ảnh" OnClick="btnUpload_Click" />

        <div style="clear: both;"></div>
        <div style="height: 550px; margin: 0 auto;">
            <label id="lblContent">Nội dung bài viết</label>

            <telerik:RadEditor runat="server" ID="radContent" Width="960" Height="500" Skin="Metro"
                OnClientLoad="RadEditorLoad">
                <ImageManager MaxUploadFileSize="157286400" SearchPatterns="*.gif,*.jpg,*.jpeg,*.png,*.bmp" ViewPaths="~/Images/Uploads/News" UploadPaths="~/Images/Uploads/News" DeletePaths="~/Images/Uploads/News"></ImageManager>
                <Modules>
                    <telerik:EditorModule Name="RadEditorStatistics" Visible="false" Enabled="true"></telerik:EditorModule>
                    <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="true"></telerik:EditorModule>
                    <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="true"></telerik:EditorModule>
                    <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="true"></telerik:EditorModule>
                </Modules>
                <Content></Content>
            </telerik:RadEditor>
        </div>
        <div style="clear: both;"></div>
        <div style="text-align: right;">
            <asp:Button runat="server" ID="btnSave" Text="Lưu" OnClick="btnSave_Click" />
        </div>
    </div>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
</asp:Content>
