<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="WebSite.Admin.AddNews" Theme="BocaTheme" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <style type="text/css">
        #imagePreview
        {
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
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


    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            $(function () {
                $("#imagePreview").css("background-image", "url(<%= ImageUrl%>)");

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

            function RadEditorLoad(editor, eventArgs) {
                // Set the Editor Default Font to Arial
                editor.get_contentArea().style.fontFamily = 'Arial,Helvetica,Tahoma';
                editor.get_contentArea().style.fontSize = '11px';
            }

            function confirmDialog(msg) {
                var res = confirm(msg);
                if (res) {
                    window.location.href = "/Admin/News.aspx";
                    return true;
                }
                return false;
            }

        </script>
    </telerik:RadCodeBlock>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
</asp:Content>
