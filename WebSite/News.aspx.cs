using System;
using System.Text;
using BLL;

namespace WebSite
{
    public partial class News : System.Web.UI.Page
    {
        private int Id
        {
            get { return Request.QueryString["id"] == null ? 0 : Convert.ToInt32(Request.QueryString["id"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            BindEntityToControl();
            BindNewsRelative();
        }

        private void BindEntityToControl()
        {
            var newsBo = new NewsBO();
            if (Id == 0)
            {
                pnlTopNews.Visible = true;
                pnlDetails.Visible = false;
                var news = newsBo.GetTopNews(5);
                rptTopNews.DataSource = news;
                rptTopNews.DataBind();
            }
            else
            {
                pnlTopNews.Visible = false;
                pnlDetails.Visible = true;
                var news = newsBo.GetNewsById(Id);
                lbTitle.Text = news.Title;
                ltSubContent.Text = news.SubContent;
                ltContents.Text = news.Contents;
            }
        }

        private void BindNewsRelative()
        {
            var newsBo = new NewsBO();
            var news = newsBo.GetNews();
            var htmlNews = new StringBuilder();
            foreach (var newse in news)
            {
                htmlNews.Append("<li><span>");
                htmlNews.AppendFormat("<a href='/News.aspx?type=2&id={0}'>{1}</a>",newse.Id, newse.Title);
                htmlNews.Append("</li></span>");
            }
            ltNewRelative.Text = htmlNews.ToString();
        }
    }
}