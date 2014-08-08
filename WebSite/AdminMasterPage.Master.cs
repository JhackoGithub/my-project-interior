using System;
using System.Web.UI;
using WebSite.Common;

namespace WebSite
{
    public partial class AdminMasterPage : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (string) Session["CurrentUser"];
            if (user == null)
            {
                login.Visible = false;
                return;
            }
            ltUserName.Text = string.Format("Hello, {0}", user);
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["CurrentUser"] = null;
            Response.Redirect(UIProcess.GetLoginLink(""), true);
        }
    }
}