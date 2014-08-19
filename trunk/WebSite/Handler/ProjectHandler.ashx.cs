using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Linq;
using BLL;
using WebSite.Common;
using ProjectBE = Entities.Project;

namespace WebSite.Handler
{
    /// <summary>
    /// Summary description for ProjectHandler
    /// </summary>
    public class ProjectHandler : BaseHandler
    {
        protected override void ProcessMainRequest(HttpContext context)
        {
            string jsonString = string.Empty;
            context.Response.ContentType = "text/plain";
            
            string action = context.Request.QueryString["funcname"].ToLower();
            int type = context.Request.QueryString["type"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["type"]);
            var project = new ProjectBE();
            switch (action)
            {
                case "getall":
                    int cateId = context.Request.QueryString["cate"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["cate"]);
                    jsonString = GetProjects(type, cateId);
                    break;
                case "edit":
                    int id = context.Request.QueryString["id"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["id"]);
                    jsonString = GetProjectById(id);
                    break;
                case "create":
                    project = Utils.ConvertDeserialize<ProjectBE>(context, ref jsonString);
                    jsonString = CreateProject(project);
                    break;
                case "update":
                    int proId = context.Request.QueryString["id"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["id"]);
                    project = Utils.ConvertDeserialize<ProjectBE>(context, ref jsonString);
                    project.Id = proId;
                    jsonString = UpdateProject(project);
                    break;
            }
            context.Response.Write(jsonString);
        }

        private string GetProjectById(int id)
        {
            if (id == 0)
                return string.Empty;
            var bo = new ProjectBO();
            var res = bo.GetProjectById(id);
            var json = new
                           {
                               project = res
                           };
            return Utils.ConvertToJsonString(json);
        }

        private string GetProjects(int type, int cateId)
        {
            var bo = new ProjectBO();
            var res = bo.GetProjects();
            res = res.Where(t => t.Type == type).ToList();
            if (cateId > 0)
                res = res.Where(t => t.CategoryId == cateId).ToList();
            var htmlProject = new StringBuilder();
            GenerateHtmlProjects(res, htmlProject);
            var json = new
                           {
                               html = htmlProject.ToString(),
                           };
            return Utils.ConvertToJsonString(json);
        }

        private void GenerateHtmlProjects(IEnumerable<ProjectBE> projects, StringBuilder htmlProject)
        {
            htmlProject.Append("<ul class='recent-posts projects'>");
            foreach (ProjectBE project in projects)
            {
                string projectName = string.Format("Dự án: {0}", project.Name);
                string pathImage = string.Format("Images\\projects{0}\\{1}", project.PathImage, project.PrimaryImage);
                htmlProject.AppendFormat("<li class='projects'>");
                htmlProject.AppendFormat("<figure class='featured-thumbnail'>");
                htmlProject.AppendFormat(
                    "<a href='Project-Info.aspx?type={0}&tab=1&cate={1}&project={2}' title='{3}'><img src='{4}' style='width: 200px;' /></a>",
                    project.Type, project.CategoryId, project.Id, projectName, pathImage);
                htmlProject.Append("</figure>");
                htmlProject.AppendFormat(
                    "<h5><a href='Project-Info.aspx?type={0}&tab=1&cate={1}&project={2}' title='{3}'>{4}</a></h5>",
                    project.Type, project.CategoryId, project.Id, projectName, projectName);
                htmlProject.Append("<div class='clear'></div>");
                htmlProject.Append("</li>");
            }
            htmlProject.Append("</ul>");
        }


        private string CreateProject(ProjectBE project)
        {
            var bo = new ProjectBO();
            var res = bo.AddProject(project);
            return Utils.ConvertToJsonString(res);
        }

        private string UpdateProject(ProjectBE project)
        {
            var bo = new ProjectBO();
            var res = bo.UpdateProject(project);
            return Utils.ConvertToJsonString(res);
        }
    }
}