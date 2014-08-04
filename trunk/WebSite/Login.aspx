﻿<%@ Page Title="Log in" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSite.Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>
    <section id="loginForm">
        <h2>Use a local account to log in.</h2>


        <p class="validation-summary-errors">
            <asp:Literal runat="server" ID="FailureText" />
        </p>
        <fieldset>
            <legend>Log in Form</legend>
            <ol>
                <li>
                    <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                    <asp:TextBox runat="server" ID="UserName" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="RememberMe" />
                    <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                </li>
            </ol>
            <asp:Button runat="server" ID="btnLogin" Text="Log in" OnClick="btnLogin_Click" />
        </fieldset>
    </section>

</asp:Content>
