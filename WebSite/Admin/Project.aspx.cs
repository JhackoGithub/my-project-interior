using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using BLL;
using Telerik.Web.UI;
using Telerik.Web.UI.Editor.DialogControls;
using WebSite.Core;
using ProjectBE = Entities.Project;

namespace WebSite.Admin
{
    public partial class Project : AuthenPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FileManagerDialogParameters imageManagerParameters = new FileManagerDialogParameters();
            imageManagerParameters.ViewPaths = new string[] { "~/Images" };
            imageManagerParameters.UploadPaths = new string[] { "~/Images" };
            imageManagerParameters.DeletePaths = new string[] { "~/Images" };
            imageManagerParameters.MaxUploadFileSize = 5000000;
            DialogDefinition imageManager = new DialogDefinition(typeof(ImageManagerDialog), imageManagerParameters);
            imageManager.ClientCallbackFunction = "ImageManagerFunction";
            imageManager.Width = Unit.Pixel(694);
            imageManager.Height = Unit.Pixel(440);
            DialogOpener1.DialogDefinitions.Add("ImageManager", imageManager);
        }

        protected void rgProject_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
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