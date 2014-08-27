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
        private int Tab
        {
            get { return Request.QueryString["tab"] == null ? 0 : Convert.ToInt32(Request.QueryString["tab"]); }
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
            if(Tab == 1)
            {
                var menus = bo.GetMenuProject();
                var res = menus.Where(t => t.Type == Type).ToList();
                return res;
            }
            else
            {
                var menus = bo.GetMenuConsultant();
                var res = menus.Where(t => (t.SubType == 2 || t.SubType == Type) && t.Link != null).ToList();
                return res;
            }
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
                        if (Tab == 1)
                        {
                            htmlMenu.AppendFormat("<li><a href='Project.aspx?type={0}&tab=1&cate={1}'><span>{2}</span></a></li>", Type,menuLeft.Id, menuLeft.Name);
                        }
                        else
                        {
                            htmlMenu.AppendFormat("<li><a href='Consultant.aspx?type={0}&tab=2&id={1}'><span>{2}</span></a></li>", Type, menuLeft.Link, menuLeft.Name);
                        }
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
            ltMenu.Text = htmlMenu.ToString();
        }
    }
}