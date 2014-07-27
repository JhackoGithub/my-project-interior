using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Architecture : Page
    {
        private string Category
        {
            get { return Request.QueryString["cate"] ?? "all"; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master != null) Master.Page.Title = "Công trình";
            
            LoadProject();
        }

        private void LoadProject()
        {
            var projects = new List<Project>();
            GetProjects(projects);

            var htmlProject = new StringBuilder();
            htmlProject.Append("<ul class='recent-posts projects'>");
            foreach (var project in projects)
            {
                var projectName = string.Format("Dự án {0}", project.Name);
                var pathImage = string.Format("{0}\\project-view.jpg", project.Path);
                htmlProject.AppendFormat("<li class='projects'>");
                htmlProject.AppendFormat("<figure class='featured-thumbnail'>");
                htmlProject.AppendFormat("<a href='Project-Info.aspx?type=0&tab=1&cate={0}&project={1}' title='{2}'><img src='{3}' /></a>", project.Category, project.Id, projectName, pathImage);
                htmlProject.Append("</figure>");
                htmlProject.AppendFormat("<h5><a href='Project-Info.aspx?type=0&tab=1&cate={0}&project={1}' title='{2}'>{3}</a></h5>", project.Category, project.Id, projectName, projectName);
                htmlProject.Append("<div class='clear'></div>");
                htmlProject.Append("</li>");
            }
            htmlProject.Append("</ul>");
            ltProjects.Text = htmlProject.ToString();
        }

        private void GetProjects(List<Project> projects)
        {
            var paths = new List<string>();
            
            if(Category == "all")
            {
                paths.Add(@"\Images\projects\architecture\villa\modern\");
                paths.Add(@"\Images\projects\architecture\villa\classic\");
                paths.Add(@"\Images\projects\architecture\batch\modern\");
                paths.Add(@"\Images\projects\architecture\batch\classic\");
            }
            else
            {
                var path = Category.Replace('-', '\\');
                if (string.IsNullOrEmpty(path))
                    return;
                paths.Add(string.Format(@"\Images\projects\architecture\{0}\", path));
            }
            foreach (var path in paths)
            {
                if(!Directory.Exists(Server.MapPath(path)))
                    continue;
                var dirInfo = new DirectoryInfo(Server.MapPath(path));
                foreach (DirectoryInfo directory in dirInfo.GetDirectories())
                {
                    var project = new Project
                    {
                        Id = string.Format("{0}-{1}-{2}", directory.Parent.Parent, directory.Parent, directory.Name),
                        Category = string.Format("{0}-{1}", directory.Parent.Parent, directory.Parent),
                        Name = directory.Name,
                        Path = string.Format("{0}{1}", path, directory.Name)
                    };
                    projects.Add(project);
                }
            }
        }
    }

    public class Project
    {
        public string Id { get; set; }
        public string Category { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
    }
}