using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace WebSite.Contents
{
    public partial class AddProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            BindMenu();
        }

        private void BindMenu()
        {
            var bo = new MenuLeftBO();
            var menus = bo.GetMenuProject();
            var htmlMenu = new StringBuilder();
            htmlMenu.Append("<ul>");
            foreach (var menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                if (menu == null) continue;
                var menuChild = menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList();
                htmlMenu.AppendFormat("<li><div><div style='float: left;'>{0}</div></div>", menu.Name);
                if (menuChild.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (var menuLeft in menuChild)
                    {
                        htmlMenu.AppendFormat("<li><div><input id='rd{0}' type='radio' name='rdKind' value='{1}'><label for='rd{2}'>{3}</label></div></li>", menuLeft.Id, menuLeft.Id, menuLeft.Id, menuLeft.Name);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
            ltMenu.Text = htmlMenu.ToString();
        }
    }
}