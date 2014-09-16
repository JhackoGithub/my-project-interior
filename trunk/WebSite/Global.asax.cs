using System;
using System.Web;
using System.Web.Routing;
using WebSite.App_Start;

namespace WebSite
{
    public class Global : HttpApplication
    {
        private void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteTable.Routes.Ignore("{*dialogs}", new {dialogs = @".*Telerik\.Web\.UI\.DialogHandler\.aspx.*"});
            RouteTable.Routes.Ignore("{*allaxd}", new {allaxd = @".*\.axd(/.*)?"});

            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            //RouteTable.Routes.GetRouteData(new HttpContextWrapper(HttpContext.Current));
        }

        private void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        private void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }
    }
}