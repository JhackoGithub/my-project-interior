using System;
using System.Web.UI;

namespace WebSite
{
    public partial class Lesson : Page
    {
        private int LessonId
        {
            get { return Page.RouteData.Values["id"] == null ? 0 : Convert.ToInt32(Page.RouteData.Values["id"]); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SetVisibleLesson();
        }

        private void SetVisibleLesson()
        {
            switch (LessonId)
            {
                case 2:
                    Panel2.Visible = true;
                    break;
                case 3:
                    Panel3.Visible = true;
                    break;
                case 4:
                    Panel4.Visible = true;
                    break;
                case 5:
                    Panel5.Visible = true;
                    break;
                case 6:
                    Panel6.Visible = true;
                    break;
                case 7:
                    Panel7.Visible = true;
                    break;
                case 8:
                    Panel8.Visible = true;
                    break;
                default:
                    Panel1.Visible = true;
                    break;
            }
        }
    }
}