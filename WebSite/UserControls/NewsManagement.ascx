<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsManagement.ascx.cs" Inherits="WebSite.UserControls.NewsManagement" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">
    #imagePreview {
        margin-top: 5px;
        width: 180px;
        height: 180px;
        background-position: center center;
        background-size: cover;
        -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
        display: inline-block;
        background-image: url(../Images/no-image.png);
    }
</style>
<telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
<telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
<telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />

<label id="lblTitle">Tiêu đề bài viết</label><br />
<asp:TextBox runat="server" ID="tbTitle" Width="500px"></asp:TextBox>
<br />
<label id="lblSubcontent">Nội dung mô tả</label><br />
<asp:TextBox runat="server" ID="tbSubcontent" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
<br />
<label id="lblImage">Ảnh mô tả (180px : 180px)</label><br />
<div id="imagePreview"></div>
<br />
<input id="uploadFile" runat="server" clientidmode="Static" type="file" name="image" />
<div style="clear: both;"></div>
<div style="height: 550px; margin: 0 auto;">
    <label id="lblContent">Nội dung bài viết</label>
    <br />
    <telerik:RadEditor runat="server" ID="radContent" Width="960" Height="500" Skin="Metro">
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

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#imagePreview").css("background-image", "url(<%= ImageUrl %>)");

            $("#uploadFile").on("change", function () {
                var files = !!this.files ? this.files : [];
                if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
                if (/^image/.test(files[0].type)) { // only image file
                    var reader = new FileReader(); // instance of the FileReader
                    reader.readAsDataURL(files[0]); // read the local file
                    reader.onloadend = function () { // set image data as background of div
                        $("#imagePreview").css("background-image", "url(" + this.result + ")");
                    };
                }
            });
        });
    </script>
</telerik:RadCodeBlock>
