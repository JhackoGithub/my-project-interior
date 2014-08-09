using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using Telerik.Web.UI;

namespace WebSite.Contents
{
    public partial class ImageManager : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
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
            foreach (DirectoryInfo dirs in directory.GetDirectories())
            {
                var node = new RadTreeNode
                               {
                                   Text = dirs.Name,
                                   Value = string.Format("{0}\\{1}", treeNode.Value, dirs.Name)
                               };
                treeNode.Nodes.Add(node);
                if (dirs.GetDirectories().Any())
                    LoadFolder(dirs, node);
            }
        }
    }
}
