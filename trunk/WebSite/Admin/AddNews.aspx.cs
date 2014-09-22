using System;
using System.Web;
using BLL;
using WebSite.Core;
using NewsBE = Entities.News;

namespace WebSite.Admin
{
    public partial class AddNews : AuthenPage
    {
        private const string Path = "/Images/Uploads/News/";
        public string ImageUrl = "/Images/no-image.png";

        private int Id
        {
            get { return Request.QueryString["id"] == null ? 0 : Convert.ToInt32(Request.QueryString["id"]); }
        }

        private string Filename
        {
            get { return (string) ViewState["FILE_NAME"]; }
            set { ViewState["FILE_NAME"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if (Id > 0)
            {
                BindEntityToControl();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var news = new NewsBE();
            BindControlToEntity(news);
            if (string.IsNullOrEmpty(news.Contents))
                return;
            var newBo = new NewsBO();
            news.Id = Id;
            int res = Id == 0 ? newBo.AddNews(news) : newBo.UpdateNews(news);
            string confirmMsg =
                string.Format(
                    "<script>confirmDialog('{0} bản tin thành công, bạn trở về trang quản lý bản tin?');</script>",
                    Id == 0 ? "Tạo mới" : "Cập nhật");
            string alertMsg = string.Format("<script>alert('{0} bản tin không thành công');</script>",
                                            Id == 0 ? "Tạo mới" : "Cập nhật");
            ltScript.Text = string.Format("{0}", res > 0 ? confirmMsg : alertMsg);
        }

        private void BindEntityToControl()
        {
            var newsBo = new NewsBO();
            NewsBE news = newsBo.GetNewsById(Id);
            hdfNewKind.Value = news.Type.ToString();
            tbTitle.Text = news.Title;
            tbSubcontent.Text = news.SubContent;
            radContent.Content = news.Contents;
            ltScript.Text = string.Format("<script>newsKindClick('{0}')</script>", news.Type);
            if (string.IsNullOrEmpty(news.ImageUrl)) return;
            Filename = news.ImageUrl;
            ImageUrl = string.Format("{0}{1}", Path, news.ImageUrl);
        }

        private void BindControlToEntity(NewsBE news)
        {
            news.Type = int.Parse(hdfNewKind.Value);
            news.Title = tbTitle.Text.Trim();
            news.Contents = radContent.Content;
            if (news.Type != 0)
            {
                return;
            }
            news.SubContent = tbSubcontent.Text.Trim();
            news.ImageUrl = Filename;
            HttpPostedFile postedFile = uploadFile.PostedFile;
            if (postedFile == null || postedFile.ContentLength <= 0) return;
            if (string.IsNullOrEmpty(Filename) ||
                (!string.IsNullOrEmpty(Filename) && !Filename.Equals(postedFile.FileName)))
            {
                string fileName = string.Format("{0}-{1}", DateTime.Now.ToString("yyyyMMddHHmmss"),
                                                postedFile.FileName.Replace(' ', '-').Replace('_', '-'));
                postedFile.SaveAs(Server.MapPath(string.Format("{0}{1}", Path, fileName)));
                news.ImageUrl = fileName;
            }
        }
    }
}