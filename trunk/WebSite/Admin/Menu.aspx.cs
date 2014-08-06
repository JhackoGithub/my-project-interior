using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entities;
using WebSite.Core;

namespace WebSite.Admin
{
    public partial class Menu : AuthenPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            //GenerateMenu();
        }

        private void GenerateMenu()
        {
            //var menus = GetMenu();
            //var htmlMenu = new StringBuilder();
            //htmlMenu.Append("<ul>");
            //foreach (var menu in menus.Where(t => t.ParentId == null).OrderByDescending(t => t.Position))
            //{
            //    if(menu == null) continue;
            //    var menuChild = menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList();
            //    htmlMenu.AppendFormat("<li class='has-sub'><a href='#'><span>{0}</span></a>", menu.Name);
            //    if(menuChild.Count ==0)
            //    {
            //        htmlMenu.Append("</li>");
            //        continue;
            //    }
            //    htmlMenu.Append("</ul>");
            //    foreach (var menuLeft in menuChild)
            //    {
            //        htmlMenu.AppendFormat("<li><a href='Architecture.aspx?type=0&tab=1&cate=villa-modern'><span>{0}</span></a></li>", menuLeft.Name);
            //    }
            //    htmlMenu.Append("</ul>");
            //}
            //htmlMenu.Append("</ul>");
            //ltMenu.Text = htmlMenu.ToString();

            
            //menu.Append("<li class='has-sub'><a href='#'><span>Biệt thự</span></a>");
            //menu.Append("<ul>");
            //menu.AppendFormat("<li><a href='Architecture.aspx?type=0&tab=1&cate=villa-modern'><span>Hiện đại</span></a></li>");
            //menu.Append("<li class='last'><a href='Architecture.aspx?type=0&tab=1&cate=villa-classic'><span>Cổ điển</span></a></li>");
            //menu.Append("</ul>");
            //menu.Append("</li>");
            
        }

    }
}