using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Admin
{
    public partial class Consultant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ucNews.radContent.ImageManager.ViewPaths =
                ucNews.radContent.ImageManager.UploadPaths =
                ucNews.radContent.ImageManager.DeletePaths = new[] { "~//Images//Uploads//Consultant" };
        }


    }
}