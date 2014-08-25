<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsCollection.aspx.cs" Inherits="WebSite.Contents.NewsCollection" Theme="Windows7" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2013.3.1324.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/Kendo/kendo.common.min.css" rel="stylesheet" />
    <link href="../Content/Kendo/kendo.default.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.2.min.js"> </script>
    <script src="../Scripts/Script.js"> </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 0 auto; padding: 10px;">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="False" Skin="Windows7" />
            <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
            <telerik:RadGrid ID="rgNews" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="10" Height="380px"
                EnableEmbeddedSkins="False" CellSpacing="0" GridLines="None" OnNeedDataSource="rgNews_NeedDataSource">
                <HeaderStyle HorizontalAlign="Left" Height="30" Font-Bold="True" />
                <MasterTableView AllowMultiColumnSorting="False" AllowFilteringByColumn="False" ClientDataKeyNames="Id">
                    <Columns>
                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" AllowFiltering="False">
                            <ItemTemplate>
                                <input type="radio" name="rdNewsId" value="<%#Eval("Id") %>" />
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
                            <HeaderStyle HorizontalAlign="Right" Width="40px" />
                            <ItemStyle HorizontalAlign="Right" Width="40px" />
                            <ItemTemplate>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
                <GroupingSettings CaseSensitive="False"></GroupingSettings>
                <PagerStyle Position="Bottom" Mode="NumericPages"></PagerStyle>
                <ClientSettings EnableRowHoverStyle="true">
                    <Selecting AllowRowSelect="true" />
                    <ClientEvents OnRowClick="rowClick"></ClientEvents>
                </ClientSettings>
            </telerik:RadGrid>
        </div>
        <div style="clear: both; margin: 10px auto 0 auto; padding-top: 5px; text-align: right; width: 730px;">
            <button type="button" id="select">Chọn bài viết</button>
            <button type="button" id="closepoup">Hủy chọn</button>
        </div>
    </form>
    <script type="text/javascript">
        function rowClick(sender, eventArgs) {
            var id = eventArgs.getDataKeyValue("Id");
            selected(id);
        }

        function selected(val) {
            var $rd = $('input:radio[name=rdNewsId]');
            var strfilter = '[value="' + val + '"]';
            $rd.filter(strfilter).click();
        }

        $('#select').click(function () {
            var $rd = $('input:radio[name=rdNewsId]:checked');
            var val = $rd.val();
            window.parent.getNewsId(val);
        });

        $('#closepoup').click(function () {
            window.parent.closeChildPopup();
        });
    </script>
</body>
</html>
