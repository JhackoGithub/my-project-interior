<%@ Page Title="Nội thất" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Interior.aspx.cs" Inherits="WebSite.Interior" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>

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
                    <img src="Images/products/project-thumb08-200x176.jpg" /></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb07-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb06-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb05-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb04-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb03-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb02-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
        <li class="projects">
            <figure class="featured-thumbnail">
                <a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">
                    <img src="Images/products/project-thumb01-200x176.jpg"></a>
            </figure>
            <h5><a href="1product-info.aspx?type=1&tab=1" title="Biệt thự hiện đại">Biệt thự hiện đại</a></h5>
            Lorem ipsum dolor sit amet conse
                                        tetur adipisicing elitsed
                                        <div class="clear"></div>
        </li>
    </ul>
</asp:Content>
