<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebSite.Project" Theme="Windows7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/UserControls/MenuTop.ascx" TagPrefix="ucMenuTop" TagName="MenuTop" %>
<%@ Register Src="~/UserControls/MenuLeft.ascx" TagPrefix="ucMenuLeft" TagName="MenuLeft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuTopContent" runat="server">
    <ucMenuTop:MenuTop ID="menuTop" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeftContent" runat="server">
    <ucMenuLeft:MenuLeft ID="menuLeft" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" runat="server">

    <div id="project-list" style="padding-left: 15px;">
        <div style=" float: left; background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm ddsfssdfasdfasfasasfasfas</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <div style=" float: left;background-color: #fafafa;border: 1px solid #ececec;margin: 15px 5px 0 5px;padding: 11px 9px 14px 9px;text-align: center;width: 200px;">
            <figure style="float: left; margin: 0 0 12px 0;overflow: hidden;">
                <a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a>
            </figure>
            <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
        </div>
        <%--<ul class="recent-posts projects">
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">
                    <img src="Images\projects\architecture\2.villa\modern\1.N.Xuan truc- Linh Dam\PC 1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=5" title="Dự án: Biệt Thự Linh Đàm">Dự án: Biệt Thự Linh Đàm</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=9" title="Dự án: BIỆT THỰ NGHỈ DƯỠNG QUỐC OAI">
                    <img src="Images\projects\architecture\2.villa\modern\2. N.tien Hung- Quoc Oai\4.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=9" title="Dự án: BIỆT THỰ NGHỈ DƯỠNG QUỐC OAI">Dự án: BIỆT THỰ NGHỈ DƯỠNG QUỐC OAI</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=10" title="Dự án: BIỆT THỰ BẮC NINH">
                    <img src="Images\projects\architecture\2.villa\modern\3.N.Viet Cuong- Bac Ninh\5.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=10" title="Dự án: BIỆT THỰ BẮC NINH">Dự án: BIỆT THỰ BẮC NINH</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=11" title="Dự án: BIỆT THỰ KHU ĐÔ THỊ MỚI MINH GIANG">
                    <img src="Images\projects\architecture\2.villa\modern\4. Tong Thi Lien- KDT Minh Giang\5.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=11" title="Dự án: BIỆT THỰ KHU ĐÔ THỊ MỚI MINH GIANG">Dự án: BIỆT THỰ KHU ĐÔ THỊ MỚI MINH GIANG</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=12" title="Dự án: BIỆT THỰ SINH THÁI QUẢNG NINH">
                    <img src="Images\projects\architecture\2.villa\modern\5. Ha Van Hanh- Ha Long QN\1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=12" title="Dự án: BIỆT THỰ SINH THÁI QUẢNG NINH">Dự án: BIỆT THỰ SINH THÁI QUẢNG NINH</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=13" title="Dự án: Biệt thự Ba Vì">
                    <img src="Images\projects\architecture\2.villa\modern\6.Vu Thanh Hai- Ba VI\1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=13" title="Dự án: Biệt thự Ba Vì">Dự án: Biệt thự Ba Vì</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=14" title="Dự án: NHÀ VƯỜN THÁI NGUYÊN">
                    <img src="Images\projects\architecture\2.villa\modern\7. Pham Tien Ngoc- Thai Nguyen\3.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=14" title="Dự án: NHÀ VƯỜN THÁI NGUYÊN">Dự án: NHÀ VƯỜN THÁI NGUYÊN</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=0&amp;project=15" title="Dự án: Biệt thự nội đô">
                    <img src="Images\projects\architecture\2.villa\modern\8. Ng thi Hien- Thai Nguyen\1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=0&amp;project=15" title="Dự án: Biệt thự nội đô">Dự án: Biệt thự nội đô</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=16" title="Dự án: Biệt thự Ba Vì">
                    <img src="Images\projects\architecture\2.villa\modern\9.Nguyen Minh Thang- Ba Vi\1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=16" title="Dự án: Biệt thự Ba Vì">Dự án: Biệt thự Ba Vì</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=17" title="Dự án: Biệt thự Hải Phòng">
                    <img src="Images\projects\architecture\2.villa\modern\10.Pham thi Hang- Hai PHong\1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=17" title="Dự án: Biệt thự Hải Phòng">Dự án: Biệt thự Hải Phòng</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=18" title="Dự án: Biệt thự Hải Phòng">
                    <img src="Images\projects\architecture\2.villa\modern\11.Ng Huy Hoang- HP\5.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=18" title="Dự án: Biệt thự Hải Phòng">Dự án: Biệt thự Hải Phòng</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=19" title="Dự án: Biệt thự Hải Dương">
                    <img src="Images\projects\architecture\2.villa\modern\12.Ng. Dat Van- Hai Duong\4.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=19" title="Dự án: Biệt thự Hải Dương">Dự án: Biệt thự Hải Dương</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=20" title="Dự án: Nhà Vườn Vĩnh Phúc">
                    <img src="Images\projects\architecture\2.villa\modern\13.Nguyen Thanh Son- Vinh Phuc\7.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=20" title="Dự án: Nhà Vườn Vĩnh Phúc">Dự án: Nhà Vườn Vĩnh Phúc</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=21" title="Dự án: Biệt thự Thái Bình">
                    <img src="Images\projects\architecture\2.villa\modern\14. Tran Nhat Khue- Thai BInh\6.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=21" title="Dự án: Biệt thự Thái Bình">Dự án: Biệt thự Thái Bình</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=22" title="Dự án: Biệt thự nội đô Nam Định">
                    <img src="Images\projects\architecture\2.villa\modern\15. Nguyen Xuan Chien- Nam Dinh\1.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=9&amp;project=22" title="Dự án: Biệt thự nội đô Nam Định">Dự án: Biệt thự nội đô Nam Định</a></h5>
                <div class="clear"></div>
            </li>
            <li class="projects">
                <figure class="featured-thumbnail"><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=11&amp;project=23" title="Dự án: Nhà phố KĐT Tân Triều">
                    <img src="Images\projects\architecture\1.batch\modern\Ba Do Thi Thuy- thanh tri\7.jpg" style="width: 200px;"></a></figure>
                <h5><a href="Project-Info.aspx?type=0&amp;tab=1&amp;cate=11&amp;project=23" title="Dự án: Nhà phố KĐT Tân Triều">Dự án: Nhà phố KĐT Tân Triều</a></h5>
                <div class="clear"></div>
            </li>
        </ul>--%>
    </div>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                //bindProjects();
            });

            function bindProjects() {
                var type = getParameterByName('type');
                var cateid = getParameterByName('cate');
                var url = "../Handler/ProjectHandler.ashx?funcname=getall&type=" + type + "&cate=" + cateid;
                callAjaxHandler(url, null, AjaxConst.GetRequest, bindProjectCallback);
            }

            function bindProjectCallback(data) {
                $('#project-list').html(data.html);
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>


