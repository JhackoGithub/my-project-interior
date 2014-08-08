using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web.UI;

namespace WebSite.UserControls
{
    public partial class ContentRight : UserControl
    {
        public int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }

        private string Category
        {
            get { return Request.QueryString["cate"] ?? "villa\\modern"; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            GenerateSameProject();
        }

        private void GenerateSameProject()
        {
            var projects = new List<Project>();
            GetProjects(projects);
            var htmlProject = new StringBuilder();
            htmlProject.Append("<ul class='recent-posts projects'>");
            foreach (Project project in projects)
            {
                string projectName = string.Format("Dự án {0}", project.Name);
                string pathImage = string.Format("{0}\\project-view.jpg", project.Path);
                htmlProject.AppendFormat("<li class='projects'>");
                htmlProject.AppendFormat("<figure class='featured-thumbnail'>");
                htmlProject.AppendFormat(
                    "<a href='Project-Info.aspx?type={0}&tab=1&project={1}&cate={2}' title='{3}'><img src='{4}' /></a>",
                    Type, project.Id, project.Category, projectName, pathImage);
                htmlProject.Append("</figure>");
                htmlProject.AppendFormat(
                    "<h5><a href='Project-Info.aspx?type={0}&tab=1&project={1}&cate={2}' title='{3}'>{4}</a></h5>", Type,
                    project.Id, project.Category, projectName, projectName);
                htmlProject.Append("<div class='clear'></div>");
                htmlProject.Append("</li>");
            }
            htmlProject.Append("</ul>");
            ltProjects.Text = htmlProject.ToString();
        }

        private void GetProjects(List<Project> projects)
        {
            string cate = Category.Replace('-', '\\');
            if (string.IsNullOrEmpty(cate))
            {
                cate = "villa\\modern";
            }
            string path = string.Format(@"\Images\projects\architecture\{0}\", cate);
            if (!Directory.Exists(Server.MapPath(path)))
                return;
            var dirInfo = new DirectoryInfo(Server.MapPath(path));
            foreach (DirectoryInfo directory in dirInfo.GetDirectories())
            {
                var project = new Project
                                  {
                                      Id =
                                          string.Format("{0}-{1}-{2}", directory.Parent.Parent, directory.Parent,
                                                        directory.Name),
                                      Category = string.Format("{0}-{1}", directory.Parent.Parent, directory.Parent),
                                      Name = directory.Name,
                                      Path = string.Format("{0}{1}", path, directory.Name)
                                  };
                projects.Add(project);
            }
        }
    }
}