using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using BLL;
using MenuBE = Entities.MenuLeft;

namespace WebSite.UserControls
{
    public partial class MenuLeft : UserControl
    {
        private int Type
        {
            get { return Page.RouteData.Values["type"] == null ? 0 : int.Parse(Page.RouteData.Values["type"].ToString()); }
        }

        private int Tab
        {
            get { return Page.RouteData.Values["tab"] == null ? 1 : int.Parse(Page.RouteData.Values["tab"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
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
                case 3:
                    {
                        List<MenuBE> menus = bo.GetMenuProject();
                        res = menus.Where(t => t.Type == Type).ToList();
                    }
                    break;
                case 2:
                    {
                        List<MenuBE> menus = bo.GetMenuConsultant();
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
            List<MenuBE> menus = GetMenuProject();
            var htmlMenu = new StringBuilder();
            htmlMenu.Append("<ul>");
            string menuType = Type == 0 ? "kien-truc" : "noi-that";
            foreach (MenuBE menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                if (menu == null) continue;
                List<MenuBE> menuChild = (Tab == 1 || Tab == 3)
                                             ? menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList()
                                             : menus.Where(
                                                 t => t.ParentId != null && t.ParentId == menu.Id && t.Link != null).
                                                   ToList();
                if (menuChild.Count == 0)
                    continue;
                htmlMenu.AppendFormat("<li><a href='#'><span>{0}</span></a></li>", menu.Name);

                htmlMenu.Append("<ul>");
                if (Tab == 0)
                {
                    htmlMenu.AppendFormat(
                        "<li><a href='/lien-he/dia-diem-cong-ty/{0}/0/0'><span>Địa điểm công ty</span></a></li>", Type);
                }
                foreach (MenuBE menuLeft in menuChild)
                {
                    string link;
                    switch (Tab)
                    {
                        case 1:
                            link = string.Format("/{0}/cong-trinh-{1}/{2}/{3}/{4}", menuType, menuType, Type, Tab, menuLeft.Id);
                            htmlMenu.AppendFormat("<li><a href='{0}'><span>{1}</span></a></li>", link, menuLeft.Name);
                            break;
                        case 2:
                            link = string.Format(Type == 0 ? "/tu-van/tu-van-cong-trinh/{0}/2/{1}" : "/tu-van/tu-van-noi-that/{0}/3/{1}", Type, menuLeft.Link ?? 0);
                            htmlMenu.AppendFormat("<li><a href='{0}'><span>{1}</span></a></li>", link, menuLeft.Name);
                            break;
                        case 3:
                            link = string.Format("/{0}/cong-trinh-{1}/{2}/{3}/{4}", menuType, menuType, Type, 1, menuLeft.Id);
                            htmlMenu.AppendFormat("<li><a href='{0}'><span>{1}</span></a></li>", link, menuLeft.Name);
                            break;
                        case 4:
                            break;
                        case 0:
                            htmlMenu.AppendFormat("<li><a href='/lien-he/{0}/0/{1}'><span>{2}</span></a></li>",
                                              Type, menuLeft.Link ?? 0, menuLeft.Name);
                            break;
                    }
                }
                if (Tab == 0)
                {
                    htmlMenu.AppendFormat("<li><a href='/lien-he/phieu-dieu-tra/{0}/0/1'><span>Phiếu điều tra</span></a></li>", Type);
                }
                htmlMenu.Append("</ul>");
            }
            htmlMenu.Append("</ul>");
            ltMenu.Text = htmlMenu.ToString();
        }
    }
}