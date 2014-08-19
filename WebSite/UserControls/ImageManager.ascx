<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageManager.ascx.cs" Inherits="WebSite.UserControls.ImageManager" EnableTheming="true" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        function OnClientItemSelected(sender, args) {
            var pvwImage = $get("pvwImage");
            var imageSrc = args.get_item().get_url();

            if (imageSrc.match(/\.(gif|jpg)$/gi)) {
                pvwImage.src = imageSrc;
                pvwImage.style.display = "";
            }
            else {
                pvwImage.src = imageSrc;
                pvwImage.style.display = "none";
            }
        }
    </script>
</telerik:RadCodeBlock>
<style type="text/css">
    .preview fieldset legend
    {
        display: block !important;
    }

    .preview fieldset
    {
        display: block;
        -webkit-margin-start: 2px;
        -webkit-margin-end: 2px;
        -webkit-padding-before: 0.35em;
        -webkit-padding-start: 0.75em;
        -webkit-padding-end: 0.75em;
        -webkit-padding-after: 0.625em;
        border: 2px groove threedface;
        border-image-source: initial;
        border-image-slice: initial;
        border-image-width: initial;
        border-image-outset: initial;
        border-image-repeat: initial;
        min-width: -webkit-min-content;
    }

    .RadWindow_Metro
    {
        border: 0 !important;
    }
</style>

<telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
<telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
<telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />

<div style="float: left; vertical-align: top;">
    <telerik:RadFileExplorer runat="server" ID="RadFileExplorer1" Width="620px" Height="550px"
        OnClientItemSelected="OnClientItemSelected" EnableOpenFile="false">
    </telerik:RadFileExplorer>

</div>
<div class="preview" style="float: left; vertical-align: top; padding-left: 10px;">
    <fieldset style="width: 270px; height: 270px">
        <legend>Preview</legend>
        <img id="pvwImage" alt="" src="../Images/no-image.png" style="margin: 10px; width: 250px; height: 225px; display: none;" />
    </fieldset>
</div>



