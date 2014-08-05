using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebSite.Contents
{
    public partial class ImageManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFolderImage();
        }

        private void LoadFolderImage()
        {
            const string path = @"\Images\projects\";
            if (!Directory.Exists(Server.MapPath(path)))
                return;
            
            var dirMain = new DirectoryInfo(Server.MapPath(path));
            var treeNode = new RadTreeNode
                               {
                                   Text = "Thư mục dự án",
                                   Expanded = true
                               };
            LoadFolder(dirMain, treeNode);
            tvFolderImg.Nodes.Add(treeNode);
        }

        private void LoadFolder(DirectoryInfo directory, RadTreeNode treeNode)
        {
            foreach (var dirs in directory.GetDirectories())
            {
                var node = new RadTreeNode
                {
                    Text = dirs.Name
                };   
                treeNode.Nodes.Add(node);
                if(dirs.GetDirectories().Any())
                    LoadFolder(dirs, node);
            }
            
        }
    }
}