<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Admin.Project" Theme="BocaTheme" %>
<%@ Import Namespace="WebSite.Common" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-bottom: 10px; padding-top: 10px;">
        <button type="button" id="btnAdd" >Tạo mới dự án</button>
        <button onclick="$find('<%= DialogOpener1.ClientID %>').open('ImageManager', {CssClasses: []});return false;">Open ImageManager</button> 
    </div>
    
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Metro" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <telerik:dialogopener runat="server" id="DialogOpener1" HandlerUrl="Telerik.Web.UI.DialogHandler.aspx" style="display: none;"></telerik:dialogopener> 
    <telerik:RadGrid ID="rgProject" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="15" Height="300px"
                     EnableEmbeddedSkins="False" CellSpacing="0" GridLines="None" OnItemCommand="rgProject_ItemCommand" OnNeedDataSource="rgProject_NeedDataSource">
        <HeaderStyle HorizontalAlign="Left" Height="30" Font-Bold="True" />
        <MasterTableView AllowMultiColumnSorting="False" AllowFilteringByColumn="False">
            <Columns>
                <telerik:GridBoundColumn DataField="Name" UniqueName="Name" HeaderText="Dự án" AndCurrentFilterFunction="Contains" HtmlEncode="True"
                                         ShowFilterIcon="false" AllowSorting="False">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Kiểu dự án" DataField="Type" FilterControlWidth="110px" AndCurrentFilterFunction="Contains"
                     AllowFiltering="False" ShowFilterIcon="false" >
                        <HeaderStyle Width="120px"></HeaderStyle>
                        <ItemStyle Width="120px"></ItemStyle>
                        <ItemTemplate>
                            <%# ((int) Eval("Type")).ConvertProjectType() %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="CreatedOn" UniqueName="CreatedOn" HeaderText="Ngày tạo" AutoPostBackOnFilter="true"
                                         AllowSorting="False" SortExpression="CreatedOn" AllowFiltering="False" ShowFilterIcon="False" DataFormatString="{0:g}">
                    <HeaderStyle Width="130px"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="TemplateColumn" AllowFiltering="False">
                    <HeaderStyle HorizontalAlign="Right" Width="130px" />
                    <ItemStyle HorizontalAlign="Right" Width="130px" />
                    <ItemTemplate>
                        <a href="#" target="_blank" class="Grid-View"></a>
                        <a href="AddProject.aspx?id=<%#Eval("Id") %>" class="Grid-Edit"></a>
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

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            $('#btnAdd').click(function() {
                location.href = 'AddProject.aspx';
            });
            
            //function ImageManagerFunction(sender, args) {
            //    if (!args) {
            //        alert('No file was selected!');
            //        return false;
            //    }

            //    var selectedItem = args.get_value();


            //if ($telerik.isIE) {
            //    //txt.value = selectedItem.outerHTML;  //this is the selected IMG tag element
            //}
            //else {
            //    var path = args.value.getAttribute("src", 2);
            //    txt.value = "<img src='" + path + "' />";
            //}
        //}
    </script>
    </telerik:RadCodeBlock>
</asp:Content>