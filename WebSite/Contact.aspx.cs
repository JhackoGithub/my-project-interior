using System;
using System.Web.UI;
using BLL;

namespace WebSite
{
    public partial class Contact : Page
    {
        private int Id
        {
            get { return Page.RouteData.Values["id"] == null ? 0 : int.Parse(Page.RouteData.Values["id"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if (Id == 0)
                return;
            BindContent();
        }

        private void BindContent()
        {
            var bo = new NewsBO();
            Entities.News res = bo.GetNewsById(Id);
            ltContents.Text = res.Contents ?? string.Empty;
        }
    }
}