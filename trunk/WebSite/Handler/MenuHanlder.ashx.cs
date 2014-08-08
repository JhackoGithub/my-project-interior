﻿using System;
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
            string jsonString = string.Empty;
            context.Response.ContentType = "text/plain";
            MenuLeft menuLeft;
            int id = context.Request.QueryString["id"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["id"]);
            string action = context.Request.QueryString["funcname"].ToLower();
            int type = Convert.ToInt32(context.Request.QueryString["type"]);
            switch (action)
            {
                case "getall":
                    string form = context.Request.QueryString["frm"] == null
                                      ? string.Empty
                                      : context.Request.QueryString["frm"].ToLower();
                    jsonString = GetMenus(type, form);
                    break;
                case "create":
                    menuLeft = Utils.ConvertDeserialize<MenuLeft>(context, ref jsonString);
                    jsonString = CreateMenu(menuLeft);
                    break;
                case "delete":
                    jsonString = DeleteMenu(id);
                    break;
                case "edit":
                    jsonString = GetMenuById(id, type);
                    break;
                case "update":
                    menuLeft = Utils.ConvertDeserialize<MenuLeft>(context, ref jsonString);
                    menuLeft.Id = id;
                    jsonString = UpdateMenu(menuLeft);
                    break;
            }
            context.Response.Write(jsonString);
        }

        private string GetMenus(int type, string form)
        {
            var bo = new MenuLeftBO();
            List<MenuLeft> menus = bo.GetMenuLeft(type);
            var htmlMenu = new StringBuilder();
            object json;
            if (string.IsNullOrEmpty(form))
            {
                GenerateMenu(menus, htmlMenu);
                var htmlDropdown = new StringBuilder();
                foreach (MenuLeft menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
                {
                    htmlDropdown.AppendFormat("<option value='{0}'>{1}</option>", menu.Id, menu.Name);
                }
                json = new
                           {
                               menu = htmlMenu.ToString(),
                               dropdown = htmlDropdown.ToString()
                           };
            }
            else
            {
                GenerateMenuProject(menus, htmlMenu);
                json = new
                           {
                               menu = htmlMenu.ToString(),
                           };
            }
            string res = Utils.ConvertToJsonString(json);
            return res;
        }

        private void GenerateMenu(List<MenuLeft> menus, StringBuilder htmlMenu)
        {
            htmlMenu.Append("<ul>");
            foreach (MenuLeft menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                if (menu == null) continue;
                List<MenuLeft> menuChild = menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList();
                htmlMenu.AppendFormat("<li>" +
                                      "<div>" +
                                      "<div style='float: left;'>{0}</div>" +
                                      "<div style='float: right;'>" +
                                      "<img onclick='editMenu({1})' src='../Images/iEdit.png' width='16' />" +
                                      "<img onclick='deleteMenu({2})' src='../Images/iDelete.png' width='16' />" +
                                      "</div>" +
                                      "</div>",
                                      menu.Name, menu.Id, menu.Id);
                if (menuChild.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (MenuLeft menuLeft in menuChild)
                    {
                        htmlMenu.AppendFormat("<li>" +
                                              "<div>" +
                                              "<span>{0}</span>" +
                                              "<div>" +
                                              "<img onclick='editMenu({1})' src='../Images/iEdit.png' width='16' />" +
                                              "<img onclick='deleteMenu({2})' src='../Images/iDelete.png' width='16' />" +
                                              "</div>" +
                                              "</div>" +
                                              "</li>",
                                              menuLeft.Name, menuLeft.Id, menuLeft.Id);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
        }

        private void GenerateMenuProject(List<MenuLeft> menus, StringBuilder htmlMenu)
        {
            htmlMenu.Append("<ul>");
            foreach (MenuLeft menu in menus.Where(t => t.ParentId == null).OrderBy(t => t.Position))
            {
                if (menu == null) continue;
                List<MenuLeft> menuChild = menus.Where(t => t.ParentId != null && t.ParentId == menu.Id).ToList();
                htmlMenu.AppendFormat("<li>" +
                                      "<div>" +
                                      "<div style='float: left;'>{0}</div>" +
                                      "</div>", menu.Name);
                if (menuChild.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (MenuLeft menuLeft in menuChild)
                    {
                        htmlMenu.AppendFormat("<li>" +
                                              "<div>" +
                                              "<input id='rd{0}' type='radio' name='rdKind' value='{1}'>" +
                                              "<label for='rd{2}'>{3}</label>" +
                                              "</div>" +
                                              "</li>",
                                              menuLeft.Id, menuLeft.Id, menuLeft.Id, menuLeft.Name);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
        }

        private string GetMenuById(int id, int type)
        {
            var bo = new MenuLeftBO();
            MenuLeft res = bo.GetMenuLeftById(id, type);
            return Utils.ConvertToJsonString(res);
        }

        private string CreateMenu(MenuLeft menuLeft)
        {
            var bo = new MenuLeftBO();
            int res = bo.AddMenuLef(menuLeft);
            return Utils.ConvertToJsonString(res);
        }

        private string UpdateMenu(MenuLeft menuLeft)
        {
            var bo = new MenuLeftBO();
            int res = bo.UpdateMenuLef(menuLeft);
            return Utils.ConvertToJsonString(res);
        }


        private string DeleteMenu(int id)
        {
            var bo = new MenuLeftBO();
            int res = bo.DeleteMenuLef(id);
            return Utils.ConvertToJsonString(res);
        }
    }
}

//<div>
//                                                    <img src="../Images/iEdit.png" width="16" />
//                                                    <img src="../Images/iDelete.png" width="16" />
//                                                </div>