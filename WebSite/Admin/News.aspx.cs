using System;
using System.Collections.Generic;
using BLL;
using Telerik.Web.UI;
using WebSite.Core;

namespace WebSite.Admin
{
    public partial class News : AuthenPage
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
            List<Entities.News> res = newsBo.GetNews();
            return res;
        }

        protected void rgNews_ItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    int id = int.Parse(e.CommandArgument.ToString());
                    var newsBo = new NewsBO();
                    int res = newsBo.DeleteNews(id);
                    string msg = string.Format("Xóa bản tin {0}", res > 0 ? "thành công" : "bị lỗi");
                    ltScript.Text = string.Format("<script>alert('{0}');</script>", msg);
                    break;
            }
        }
    }
}