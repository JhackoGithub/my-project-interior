using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Telerik.Web.UI;

namespace WebSite.Contents
{
    public partial class NewsCollection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }
        protected void rgNews_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var news = GetNews();
            rgNews.DataSource = news;
        }
        private List<Entities.News> GetNews()
        {
            var newsBo = new NewsBO();
            var res = newsBo.GetNewsByType(1);
            return res;
        }
    }
}