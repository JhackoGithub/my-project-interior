using System;
using System.Web.UI;
using WebSite.Common;

namespace WebSite
{
    public partial class Refer : Page
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : int.Parse(Request.QueryString["type"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master != null)
                Master.Page.Title = Type == 0 ? Constant.PROJECT_ARCHITECTURE : Constant.PROJECT_INTERIOR;
        }
    }
}