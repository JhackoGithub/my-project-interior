using System;
using System.Web.UI;

namespace WebSite
{
    public partial class NestedMasterPage : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master != null) Master.Page.Title = Page.Title;
        }
    }
}