using System;
using System.Text;
using System.Web.UI;

namespace WebSite.UserControls
{
    public partial class MenuTop : UserControl
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
                return;
            GenerateMenu();
        }

        private void GenerateMenu()
        {
            var menu = new StringBuilder();
            menu.Append("<ul>");
            menu.AppendFormat(Type == 0
                                  ? "<li><a id='menu-tab-1' href='Project.aspx?type={0}&tab=1'>Công trình</a></li>"
                                  : "<li style='width:78px;'><a id='menu-tab-1' href='Project.aspx?type={0}&tab=1'>Nội thất</a></li>",
                              Type);
            menu.AppendFormat("<li><a id='menu-tab-2' href='Consultant.aspx?type={0}&tab=2&id=0'>Tư vấn</a></li>", Type);
            menu.AppendFormat("<li><a id='menu-tab-3' href='Refer.aspx?type={0}&tab=3'>Tham khảo</a></li>", Type);
            menu.AppendFormat("<li><a id='menu-tab-4' href='Question.aspx?type={0}&tab=4'>Hỏi đáp</a></li>", Type);
            menu.Append("</ul>");
            ltMenuLeft.Text = menu.ToString();
        }
    }
}