using System;
using System.Collections.Generic;
using BLL;
using WebSite.Core;
using ProjectBE = Entities.Project;

namespace WebSite.Admin
{
    public partial class Project : AuthenPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void rgProject_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            var projects = GetProjects();
            rgProject.DataSource = projects;
        }

        private List<ProjectBE> GetProjects()
        {
            var bo = new ProjectBO();
            var res = bo.GetProjects();
            return res;
        }

        protected void rgProject_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }
    }
}