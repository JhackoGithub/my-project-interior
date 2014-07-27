using System;
using System.IO;
using BLL;

namespace WebSite.Admin
{
    public partial class AddNews : System.Web.UI.Page
    {
        private int Id
        {
            get { return Request.QueryString["id"] == null ? 0 : Convert.ToInt32(Request.QueryString["id"]); }
        }

        private string ImageState
        {
            set { ViewState["img"] = value; }
            get { return (string)ViewState["img"]; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            if(Id > 0)
            {
                BindEntityToControl();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var news = new Entities.News();
            BindControlToEntity(news);
            var newBo = new NewsBO();
            news.Id = Id;
            var res = Id == 0 ? newBo.AddNews(news) : newBo.UpdateNews(news);
            var msg = string.Format("{0} bản tin {1}", Id == 0 ? "Tạo mới" : "Cập nhật", res > 0 ? "thành công" : "bị lỗi");
            ltScript.Text = string.Format("<script>alert('{0}');</script>", msg);
        }

        private void BindEntityToControl()
        {
            var newsBo = new NewsBO();
            var news = newsBo.GetNewsById(Id);
            tbTitle.Text = news.Title;
            tbSubcontent.Text = news.SubContent;
            radContent.Content = news.Contents;
        }

        private void BindControlToEntity(Entities.News news)
        {
            news.Title = tbTitle.Text.Trim();
            news.ImageUrl = ImageState;
            news.SubContent = tbSubcontent.Text.Trim();
            news.Contents = radContent.Content;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            const string path = "/Images/Uploads/News/";
            if (fileUpload.HasFile)
            {
                var fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + fileUpload.FileName.Replace(' ', '-').Replace('_', '-');
                fileUpload.PostedFile.SaveAs(Server.MapPath(string.Format("{0}{1}", path, fileName)));
                ImageState = fileName;
            }
            imgNews.ImageUrl = !string.IsNullOrEmpty(ImageState) ? string.Format("{0}{1}", path, ImageState) : "/Images/no-image.png";
        }
    }
}