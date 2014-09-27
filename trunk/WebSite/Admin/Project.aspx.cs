using System;
using System.Collections.Generic;
using System.Web;
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
                                                 ViewPaths = new[] {"~/Images/projects"},
                                                 UploadPaths = new[] {"~/Images/projects"},
                                                 DeletePaths = new[] {"~/Images/projects"},
                                                 MaxUploadFileSize = 157286400
                                             };
            var imageManager = new DialogDefinition(typeof (ImageManagerDialog), imageManagerParameters)
                                   {
                                       ClientCallbackFunction = "ImageManagerFunction",
                                       Width = Unit.Pixel(694),
                                       Height = Unit.Pixel(440)
                                   };
            DialogOpener1.DialogDefinitions.Add("ImageManager", imageManager);
        }

        protected void rgProject_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            List<ProjectBE> projects = GetProjects();
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
                    var bo = new ProjectBO();
                    int res = bo.DeleteProject(id);
                    string msg = string.Format("Xóa dự án {0}", res > 0 ? "thành công" : "bị lỗi");
                    ltScript.Text = string.Format("<script>alert('{0}');</script>", msg);
                    break;
            }
        }

        protected void rgProject_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
            {
                var lkbDelete = (LinkButton)e.Item.FindControl("lkbDelete");
                if (lkbDelete != null)
                {
                    lkbDelete.Attributes.Add("onclick", string.Format("return deleteProject()"));
                }
            }
        }
    }
}