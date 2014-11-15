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
            string jsonString = string.Empty;
            context.Response.ContentType = "text/plain";
            MenuLeft menuLeft;
            int projectId = context.Request.QueryString["projectid"] == null
                                ? 0
                                : Convert.ToInt32(context.Request.QueryString["projectid"]);
            int id = context.Request.QueryString["id"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["id"]);
            string action = context.Request.QueryString["funcname"].ToLower();
            int type = Convert.ToInt32(context.Request.QueryString["type"]);
            switch (action)
            {
                case "getall":
                    string form = context.Request.QueryString["frm"] == null
                                      ? string.Empty
                                      : context.Request.QueryString["frm"].ToLower();
                    int subType = context.Request.QueryString["subtype"] == null
                                      ? 0
                                      : Convert.ToInt32(context.Request.QueryString["subtype"]);
                    jsonString = GetMenus(type, subType, form, projectId);
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
                    jsonString = UpdateMenu(menuLeft);
                    break;
            }
            context.Response.Write(jsonString);
        }

        private string GetMenus(int type, int subType, string form, int proId)
        {
            var htmlMenu = new StringBuilder();
            List<MenuLeft> menus = GetByType(type);
            object json;
            string jsonData = string.Empty;
            if (string.IsNullOrEmpty(form))
            {
                var htmlMenuDropdown = new StringBuilder();
                switch (type)
                {
                    case 0:
                    case 1:
                        jsonData = GetMenuProject(menus);
                        return jsonData;
                    case 2:
                        jsonData = GetMenuConsultant(menus, subType);
                        return jsonData;
                        //GenerateMenuConsultant(menus, htmlMenu, htmlMenuDropdown, subType);
                        //break;
                    case 3:
                        var menuParents = menus.Where(t => t.ParentId == null).OrderBy(t => t.Position);
                        GenerateMenuDropdow(menuParents, htmlMenuDropdown);
                        GenerateMenuConsultant(menus, htmlMenu, string.Empty);
                        break;
                }

                json = new
                           {
                               menu = htmlMenu.ToString(),
                               dropdown = htmlMenuDropdown.ToString()
                           };
            }
            else
            {
                var proBo = new ProjectBO();
                var project = proBo.GetProjectById(proId);
                menus = GetByType(project.Type);

                GenerateMenuProject(menus, htmlMenu, project.CategoryId);
                json = new
                           {
                               menu = htmlMenu.ToString(),
                           };
            }
            string res = Utils.ConvertToJsonString(json);
            return res;
        }

        private string GetMenuProject(List<MenuLeft> menus)
        {
            var parents = menus.Where(t => t.ParentId == null).OrderBy(t => t.Position);
            var parentses = new List<Parents>();
            foreach (var parent in parents.Where(parent => parent != null))
            {
                var menuParent = new Parents
                                     {
                                         Id = parent.Id,
                                         Name = parent.Name
                                     };
                var childs = menus.Where(t => t.ParentId != null && t.ParentId == parent.Id).ToList();
                if(childs.Count == 0)
                {
                    menuParent.Childs = new List<Childs>();
                }
                else
                {
                    foreach (var menuChild in childs.Select(child => new Childs
                                                                         {
                                                                             Id = child.Id,
                                                                             Name = child.Name
                                                                         }))
                    {
                        menuParent.Childs.Add(menuChild);
                    }
                }
                parentses.Add(menuParent);
            }
            object json = new
                {
                    parent = parentses
                };
            var res = Utils.ConvertToJsonString(json);
            return res;
        }

        private string GetMenuConsultant(List<MenuLeft> menus, int subType)
        {
            var parent = menus.Where(t => t.SubType == subType).ToList();
            var commonParents = parent.Where(t => t.ParentId == null).OrderBy(t => t.Position).ToList();
            var commons = GetMenuParents(commonParents);

            var sperateParents = parent.OrderByDescending(t => t.SubType).ToList();
            var sperates = GetMenuParents(sperateParents);

            var dropdown = menus.Where(t => t.ParentId == null && t.SubType == subType).OrderBy(t => t.Position).ToList();

            object json = new
                              {
                                  commons,
                                  sperates,
                                  dropdown
                              };
            var res = Utils.ConvertToJsonString(json);
            return res;
        }

        private List<Parents> GetMenuParents(List<MenuLeft> menus)
        {
            var parentses = new List<Parents>();
            foreach (var parent in menus.Where(parent => parent != null))
            {
                var menuParent = new Parents
                                     {
                                         Id = parent.Id,
                                         Name = parent.Name
                                     };
                var childs = menus.Where(t => t.ParentId != null && t.ParentId == parent.Id).ToList();
                if (childs.Count == 0)
                {
                    menuParent.Childs = new List<Childs>();
                }
                else
                {
                    foreach (var menuChild in childs.Select(child => new Childs{ Id = child.Id, Name = child.Name}))
                    {
                        menuParent.Childs.Add(menuChild);
                    }
                }
                parentses.Add(menuParent);
            }
            return parentses;
        }
        
        private void GenerateMenuProject(List<MenuLeft> menus, StringBuilder htmlMenu, int cateId)
        {
            htmlMenu.Append("<ul>");
            var menuParents = menus.Where(t => t.ParentId == null).OrderBy(t => t.Position);
            foreach (MenuLeft parent in menuParents.Where(parent => parent != null))
            {
                
                htmlMenu.AppendFormat("<li>" +
                                      "<div>" +
                                      "<div style='float: left;'>{0}</div>" +
                                      "</div>", parent.Name);
                List<MenuLeft> menuChilds = menus.Where(t => t.ParentId != null && t.ParentId == parent.Id).ToList();
                if (menuChilds.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (MenuLeft child in menuChilds)
                    {
                        htmlMenu.AppendFormat("<li>" +
                                              "<div>" +
                                              "<input id='rd{0}' type='radio' name='rdKind' value='{1}' {2}>" +
                                              "<label for='rd{3}'>{4}</label>" +
                                              "</div>" +
                                              "</li>",
                                              child.Id, child.Id,
                                              cateId == child.Id ? "checked='checked'" : string.Empty, child.Id,
                                              child.Name);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
        }

        private void GenerateMenuConsultant(List<MenuLeft> menus, StringBuilder htmlMenu, StringBuilder htmlMenuDropdown, int subType)
        {
            string caption = "Phần hiển thị chung cho Kiến trúc và Nội thất";
            var parent = menus.Where(t => t.SubType == 2).ToList();
            GenerateMenuConsultant(parent, htmlMenu, caption);
            switch (subType)
            {
                case 0:
                case 1:
                    parent = menus.Where(t => t.SubType == subType).OrderByDescending(t => t.SubType).ToList();
                    if(parent.Count == 0)
                        break;
                    caption = string.Format("Các câu hỏi tư vấn phần {0}", subType == 0 ? "Kiến trúc" : "Nội thất");
                    GenerateMenuConsultant(parent, htmlMenu, caption);
                    break;
            }
            parent = menus.Where(t => t.ParentId == null && t.SubType == subType).OrderBy(t => t.Position).ToList();
            GenerateMenuDropdow(parent, htmlMenuDropdown);
        }
        private void GenerateMenuConsultant(List<MenuLeft> menus, StringBuilder htmlMenu, string caption)
        {
            htmlMenu.Append(string.Format("<label>{0}</label>", caption));
            htmlMenu.Append("<ul>");
            var menuParents = menus.Where(t => t.ParentId == null).OrderBy(t => t.Position);
            foreach (var parent in menuParents.Where(parent => parent != null))
            {
                GenerateMenuParent(parent, htmlMenu);

                var menuChilds = menus.Where(t => t.ParentId != null && t.ParentId == parent.Id).ToList();
                if (menuChilds.Count == 0)
                {
                    htmlMenu.Append("</li>");
                }
                else
                {
                    htmlMenu.Append("<ul>");
                    foreach (var child in menuChilds)
                    {
                        var imgLink = child.Link > 0 ? string.Format("<a href='/tu-van/tu-van-cong-trinh/{0}/2/{1}' target='_blank' ><img id='link{2}' title='{3}' src='../Images/link.png' width='16' /></a>"
                                                             , child.SubType == 2 ? 1 : child.SubType, child.Link, child.Id, child.Title) : string.Empty;
                        htmlMenu.AppendFormat("<li>" +
                                              "<div>" +
                                              "<span>{0}</span>" +
                                              "<div>" +
                                              "<img onclick='editMenu({1}, false)' src='../Images/iEdit.png' width='16' title='Sửa' />" +
                                              "<img onclick='deleteMenu({2})' src='../Images/iDelete.png' width='16' title='Xóa' />" +
                                              imgLink +
                                              "</div>" +
                                              "</div>" +
                                              "</li>",
                                              child.Name, child.Id, child.Id);
                    }
                    htmlMenu.Append("</ul>");
                }
            }
            htmlMenu.Append("</ul>");
        }

        private void GenerateMenuDropdow(IEnumerable<MenuLeft> parents, StringBuilder htmlMenuDropdown)
        {
            foreach (var parent in parents)
            {
                htmlMenuDropdown.AppendFormat("<option value='{0}'>{1}</option>", parent.Id, parent.Name);    
            }
        }

        private void GenerateMenuParent(MenuLeft parent, StringBuilder htmlMenu)
        {
            htmlMenu.AppendFormat("<li>" +
                                  "<div style='height: 20px;'>" +
                                  "<div style='float: left; text-transform: uppercase;padding-top: 5px;'>{0}</div>" +
                                  "<div style='float: right;'>" +
                                  "<img onclick='editMenu({1}, true)' src='../Images/iEdit.png' width='16' title='Sửa' />" +
                                  "<img onclick='deleteMenu({2})' src='../Images/iDelete.png' width='16' title='Xóa' />" +
                                  "</div>" +
                                  "</div>",
                                  parent.Name, parent.Id, parent.Id);
        }
        private List<MenuLeft> GetByType(int type)
        {
            var bo = new MenuLeftBO();
            var res = bo.GetMenuLeft(type);
            return res;
        }
        private string GetMenuById(int id, int type)
        {
            var bo = new MenuLeftBO();
            var res = bo.GetMenuLeftById(id, type);
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

    public class Parents
    {
        public Parents()
        {
            Childs = new List<Childs>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Childs> Childs { get; set; }
    }

    public class Childs
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}