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
            var res = new List<MenuBE>();
            switch (Tab)
            {
                case 1:
                    {
                        var menus = bo.GetMenuProject();
                        res = menus.Where(t => t.Type == Type).ToList();
                    }
                    break;
                case 2:
                    {
                        var menus = bo.GetMenuConsultant();
                        res = menus.Where(t => t.SubType == 2 || t.SubType == Type).ToList();
                    }
                    break;
                case 0:
                        res = bo.GetMenuContact();
                    break;
            }
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
                List<MenuBE> menuChild = Tab == 1
                                             ? menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList()
                                             : menus.Where(t => t.ParentId != null && t.ParentId == menu.Id && t.Link != null).ToList();
                if (menuChild.Count == 0)
                    continue;
                htmlMenu.AppendFormat("<li><a href='#'><span>{0}</span></a></li>", menu.Name);
                
                htmlMenu.Append("<ul>");
                if(Tab == 0)
                {
                    htmlMenu.AppendFormat("<li><a href='Contact.aspx?type={0}&name=map'><span>Địa điểm công ty</span></a></li>", Type); 
                }
                foreach (MenuBE menuLeft in menuChild)
                {
                    if (Tab == 1)
                    {
                        htmlMenu.AppendFormat("<li><a href='Project.aspx?type={0}&tab=1&cate={1}'><span>{2}</span></a></li>", Type,menuLeft.Id, menuLeft.Name);
                    }
                    else if(Tab == 2)
                    {
                        htmlMenu.AppendFormat("<li><a href='Consultant.aspx?type={0}&tab=2&id={1}'><span>{2}</span></a></li>", Type, menuLeft.Link ?? 0, menuLeft.Name);
                    }
                    else
                    {
                        htmlMenu.AppendFormat("<li><a href='Contact.aspx?type={0}&id={1}'><span>{2}</span></a></li>", Type, menuLeft.Link ?? 0, menuLeft.Name);
                    }
                }
                if (Tab == 0)
                {
                    htmlMenu.AppendFormat("<li><a href='Contact.aspx?type={0}&name=phieu-dieu-tra'><span>Phiếu điều tra</span></a></li>", Type);
                }
                htmlMenu.Append("</ul>");
            }
            htmlMenu.Append("</ul>");
            ltMenu.Text = htmlMenu.ToString();
        }
    }
}