using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.UserControls
{
    public partial class ImageManager : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            IntinialImageManager();
        }

        private void IntinialImageManager()
        {
            RadFileExplorer1.Configuration.EnableAsyncUpload = true;
            RadFileExplorer1.Configuration.SearchPatterns = new string[] { "*.jpg", "*.jpeg", "*.gif", "*.png" };
            RadFileExplorer1.Configuration.ViewPaths = new string[] { "~/Images/projects" };
            RadFileExplorer1.Configuration.UploadPaths = new string[] { "~/Images/projects" };
            RadFileExplorer1.Configuration.DeletePaths = new string[] { "~/Images/projects" };
            RadFileExplorer1.Configuration.MaxUploadFileSize = 157286400;
        }
    }
}