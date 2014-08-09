using System;
using System.IO;
using System.Text;
using System.Web.UI;
using BLL;
using ProjectBE = Entities.Project;

namespace WebSite
{
    public partial class Project_Info : Page
    {
        private int Id
        {
            get { return Request.QueryString["project"] == null ? 0 : Convert.ToInt32(Request.QueryString["project"]); }
        }

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
            var res = bo.GetProjectById(Id);
            if (res == null)
                return;
            var path = string.Format("Images\\projects{0}", res.PathImage);
            if (!Directory.Exists(Server.MapPath(path)))
                return;
            var dirInfo = new DirectoryInfo(Server.MapPath(path));
            var imageSlide = new StringBuilder();
            foreach (FileInfo fileInfo in dirInfo.GetFiles())
            {
                string pathImage = string.Format("{0}\\{1}", path, fileInfo.Name);
                imageSlide.AppendFormat("<img src='{0}' />", pathImage);
            }
            ltImages.Text = imageSlide.ToString();
            ltProjectInfo.Text = res.Information;
            ltProjectDesc.Text = res.Description;
        }
    }
}