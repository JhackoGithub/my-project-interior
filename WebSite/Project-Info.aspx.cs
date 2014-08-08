using System;
using System.IO;
using System.Text;
using System.Web.UI;

namespace WebSite
{
    public partial class Project_Info : Page
    {
        private string Id
        {
            get { return Request.QueryString["project"] ?? "null"; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            LoadProject();
        }

        private void LoadProject()
        {
            if (Id == "null")
                return;
            string path = string.Format(@"\Images\projects\architecture\{0}\", Id.Replace('-', '\\'));
            if (!Directory.Exists(Server.MapPath(path)))
                return;
            var dirInfo = new DirectoryInfo(Server.MapPath(path));
            var images = new StringBuilder();
            var imageDesc = new StringBuilder();
            foreach (FileInfo fileInfo in dirInfo.GetFiles())
            {
                if (fileInfo.Name.Equals("project-view.jpg") || fileInfo.Name.Equals("project-main.jpg"))
                    continue;
                string pathImage = string.Format("{0}{1}", path, fileInfo.Name);
                imageDesc.AppendFormat("<img src='{0}' style='width: 450px;' /><br />", pathImage);
                images.AppendFormat("<img src='{0}' />", pathImage);
            }
            ltImages.Text = images.ToString();

            var projectInfo = new StringBuilder();
            projectInfo.Append("Phong cách: Hiện đại<br />");
            projectInfo.Append("Diện tích đất nghiên cứu: 530m2<br />");
            projectInfo.Append("Hướng khu đất: Tây Bắc<br />");
            projectInfo.Append("Chủ đầu tư: Lê Trung Sơn - sinh năm: 1985<br />");
            projectInfo.Append("Số người ở tại công trình: 3 thế hệ: ông bà, vợ chồng chủ hộ và 2 con (6 người)<br />");
            projectInfo.Append(
                "Yêu cầu: đầy đủ các không gian: phòng khách, phòng bếp, 5 phòng ngủ, phòng làm việc, sinh hoạt chung, phòng thờ, gara, sân vườn...<br />");
            ltProjectInfo.Text = projectInfo.ToString();

            ltProjectDesc.Text = imageDesc.ToString();
        }
    }
}