using System;
using System.Collections.Generic;
using System.Web.UI;
using BLL;
using Telerik.Web.UI;

namespace WebSite.Contents
{
    public partial class NewsCollection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void rgNews_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            List<Entities.News> news = GetNews();
            rgNews.DataSource = news;
        }

        private List<Entities.News> GetNews()
        {
            var newsBo = new NewsBO();
            List<Entities.News> res = newsBo.GetNewsByType(1);
            return res;
        }
    }
}