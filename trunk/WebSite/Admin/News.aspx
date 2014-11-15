<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="WebSite.Admin.News" Theme="Windows7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>

    <div style="padding-bottom: 10px; padding-top: 10px;">
        <button type="button" id="btnAdd" >Tạo mới bài viết</button>
    </div>
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <telerik:RadGrid ID="rgNews" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="15"
                     EnableEmbeddedSkins="False" CellSpacing="0" GridLines="None" OnNeedDataSource="rgNews_NeedDataSource" OnItemCommand="rgNews_ItemCommand" OnItemDataBound="rgNews_ItemDataBound">
        <HeaderStyle HorizontalAlign="Left" Height="30" Font-Bold="True" />
        <MasterTableView AllowMultiColumnSorting="False" AllowFilteringByColumn="False">
            <Columns>
                <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="Thể loại" AllowFiltering="False">
                    <ItemTemplate>
                        <%#Convert.ToInt32(Eval("Type")) == 0 ? "Tin tức" : "Bài viết khác" %>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="Title" UniqueName="Title" HeaderText="Tiêu đề" AndCurrentFilterFunction="Contains" HtmlEncode="True"
                                         AllowSorting="False" ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreatedOn" UniqueName="CreatedOn" HeaderText="Ngày đăng" AutoPostBackOnFilter="true"
                                         AllowSorting="False" SortExpression="CreatedOn" AllowFiltering="False" ShowFilterIcon="False" DataFormatString="{0:g}">
                    <HeaderStyle Width="130px"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="TemplateColumn" AllowFiltering="False">
                    <HeaderStyle HorizontalAlign="Right" Width="130px" />
                    <ItemStyle HorizontalAlign="Right" Width="130px" />
                    <ItemTemplate>
                        <a href="../News.aspx?type=2&id=<%#Eval("Id") %>" target="_blank" class="Grid-View"></a>
                        <a href="AddNews.aspx?id=<%#Eval ("Id") %>" class="Grid-Edit"></a>
                        <asp:LinkButton runat="server" ID="lkbDelete" CssClass="Grid-Delete" CommandName="delete" CommandArgument='<%#Eval("Id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
        <GroupingSettings CaseSensitive="False"></GroupingSettings>
        <PagerStyle Position="Bottom" Mode="NumericPages"></PagerStyle>
        <ClientSettings EnableRowHoverStyle="true">
            <Selecting AllowRowSelect="true" />

        </ClientSettings>
    </telerik:RadGrid>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
    <script type="text/javascript">

        $('#btnAdd').click(function () {
            location.href = 'AddNews.aspx';
        });
        
        function deleteNews() {
            return confirm("Bạn có muốn xóa bài viết này?");
        }
    </script>
</asp:Content>