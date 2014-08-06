using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using BLL;
using Entities;
using WebSite.Common;

namespace WebSite.Handler
{
    /// <summary>
    /// Summary description for MenuHanlder
    /// </summary>
    public class MenuHanlder : BaseHandler
    {

        protected override void ProcessMainRequest(HttpContext context)
        {
            var jsonString = string.Empty;
            context.Response.ContentType = "text/plain";
            MenuLeft menuLeft;
            int id = 0;
            var action = context.Request.QueryString["funcname"].ToLower();
            int type = Convert.ToInt32(context.Request.QueryString["type"].ToLower());
            switch (action)
            {
                case "getall":
                    jsonString = GetMenus(type);
                    break;
                case "create":
                    menuLeft = Utils.ConvertDeserialize<MenuLeft>(context, ref jsonString);
                    jsonString = CreateMenu(menuLeft);
                    break;
                default:
                    break;
            }
            context.Response.Write(jsonString);
        }

        private string GetMenus(int type)
        {
            var bo = new MenuLeftBO();
            var menus = bo.GetMenuLeft(type);
            var htmlMenu = new StringBuilder();
            htmlMenu.Append("<ul>");
            foreach (var menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                if (menu == null) continue;
                var menuChild = menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList();
                htmlMenu.AppendFormat("<li><div><div style='float: left;'>{0}</div><div class='action-image' style='float: right;'><img value='{1}' src='../Images/iEdit.png' width='16' /><img value='{2}' src='../Images/iDelete.png' width='16' /></div></div>", menu.Name, menu.Id, menu.Id);
                if (menuChild.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (var menuLeft in menuChild)
                    {
                        htmlMenu.AppendFormat("<li><div><span>{0}</span><div class='action-image'><img value='{1}' src='../Images/iEdit.png' width='16' /><img value='{2}' src='../Images/iDelete.png' width='16' /></div></div></li>", menuLeft.Name, menuLeft.Id, menuLeft.Id);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
            
            var htmlDropdown = new StringBuilder();
            foreach (var menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                htmlDropdown.AppendFormat("<option value='{0}'>{1}</option>", menu.Id, menu.Name);
            }
            var json = new {
                               menu = htmlMenu.ToString(),
                               dropdown = htmlDropdown.ToString()
                           };
            var res = Utils.ConvertToJsonString(json);
            return res;
        }

        private string CreateMenu(MenuLeft menuLeft)
        {
            var bo = new MenuLeftBO();
            var res = bo.AddMenuLef(menuLeft);
            return Utils.ConvertToJsonString(res);
        }
    }
}

//<div>
//                                                    <img src="../Images/iEdit.png" width="16" />
//                                                    <img src="../Images/iDelete.png" width="16" />
//                                                </div>