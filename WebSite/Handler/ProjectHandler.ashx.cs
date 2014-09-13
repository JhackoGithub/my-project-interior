using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
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
            int type = context.Request.QueryString["type"] == null ? 0
                           : Convert.ToInt32(context.Request.QueryString["type"]);
            int cateId = context.Request.QueryString["cate"] == null
                                     ? 0
                                     : Convert.ToInt32(context.Request.QueryString["cate"]);
            ProjectBE project;
            switch (action)
            {
                case "getall":
                    jsonString = GetProjects(type, cateId);
                    break;
                case "getallbypageindex":
                    var pageIndex = Utils.ConvertDeserialize<int>(context, ref jsonString);
                    jsonString = GetProjectByPageIndex(type, cateId, pageIndex, 6);
                    break;
                case "getrefer":
                    jsonString = GenerateHtmlProjectRefer(type);
                    break;
                case "edit":
                    int id = context.Request.QueryString["id"] == null
                                 ? 0
                                 : Convert.ToInt32(context.Request.QueryString["id"]);
                    jsonString = GetProjectById(id);
                    break;
                case "create":
                    project = Utils.ConvertDeserialize<ProjectBE>(context, ref jsonString);
                    jsonString = CreateProject(project);
                    break;
                case "update":
                    int proId = context.Request.QueryString["id"] == null
                                    ? 0
                                    : Convert.ToInt32(context.Request.QueryString["id"]);
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
            ProjectBE res = bo.GetProjectById(id);
            var json = new
                           {
                               project = res
                           };
            return Utils.ConvertToJsonString(json);
        }

        private string GetProjects(int type, int cateId)
        {
            var bo = new ProjectBO();
            List<ProjectBE> res = bo.GetProjects();
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

        private string GetProjectByPageIndex(int type, int cateId, int pageIndex, int pageSize)
        {
            var bo = new ProjectBO();
            var res = bo.GetProjectByTypeByPageIndex(type, pageIndex, pageSize);
            var htmlProject = new StringBuilder();
            GenerateHtmlProjects(res.Projects, htmlProject);
            var json = new
                           {
                               html = htmlProject.ToString(),
                               pageindex = res.PageIndex,
                               pagesize = res.PageSize,
                               totalrows = res.TotalRows
                           };
            return Utils.ConvertToJsonString(json);
        }

        private void GenerateHtmlProjects(IEnumerable<ProjectBE> projects, StringBuilder htmlProject)
        {
            htmlProject.Append("<ul class='grid cs-style-5'>");
            foreach (ProjectBE project in projects)
            {
                string pathImage = string.Format("Images\\projects{0}\\{1}", project.PathImage,
                                                 project.PrimaryImage);
                htmlProject.AppendFormat("<li>");
                htmlProject.AppendFormat("<figure>");
                htmlProject.AppendFormat("<img src='{0}' style='width: 315px; height: 220px;' />", pathImage);
                htmlProject.Append("<figcaption>");
                htmlProject.AppendFormat("<h3>Dự án</h3><span>{0}</span>", project.Name);
                htmlProject.AppendFormat("<a href='Project-Info.aspx?type={0}&tab=1&cate={1}&project={2}' title='{3}'>chi tiết</a>",project.Type, project.CategoryId, project.Id, project.Name);
                htmlProject.Append("</figcaption>");
                htmlProject.Append("</figure>");
                htmlProject.Append("</li>");
            }
            htmlProject.Append("</ul>");
        }

        private string GenerateHtmlProjectRefer(int type)
        {
            var htmlProject = new StringBuilder();
            string directory = type == 0 ? "architecture\\thamkhao" : "noi that\\thamkhao";
            IEnumerable<ProjectRefer> projects = GetProjects(string.Format(@"\Images\projects\{0}\", directory));
            
            htmlProject.Append("<ul class='grid cs-style-5'>");
            foreach (ProjectRefer project in projects)
            {
                string pathImage = string.Format("Images\\projects\\{0}\\{1}\\{2}", directory, project.Name, project.Image);
                htmlProject.AppendFormat("<li>");
                htmlProject.AppendFormat("<figure>");
                htmlProject.AppendFormat("<img src='{0}' style='width: 315px; height: 220px;' />", pathImage);
                htmlProject.Append("<figcaption>");
                htmlProject.AppendFormat("<h3>Dự án</h3><span>{0}</span>", project.Name);
                htmlProject.AppendFormat("<a href='Project-Info.aspx?type={0}&tab=1&cate={1}&project={2}' title='{3}'>chi tiết</a>", type, 0, 0, project.Name);
                htmlProject.Append("</figcaption>");
                htmlProject.Append("</figure>");
                htmlProject.Append("</li>");
            }
            htmlProject.Append("</ul>");
            var json = new
                           {
                               html = htmlProject.ToString()
                           };
            return Utils.ConvertToJsonString(json);
        }

        private IEnumerable<ProjectRefer> GetProjects(string path)
        {
            var res = new List<ProjectRefer>();
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                return res;
            var dirInfo = new DirectoryInfo(HttpContext.Current.Server.MapPath(path));
            foreach (DirectoryInfo directory in dirInfo.GetDirectories())
            {
                var project = new ProjectRefer
                                  {
                                      Image = GetImageName(string.Format("{0}{1}\\", path, directory.Name)),
                                      Name = directory.Name,
                                      Path = string.Format("{0}{1}", path, directory.Name)
                                  };
                res.Add(project);
            }
            return res;
        }

        private string GetImageName(string path)
        {
            string fileName = string.Empty;
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                return fileName;
            var dirInfo = new DirectoryInfo(HttpContext.Current.Server.MapPath(path));
            if (!dirInfo.GetFiles().Any())
                return fileName;
            fileName = dirInfo.GetFiles().FirstOrDefault().Name;
            return fileName;
        }

        private string CreateProject(ProjectBE project)
        {
            var bo = new ProjectBO();
            int res = bo.AddProject(project);
            return Utils.ConvertToJsonString(res);
        }

        private string UpdateProject(ProjectBE project)
        {
            var bo = new ProjectBO();
            int res = bo.UpdateProject(project);
            return Utils.ConvertToJsonString(res);
        }
    }

    public class ProjectRefer
    {
        public string Image { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
    }
}