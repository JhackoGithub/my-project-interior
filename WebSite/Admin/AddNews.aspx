<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="WebSite.Admin.AddNews" Theme="Windows7" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
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
        line-height: 23px;
    }
    .news-top {
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .news-label {
        line-height: 23px;
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
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
<telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
<telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div class="news-top">
    <label>
        <input type="radio" id="rdNews" name="rdNewsKind" value="0" style="width: 25px;" />Tạo bài viết cho mục Tin tức
    </label>
    <br/>
    <label>
        <input type="radio" id="rdOther" name="rdNewsKind" value="1" style="width: 25px;" />Tạo bài viết cho mục Tư vấn hoặc Liên hệ
    </label>
</div>
<div id="newstop">
    <div class="news-top-left">
        <div class="news-label">
            <label id="lblTitle">Tiêu đề bài viết</label><br />
            <asp:TextBox runat="server" ID="tbTitle" ClientIDMode="Static" Width="500px"></asp:TextBox>
        </div>
        <div class="news-label" id="newsSubContent">
            <label id="lblSubcontent">Nội dung mô tả</label><br />
            <asp:TextBox runat="server" ID="tbSubcontent" ClientIDMode="Static" TextMode="MultiLine" Width="550px" Height="150px"></asp:TextBox>
        </div>
    </div>
    <div id="newsImage" class="news-top-right">
        <label id="lblImage">Ảnh mô tả (180px : 180px)</label><br />
        <div id="imagePreview"></div>
        <br />
        <input id="uploadFile" runat="server" clientidmode="Static" type="file" name="image" />
    </div>
</div>
<div style="clear: both;"></div>
<div style="height: 600px; margin: 0 auto; line-height: 23px;">
    <label id="lblContent">Nội dung bài viết</label>
    <br />
    <telerik:RadEditor runat="server" ID="radContent" ClientIDMode="Static" Width="940" Height="550" Skin="Windows7" EditModes="Design, Preview">
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
    <asp:HiddenField runat="server" ID="hdfNewKind" Value="0" ClientIDMode="Static"/>
    <div style="clear: both;"></div>
    <div style="text-align: right;">
        <asp:Button runat="server" ID="btnSave" Text="Lưu" OnClientClick="return validate();" OnClick="btnSave_Click" />
    </div>
    <telerik:RadCodeBlock runat="server">
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
                $('#hdfNewKind').val(value);
                if (value == '0') {
                    $("#newsSubContent").css("display", "block");
                    $("#newsImage").css("display", "block");
                } else {
                    $("#newsSubContent").css("display", "none");
                    $("#newsImage").css("display", "none");
                }
            });

            function newsKindClick(val) {
                var $rdKind = $('input:radio[name=rdNewsKind]');
                var filterkind = '[value="' + val + '"]';
                $rdKind.filter(filterkind).click();
            }

            function validate() {
                var title = $find("<%=tbTitle.ClientID%>");
                if (title == '' || title.length == 0)
                    return false;
                return true;
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