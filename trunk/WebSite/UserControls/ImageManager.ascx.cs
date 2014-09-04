using System;
using System.Web.UI;

namespace WebSite.UserControls
{
    public partial class ImageManager : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            IntinialImageManager();
        }

        private void IntinialImageManager()
        {
            RadFileExplorer1.Configuration.EnableAsyncUpload = true;
            RadFileExplorer1.Configuration.SearchPatterns = new[] {"*.jpg", "*.jpeg", "*.gif", "*.png"};
            RadFileExplorer1.Configuration.ViewPaths = new[] {"~/Images/projects"};
            RadFileExplorer1.Configuration.UploadPaths = new[] {"~/Images/projects"};
            RadFileExplorer1.Configuration.DeletePaths = new[] {"~/Images/projects"};
            RadFileExplorer1.Configuration.MaxUploadFileSize = 157286400;
        }
    }
}