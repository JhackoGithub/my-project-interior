<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.Master" AutoEventWireup="true" CodeBehind="Refer.aspx.cs" Inherits="WebSite.Refer" %>

<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeftContent" runat="server">
    <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" runat="server">
    <ul class="recent-posts projects">
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/10.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Thiết kế: Kts. Vũ Quang Vĩnh
            <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/11.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Thiết kế: Kts. Vũ Quang Vĩnh
            <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/12.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Thiết kế: Kts. Vũ Quang Vĩnh
            <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/13.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Thiết kế: Kts. Vũ Quang Vĩnh
            <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/14.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Thiết kế: Kts. Vũ Quang Vĩnh
            <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/15.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Thiết kế: Kts. Vũ Quang Vĩnh
            <div class="clear"></div>
        </li>
    </ul>
</asp:Content>