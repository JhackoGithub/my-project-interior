using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Consultant : System.Web.UI.Page
    {
        private int Type
        {
            get { return Request.QueryString["type"] == null ? 0 : Convert.ToInt32(Request.QueryString["type"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateMenuLeft();
        }

        private void GenerateMenuLeft()
        {
            var menu = new StringBuilder();
            menu.Append("<ul>");
            menu.Append("<li class='has-sub'><a href='#'><span>Kiến thức cần thiết khi xây nhà</span></a>");
            menu.Append("<ul>");
            menu.AppendFormat("<li><a href='Consultant-1-1.aspx?type={0}'><span>Kiến thức cần thiết khi xây nhà</span></a></li>", Type);
            menu.AppendFormat("<li><a href='Consultant-1-2.aspx?type={0}'><span>Giá trị thiết kế chuyên nghiệp</span></a></li>", Type);
            menu.AppendFormat("<li class='last'><a href='Consultant-1-3.aspx?type={0}'><span>Quy trình thiết kế</span></a></li>", Type);
            menu.AppendFormat("<li class='last'><a href='Consultant-1-4.aspx?type={0}'><span>Nội dung hồ sơ bản vẽ</span></a></li>", Type);
            menu.Append("</ul>");
            menu.Append("</li>");

            if(Type == 0)
            {
                GenerateMenuArchiture(menu);
            }
            else
            {
                GenerateMenuInterior(menu);
            }
            menu.Append("</ul>");
            ltMenuLeft.Text = menu.ToString();
        }

        private void GenerateMenuArchiture(StringBuilder menu)
        {
            menu.Append("<li class='has-sub'><a href='#'><span>Biệt thự</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nhà lô phố</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
        }
        private void GenerateMenuInterior(StringBuilder menu)
        {
            menu.Append("<li class='has-sub'><a href='#'><span>Nội thât biệt thự</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Interior.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nội thât nhà lô phố</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
            menu.Append("<li class='has-sub'><a href='#'><span>Nội thât chung cư</span></a>");
            menu.Append("<ul>");
            menu.Append("<li><a href='Architecture.aspx'><span>Hiện đại</span></a></li>");
            menu.Append("<li class='last'><a href='commingsoon.aspx'><span>Cổ điển</span></a></li>");
            menu.Append("</ul>");
            menu.Append("</li>");
        }
    }
}
