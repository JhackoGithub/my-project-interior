using System;
using System.Text;
using System.Web.UI;

namespace WebSite.UserControls
{
    public partial class MenuTop : UserControl
    {
        private int Type
        {
            get { return Page.RouteData.Values["type"] == null ? 0 : int.Parse(Page.RouteData.Values["type"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            GenerateMenu();
        }

        private void GenerateMenu()
        {
            var menu = new StringBuilder();
            string menuType = Type == 0 ? "kien-truc/cong-trinh-kien-truc" : "noi-that/cong-trinh-noi-that";
            var linkTab1 = string.Format("/{0}/{1}/1", menuType, Type);
            menu.Append("<ul>");
            menu.AppendFormat(Type == 0
                                  ? "<li><a id='menu-tab-1' href='{0}'>Công trình</a></li>"
                                  : "<li style='width:78px;'><a id='menu-tab-1' href='{0}'>Nội thất</a></li>",
                              linkTab1);
            var linkTab2 = string.Format(Type == 0 ? "/tu-van/tu-van-cong-trinh/{0}/2/0" : "/tu-van/tu-van-noi-that/{0}/2/0", Type);
            menu.AppendFormat("<li><a id='menu-tab-2' href='{0}'>Tư vấn</a></li>", linkTab2);
            var linkTab3 = string.Format(Type == 0 ? "/tham-khao/cong-trinh-kien-truc/{0}/3" : "/tham-khao/cong-trinh-noi-that/{0}/3", Type);
            menu.AppendFormat("<li><a id='menu-tab-3' href='{0}'>Tham khảo</a></li>", linkTab3);
            menu.AppendFormat("<li><a id='menu-tab-4' href='/hoi-dap/{0}/4'>Hỏi đáp</a></li>", Type);
            menu.Append("</ul>");
            ltMenuLeft.Text = menu.ToString();
        }
    }
}