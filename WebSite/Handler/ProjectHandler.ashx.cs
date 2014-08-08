using System;
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
            int id = context.Request.QueryString["id"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["id"]);
            string action = context.Request.QueryString["funcname"].ToLower();
            var project = new ProjectBE();
            switch (action)
            {
                case "create":
                    project = Utils.ConvertDeserialize<ProjectBE>(context, ref jsonString);
                    jsonString = CreateProject(project);
                    break;
                case "update":
                    project = Utils.ConvertDeserialize<ProjectBE>(context, ref jsonString);
                    jsonString = UpdateProject(project);
                    break;
            }
            context.Response.Write(jsonString);
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