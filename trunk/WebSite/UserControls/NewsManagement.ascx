<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsManagement.ascx.cs" Inherits="WebSite.UserControls.NewsManagement" EnableTheming="true" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">
    #imagePreview {
        -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
        background-image: url(../Images/no-image.png);
        background-position: center center;
        background-size: cover;
        display: inline-block;
        height: 180px;
        margin-top: 5px;
        width: 180px;
    }

    .news-top-left {
        float: left;
    }

    .news-top-right {
        float: left;
        padding-left: 20px;
    }
    .news-top {
        padding-top: 10px;
        padding-bottom: 10px;
    }
    label {
        font: inherit !important;
    }
    button {
        font: inherit !important;
    }
    a {
        font: inherit !important;
    }
    input {
        font: inherit !important;
    }
    .RadForm a.rfdSkinnedButton * {
        font: inherit !important;
    }
</style>

<div class="news-top">
    <label>
        <input type="radio" id="rdNews" name="rdNewsKind" value="0" checked="checked" style="width: 25px;" />Tạo bài viết cho mục Tin tức
    </label>
    <br/>
    <label>
        <input type="radio" id="rdOther" name="rdNewsKind" value="1" style="width: 25px;" />Tạo bài viết cho mục Tư vấn hoặc Liên hệ
    </label>
</div>
<div id="newstop">
    <div class="news-top-left">
        <div>
            <label id="lblTitle">Tiêu đề bài viết</label><br />
            <asp:TextBox runat="server" ID="tbTitle" Width="500px"></asp:TextBox>
        </div>
        <div>
            <label id="lblSubcontent">Nội dung mô tả</label><br />
            <asp:TextBox runat="server" ID="tbSubcontent" TextMode="MultiLine" Width="550px" Height="150px"></asp:TextBox>
        </div>
    </div>
    <div class="news-top-right">
        <label id="lblImage">Ảnh mô tả (180px : 180px)</label><br />
        <div id="imagePreview"></div>
        <br />
        <input id="uploadFile" runat="server" clientidmode="Static" type="file" name="image" />
    </div>
</div>
<div style="clear: both;"></div>
<div style="height: 600px; margin: 0 auto;">
    <label id="lblContent">Nội dung bài viết</label>
    <br />
    <telerik:RadEditor runat="server" ID="radContent" Width="940" Height="550" Skin="Windows7" EditModes="Design, Preview">
        <ImageManager MaxUploadFileSize="157286400" SearchPatterns="*.gif,*.jpg,*.jpeg,*.png,*.bmp" ViewPaths="~/Images/Uploads/News" UploadPaths="~/Images/Uploads/News" DeletePaths="~/Images/Uploads/News"></ImageManager>
        <Modules>
            <telerik:EditorModule Name="RadEditorStatistics" Visible="false" Enabled="true"></telerik:EditorModule>
            <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="true"></telerik:EditorModule>
            <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="true"></telerik:EditorModule>
            <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="true"></telerik:EditorModule>
        </Modules>
        <Content>
        </Content>
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
        
        $("input:radio[name=rdNewsKind]").click(function () {
            var value = $(this).val();
            if (value == '0') {
                $("#newstop").css("display", "block");
            } else {
                $("#newstop").css("display", "none");
            }
        });
    </script>
</telerik:RadCodeBlock>
