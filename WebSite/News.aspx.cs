using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using BLL;

namespace WebSite
{
    public partial class News : Page
    {
        private int Id
        {
            get { return Page.RouteData.Values["id"] == null ? 0 : int.Parse(Page.RouteData.Values["id"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.Title = "tin-tuc";
            if (IsPostBack)
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
                List<Entities.News> news = newsBo.GetTopNews(5);
                rptTopNews.DataSource = news;
                rptTopNews.DataBind();
            }
            else
            {
                pnlTopNews.Visible = false;
                pnlDetails.Visible = true;
                Entities.News news = newsBo.GetNewsById(Id);
                lbTitle.Text = news.Title;
                ltSubContent.Text = news.SubContent;
                ltContents.Text = news.Contents;
            }
        }

        private void BindNewsRelative()
        {
            var newsBo = new NewsBO();
            List<Entities.News> news = newsBo.GetNewsByType(0);
            var htmlNews = new StringBuilder();
            foreach (Entities.News newse in news.OrderByDescending(t => t.CreatedOn))
            {
                htmlNews.Append("<li><span>");
                htmlNews.AppendFormat("<a href='/tin-tuc/2/{0}'>{1}</a>", newse.Id, newse.Title);
                htmlNews.Append("</li></span>");
            }
            ltNewRelative.Text = htmlNews.ToString();
        }
    }
}