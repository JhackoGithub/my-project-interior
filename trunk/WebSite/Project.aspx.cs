using System;
using System.Web.UI;
using WebSite.Common;

namespace WebSite
{
    public partial class Project : Page
    {
        private int Type
        {
            get { return Page.RouteData.Values["type"] == null ? 0 : int.Parse(Page.RouteData.Values["type"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.Title = Type == 0 ? Constant.PROJECT_ARCHITECTURE : Constant.PROJECT_INTERIOR;
        }
    }
}