using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.UserControls
{
    public partial class MenuLeft : System.Web.UI.UserControl
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }
        
        private string Category
        {
            get { return Request.QueryString["cate"] ?? "all"; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateMenu();
        }

        private void GenerateMenu()
        {
            if(Type == 0)
                GenerateMenuArchiture();
            else
            {
                GenerateMenuInterior();
            }
        }

        private void GenerateMenuArchiture()
        {
            var menu = new StringBuilder();
            menu.Append("<ul>");
            menu.Append("<li class='has-sub'><a href='#'><span>Biệt thự</span></a>");
            menu.Append("<ul>");
            menu.AppendFormat("<li><a href='Architecture.aspx?type=0&tab=1&cate=villa-modern'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='Architecture.aspx?type=0&tab=1&cate=villa-classic'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nhà lô phố</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx?type=0&tab=1&cate=batch-modern'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='Architecture.aspx?type=0&tab=1&cate=batch-classic'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("</ul>");
            ltMenu.Text = menu.ToString();
        }
        private void GenerateMenuInterior()
        {
            var menu = new StringBuilder();
            menu.Append("<ul>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nội thât biệt thự</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Interior.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nội thât nhà lô phố</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nội thât chung cư</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("</ul>");
            ltMenu.Text = menu.ToString();
        }
    }
}
