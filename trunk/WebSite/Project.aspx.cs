using System;

namespace WebSite
{
    public partial class Project : System.Web.UI.Page
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : int.Parse(Request.QueryString["type"]); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master != null) Master.Page.Title = Type == 0 ? Common.Constant.PROJECT_ARCHITECTURE : Common.Constant.PROJECT_INTERIOR;
        }
    }
}