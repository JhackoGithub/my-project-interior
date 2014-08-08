using System;
using WebSite.Core;

namespace WebSite.Admin
{
    public partial class AddProject : AuthenPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }
    }
}