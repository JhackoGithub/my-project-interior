using System;
using System.Text;

namespace WebSite.UserControls
{
    public partial class MenuSubTop : System.Web.UI.UserControl
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            GenerateMenuTab();
        }

        private void GenerateMenuTab()
        {
            var projectId = Request.QueryString["project"] != null
                ? string.Format("&project={0}", Request.QueryString["project"]) : string.Empty;
            var menu = new StringBuilder();
            menu.AppendFormat("<li id='subtab-1'><a href='../1product-info.aspx?type={0}&tab=1&subtab=1{1}'>Thông tin</a></li>", Type, projectId);
            menu.AppendFormat("<li id='subtab-2'><a href='../1product-doc.aspx?type={0}&tab=1&subtab=2{1}'>Hồ sơ thiết kế</a></li>", Type, projectId);
            menu.AppendFormat("<li id='subtab-3'><a href='../1product-desc.aspx?type={0}&tab=1&subtab=3{1}'>Thuyết minh</a></li>", Type, projectId);
            ltSubtab.Text = menu.ToString();
        }
    }
}