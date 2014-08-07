using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
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