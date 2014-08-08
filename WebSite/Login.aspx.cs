using System;
using WebSite.Common;
using WebSite.Core;

namespace WebSite
{
    public partial class Login : BasePage
    {
        private const string USER_NAME = "vinh";
        private const string USER_PASSWORD = "123456";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if (CurrentUser == null)
                return;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (UserName.Text.Trim().Equals(USER_NAME) && Password.Text.Trim().Equals(USER_PASSWORD))
            {
                CurrentUser = USER_NAME;
                if (!string.IsNullOrEmpty(Request.QueryString["redirect"]))
                {
                    Response.Redirect((Request.QueryString["redirect"]), false);
                    return;
                }
                Response.Redirect(UIProcess.GetDefaultLink(string.Empty), false);
            }
        }
    }
}