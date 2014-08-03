using System;
using System.IO;
using System.Web.UI;
using BLL;


namespace WebSite.Admin
{
    public partial class AddNews : Page
    {
        private int Id
        {
            get { return Request.QueryString["id"] == null ? 0 : Convert.ToInt32(Request.QueryString["id"]); }
        }

        private string Filename
        {
            get { return (string) ViewState["FILE_NAME"]; }
            set { ViewState["FILE_NAME"] = value; }
        }
        
        private const string Path = "/Images/Uploads/News/";

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
            var confirmMsg = string.Format("<script>confirmDialog('{0} bản tin thành công, bạn trở về trang quản lý bản tin?');</script>", Id == 0 ? "Tạo mới" : "Cập nhật");
            var alertMsg = string.Format("<script>alert('{0} bản tin không thành công');</script>", Id == 0 ? "Tạo mới" : "Cập nhật");
            ltScript.Text = string.Format("{0}", res > 0 ? confirmMsg : alertMsg);
        }

        private void BindEntityToControl()
        {
            var newsBo = new NewsBO();
            var news = newsBo.GetNewsById(Id);
            ucNews.tbTitle.Text = news.Title;
            ucNews.tbSubcontent.Text = news.SubContent;
            ucNews.radContent.Content = news.Contents;
            if (string.IsNullOrEmpty(news.ImageUrl)) return;
            Filename = news.ImageUrl;
            ucNews.ImageUrl = string.Format("{0}{1}", Path, news.ImageUrl);
        }

        private void BindControlToEntity(Entities.News news)
        {
            news.Title = ucNews.tbTitle.Text.Trim();
            news.SubContent = ucNews.tbSubcontent.Text.Trim();
            news.Contents = ucNews.radContent.Content;
            news.ImageUrl = Filename;

            var postedFile = ucNews.uploadFile.PostedFile;
            if (postedFile == null || postedFile.ContentLength <= 0) return;
            if (string.IsNullOrEmpty(Filename) || (!string.IsNullOrEmpty(Filename) && !Filename.Equals(postedFile.FileName)))
            {
                var fileName = string.Format("{0}-{1}", DateTime.Now.ToString("yyyyMMddHHmmss"),
                                             postedFile.FileName.Replace(' ', '-').Replace('_', '-'));
                postedFile.SaveAs(Server.MapPath(string.Format("{0}{1}", Path, fileName)));
                news.ImageUrl = fileName;    
            }
        }
    }
}