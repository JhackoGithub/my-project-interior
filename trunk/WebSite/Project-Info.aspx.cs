using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using BLL;
using ProjectBE = Entities.Project;

namespace WebSite
{
    public partial class Project_Info : Page
    {
        private int Id { get { return Page.RouteData.Values["id"] == null ? 0 : int.Parse(Page.RouteData.Values["id"].ToString()); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            LoadProject();
        }

        private void LoadProject()
        {
            if (Id == 0)
                return;
            var bo = new ProjectBO();
            ProjectBE res = bo.GetProjectById(Id);
            if (res == null)
                return;
            string path = string.Format("\\Images\\projects{0}", res.PathImage);
            if (!Directory.Exists(Server.MapPath(path)))
                return;
            var dirInfo = new DirectoryInfo(Server.MapPath(path));
            var imageSlide = new StringBuilder();
            foreach (FileInfo fileInfo in dirInfo.GetFiles())
            {
                string pathImage = Page.ResolveUrl(string.Format("{0}\\{1}", path, fileInfo.Name));
                imageSlide.AppendFormat("<div data-thumb='{0}' data-src='{1}'></div>", pathImage, pathImage);
            }
            ltImages.Text = imageSlide.ToString();
            ltProjectInfo.Text = res.Information;
            ltProjectDesc.Text = res.Description;
        }
    }
}