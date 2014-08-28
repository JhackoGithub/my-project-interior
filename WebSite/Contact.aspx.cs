using System;
using System.Web.UI;
using BLL;

namespace WebSite
{
    public partial class Contact : Page
    {
        private int Id
        {
            get { return Request.QueryString["id"] == null ? 0 : Convert.ToInt32(Request.QueryString["id"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if(Id == 0)
                return;
            BindContent();
        }

        private void BindContent()
        {
            var bo = new NewsBO();
            var res = bo.GetNewsById(Id);
            ltContents.Text = res.Contents ?? string.Empty;
        }
    }
}