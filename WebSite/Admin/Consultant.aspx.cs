using System;
using System.Web.UI;

namespace WebSite.Admin
{
    public partial class Consultant : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ucNews.radContent.ImageManager.ViewPaths =
                ucNews.radContent.ImageManager.UploadPaths =
                ucNews.radContent.ImageManager.DeletePaths = new[] {"~//Images//Uploads//Consultant"};
        }
    }
}