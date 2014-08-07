using System;
using System.IO;
using System.Linq;
using Telerik.Web.UI;

namespace WebSite.Contents
{
    public partial class ImageManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
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
            foreach (var dirs in directory.GetDirectories())
            {
                var node = new RadTreeNode
                {
                    Text = dirs.Name,
                    Value = string.Format("{0}\\{1}", treeNode.Value, dirs.Name)
                };   
                treeNode.Nodes.Add(node);
                if(dirs.GetDirectories().Any())
                    LoadFolder(dirs, node);
            }
            
        }

        //protected void tvFolderImg_NodeClick(object sender, RadTreeNodeEventArgs e)
        //{
        //    var res = e.Node.Value;
        //    BindImages(res);
        //}

        //private void BindImages(string folder)
        //{
        //    string path = string.Format(@"\Images\projects{0}\", folder);
        //    if (!Directory.Exists(Server.MapPath(path)))
        //        return;
        //    var dirInfo = new DirectoryInfo(Server.MapPath(path));
        //    var images = new StringBuilder();
        //    foreach (FileInfo fileInfo in dirInfo.GetFiles())
        //    {
        //        if (fileInfo.Name.Equals("project-view.jpg") || fileInfo.Name.Equals("project-main.jpg"))
        //            continue;
        //        var pathImage = string.Format("{0}{1}", path, fileInfo.Name);
        //        images.Append("<div>");
        //        images.AppendFormat("<img src='{0}' />", pathImage);
        //        images.AppendFormat("<input id='rd{0}' type='radio' name='rd' value='rd{1}'><label for='rd{2}'>ảnh đại diện</label>", fileInfo.Name, fileInfo.Name, fileInfo.Name);
        //        images.Append("</div>");
        //    }
        //    ltImages.Text = images.ToString();
        //}
    }
}

//<div>
//                    <img src="../Images/projects/architecture/villa/modern/1/1.jpg">
//                    <input id="rd1" type="radio" name="rd" value="rd1"><label for="rd1">ảnh đại diện</label>
//                </div>