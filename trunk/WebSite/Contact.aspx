<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebSite.Contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContainer" runat="server">
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-14" class="page">
                <div style="width: 600px; display: inline; float: left; margin-left: 10px; margin-right: 10px;">
                    <h2>Contact information</h2>
                    <div class="google-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.8736005821547!2d105.82702340000003!3d20.9977033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac8871297549%3A0xb2a892bf045f4851!2zNjQgTmd1eeG7hW4gVmnhur90IFh1w6JuLCBLaMawxqFuZyBNYWksIFRoYW5oIFh1w6JuLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1405071611175" width="600" height="450" frameborder="0" style="border: 0"></iframe>
                    </div>
                </div>
                <div style="width: 300px; display: inline; float: left; margin-left: 10px; margin-right: 10px;">
                    <h2>Contact form</h2>

                    <p class="field">
                        <input type="text" name="your-name" value="" placeholder="your-name" size="40">
                    </p>
                    <p class="field">
                        <input type="text" name="your-email" value="" placeholder="your-email" size="40">
                    </p>
                    <p class="field">
                        <textarea name="your-message" placeholder="your-message" cols="42" rows="10"></textarea>
                    </p>
                    <p class="submit-wrap">
                        <input type="reset" value="clear" /><input type="submit" value="send" />
                    </p>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function () {
            $('.sf-menu #menu-item-6').addClass('current_page_item');
        });
    </script>
</asp:Content>
