using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
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
            IEnumerable<ProjectBE> projects = GetProjects();

            var htmlProject = new StringBuilder();
            foreach (ProjectBE project in projects)
            {
                string pathImage = string.Format("Images\\projects{0}\\{1}", project.PathImage, project.PrimaryImage);
                htmlProject.AppendFormat("<div class='va-slice'>");
                htmlProject.AppendFormat("<div class='grid-block'>");
                htmlProject.AppendFormat("<div class='captions'>");
                htmlProject.AppendFormat("<h3>{0}</h3>", project.Name);
                htmlProject.AppendFormat("<p><a href='Project-Info.aspx?type={0}&tab=1&project={1}&cate={2}' class='learn-more' >chi tiết</a></p>", Type, project.Id, project.CategoryId);
                htmlProject.Append("</div>");
                htmlProject.AppendFormat("<img src='{0}' style='width: 200px;' />", pathImage);
                htmlProject.Append("</div>");
                htmlProject.Append("</div>");
            }
            ltProjects.Text = htmlProject.ToString();
        }

        private IEnumerable<ProjectBE> GetProjects()
        {
            var bo = new ProjectBO();
            List<ProjectBE> res = bo.GetProjectCateId(CategoryId);
            return res;
        }
    }
}