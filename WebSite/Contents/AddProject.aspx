<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="WebSite.Contents.AddProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .project-add
        {
            float: left;
            padding-bottom: 5px;
            clear: both;
        }

        .project-add-label
        {
            padding-bottom: 5px;
        }

        #wrapper-tab
        {
            background-color: #F4F0EE;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            width: 865px;
            padding: 10px;
        }

        #tabs > div
        {
            width: 680px;
            /*height: 250px;*/
            float: left;
            overflow: hidden;
        }

        #tabs img
        {
            display: block;
            margin: 0 25px 0 0;
            float: left;
        }

        #tabs h3
        {
            font-size: 30px;
            line-height: 20px;
            margin: 60px 0 20px 0;
        }

        #tabs #project-desc img {
			margin-top: 30px;
            text-align: center;
		}

        #pager
        {
            width: 680px;
            margin: -61px auto 0px auto;
            text-align: center;
        }

            #pager a
            {
                border: 1px solid transparent;
                border-bottom: none;
                border-left: none;
                border-color: #ccc;
                color: #999;
                font-size: 20px;
                text-decoration: none;
                line-height: 30px;
                display: inline-block;
                height: 30px;
                padding: 10px 30px;
            }

                #pager a:hover
                {
                    color: #666;
                }

                #pager a:first-child
                {
                    border-left: 1px solid #ccc;
                }

                #pager a.selected
                {
                    background-color: #F4F0EE;
                    color: #333;
                }
    </style>
    <link href="../Content/Kendo/kendo.common.min.css" rel="stylesheet" />
    <link href="../Content/Kendo/kendo.default.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/jquery.carouFredSel-6.0.4-packed.js"></script>
    <script src="../Scripts/kendo.core.min.js"></script>
    <script src="../Scripts/kendo.web.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#tabs').carouFredSel({
                circular: false,
                items: 1,
                width: '100%',
                auto: false,
                pagination: {
                    container: '#pager',
                    anchorBuilder: function (nr) {
                        return '<a href="#">' + $(this).find('h3').text() + '</a>';
                    }
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <div class="project-add">
                <div class="project-add-label">Loại dự án</div>
                <div class="project-add-control">
                    <asp:DropDownList runat="server" ID="ddlType">
                        <Items>
                            <asp:ListItem Value="0" Text="Công trình" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Nội thất"></asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="project-add">
                <div class="project-add-label">Kiểu dự án</div>
                <div class="project-add-control">
                    <asp:DropDownList runat="server" ID="DropDownList1">
                        <Items>
                            <asp:ListItem Value="0" Text="Công trình" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Nội thất"></asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="project-add">
                <div class="project-add-label">Tên dự án</div>
                <div class="project-add-control">
                    <asp:TextBox runat="server" ID="tbName" Width="200"></asp:TextBox>
                </div>
            </div>
            <div class="project-add">
                <div class="project-add-label">Ảnh đại diện</div>
                <div class="project-add-control">
                    <asp:TextBox runat="server" ID="tbImage" Width="200"></asp:TextBox>
                </div>
            </div>
            <div style="clear: both;"></div>
            <div id="wrapper-tab">
                <div id="pager">
                </div>
                <div id="tabs">
                    <div id="project-info">
                        <h3>Thông tin</h3>
                        <asp:Literal runat="server" ID="ltProjectInfo"></asp:Literal>
                    </div>
                    <div id="project-desc">
                        <h3>Thuyết minh</h3>
                        <asp:Literal runat="server" ID="ltProjectDesc"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
