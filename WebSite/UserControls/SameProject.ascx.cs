using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Linq;
using BLL;
using ProjectBE = Entities.Project;

namespace WebSite.UserControls
{
    public partial class ContentRight : UserControl
    {
        public int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }

        private int CategoryId
        {
            get { return Request.QueryString["cate"] == null ? 0 : Convert.ToInt32(Request.QueryString["cate"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            GenerateSameProject();
        }
        
        private void GenerateSameProject()
        {
            var projects = GetProjects();
            
            var htmlProject = new StringBuilder();
            htmlProject.Append("<ul class='recent-posts projects'>");
            foreach (ProjectBE project in projects)
            {
                string projectName = string.Format("Dự án {0}", project.Name);
                string pathImage = string.Format("Images\\projects{0}\\{1}", project.PathImage, project.PrimaryImage);
                htmlProject.AppendFormat("<li class='projects'>");
                htmlProject.AppendFormat("<figure class='featured-thumbnail'>");
                htmlProject.AppendFormat(
                    "<a href='Project-Info.aspx?type={0}&tab=1&project={1}&cate={2}' title='{3}'><img src='{4}' style='width: 200px;' /></a>",
                    Type, project.Id, project.CategoryId, projectName, pathImage);
                htmlProject.Append("</figure>");
                htmlProject.AppendFormat(
                    "<h5><a href='Project-Info.aspx?type={0}&tab=1&project={1}&cate={2}' title='{3}'>{4}</a></h5>", Type,
                    project.Id, project.CategoryId, projectName, projectName);
                htmlProject.Append("<div class='clear'></div>");
                htmlProject.Append("</li>");
            }
            htmlProject.Append("</ul>");
            ltProjects.Text = htmlProject.ToString();
        }

        private IEnumerable<ProjectBE> GetProjects()
        {
            var bo = new ProjectBO();
            var res = bo.GetProjectCateId(CategoryId);
            return res;
        }
    }
}