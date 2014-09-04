<%@ Page Title="Log in" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSite.Login" Theme="Windows7" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>


<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7"/>
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <section id="loginForm">
        <p class="validation-summary-errors">
            <asp:Literal runat="server" ID="FailureText" />
        </p>
        <fieldset style="padding: 20px;">
            <legend style="display: block !important">Log in Form</legend>
            <div class="admin-project-add">
                <div class="admin-project-add-label" style="float: left; width: 100px;">
                    User name
                </div>
                <div class="admin-project-add-control">
                    <asp:TextBox runat="server" ID="UserName" Text="vinh" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                </div>
            </div>
            <div class="admin-project-add">
                <div class="admin-project-add-label" style="float: left; width: 100px;">
                    Password
                </div>
                <div class="admin-project-add-control">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" Text="123456" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                </div>
            </div>
            <div class="admin-project-add">
                <div class="admin-project-add-label" style="float: left; width: 100px;"></div>
                <div class="admin-project-add-control">
                    <asp:CheckBox runat="server" ID="RememberMe" />
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                </div>
            </div>
            <div class="admin-project-add">
                <div class="admin-project-add-label" style="float: left; width: 100px;"></div>
                <div class="admin-project-add-control" style="float: right;">
                    <asp:Button runat="server" ID="btnLogin" Text="Log in" OnClick="btnLogin_Click" />
                </div>
            </div>
        </fieldset>
    </section>
    
</asp:Content>