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
            var imageManagerParameters = new FileManagerDialogParameters
                                             {
                                                 ViewPaths = new string[] { "~/Images/projects" },
                                                 UploadPaths = new string[] { "~/Images/projects" },
                                                 DeletePaths = new string[] { "~/Images/projects" },
                                                 MaxUploadFileSize = 157286400
                                             };
            var imageManager = new DialogDefinition(typeof(ImageManagerDialog), imageManagerParameters)
                                   {
                                       ClientCallbackFunction = "ImageManagerFunction",
                                       Width = Unit.Pixel(694),
                                       Height = Unit.Pixel(440)
                                   };
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

        protected void rgProject_ItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    int id = int.Parse(e.CommandArgument.ToString());
                    var newsBo = new ProjectBO();
                    int res = newsBo.DeleteProject(id);
                    string msg = string.Format("Xóa bản tin {0}", res > 0 ? "thành công" : "bị lỗi");
                    ltScript.Text = string.Format("<script>alert('{0}');</script>", msg);
                    break;
            }
        }
    }
}