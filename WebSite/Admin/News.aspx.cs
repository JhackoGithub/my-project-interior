using System;
using System.Collections.Generic;
using System.Web.UI;
using BLL;


namespace WebSite.Admin
{
    public partial class News : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rgNews_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            var news = GetNews();
            rgNews.DataSource = news;
        }

        private List<Entities.News> GetNews()
        {
            var newsBo = new NewsBO();
            var res = newsBo.GetNews();
            return res;
        }

        protected void rgNews_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    var id = int.Parse(e.CommandArgument.ToString());
                    var newsBo = new NewsBO();
                    var res = newsBo.DeleteNews(id);
                    var msg = string.Format("Xóa bản tin {0}", res > 0 ? "thành công" : "bị lỗi");
                    ltScript.Text = string.Format("<script>alert('{0}');</script>", msg);
                    break;
            }
        }
    }
}