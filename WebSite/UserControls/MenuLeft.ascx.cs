using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Linq;
using BLL;
using MenuBE = Entities.MenuLeft;

namespace WebSite.UserControls
{
    public partial class MenuLeft : UserControl
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            GenerateMenu();
        }

        private List<MenuBE> GetMenuProject()
        {
            var bo = new MenuLeftBO();
            var menus = bo.GetMenuProject();
            var res = menus.Where(t => t.Type == Type).ToList();
            return res;
        }

        private void GenerateMenu()
        {
            var menus = GetMenuProject();
            var htmlMenu = new StringBuilder();
            htmlMenu.Append("<ul>");
            foreach (MenuBE menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                if (menu == null) continue;
                List<MenuBE> menuChild = menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList();
                htmlMenu.AppendFormat("<li>" +
                                      "<a href='#'>" +
                                        "<span>{0}</span>" +
                                      "</a>", menu.Name);
                if (menuChild.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (MenuBE menuLeft in menuChild)
                    {
                        htmlMenu.AppendFormat("<li>" +
                                                "<a href='Project.aspx?type={0}&tab=1&cate={1}'>" +
                                                    "<span>{2}</span>" +
                                                "</a>" +
                                              "</li>",
                                              Type, menuLeft.Id, menuLeft.Name);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
            ltMenu.Text = htmlMenu.ToString();
        }
    }
}