using System;
using System.Web;
using WebSite.Common;

namespace WebSite.Core
{
    public class AuthenPage : BasePage
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (CurrentUser == null)
            {
                Response.Redirect(UIProcess.GetLoginLink("?redirect=" + url));
                return;
            }
        }
    }
}