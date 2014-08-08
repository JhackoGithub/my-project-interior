using System.Web.UI;

namespace WebSite.Core
{
    public class BasePage : Page
    {
        public string CurrentUser
        {
            get { return (string) Session["CurrentUser"]; }
            set
            {
                string user = value;
                Session["CurrentUser"] = user;
            }
        }
    }
}