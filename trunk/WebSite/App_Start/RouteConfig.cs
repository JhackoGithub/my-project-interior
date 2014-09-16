using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace WebSite.App_Start
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.EnableFriendlyUrls();
            routes.RouteExistingFiles = false;
            routes.Ignore("{resource}.axd/{*pathInfo}");
            routes.Ignore("{resource}.css/{*pathInfo}");
            routes.Ignore("{resource}.js/{*pathInfo}");

            routes.Ignore("{file}.png");
            routes.Ignore("{file}.jpg");
            routes.MapPageRoute("admin", "admin-login/", "~/Login.aspx");

            routes.MapPageRoute("home", "", "~/Default.aspx", true);
            routes.MapPageRoute("architectural", "architectural-building/{type}/{tab}", "~/Project.aspx", true, new RouteValueDictionary { { "type", 0 }, { "tab", 1 } });
            routes.MapPageRoute("interior", "interior-building/{type}/{tab}", "~/Project.aspx", true, new RouteValueDictionary { { "type", 1 }, { "tab", 1 } });
            routes.MapPageRoute("new", "new/{type}", "~/News.aspx", true, new RouteValueDictionary {{"type", 2}});
            routes.MapPageRoute("contact", "contact/{type}/{id}", "~/Contact.aspx", true, new RouteValueDictionary { { "type", 4 }, { "tab", 0 } });
            routes.MapPageRoute("details", "project-info/{type}/{tab}/{cate}/{id}", "~/Project-Info.aspx", false, null, new RouteValueDictionary { { "type", "[0-9]*" }, { "tab", "[0-9]*" }, { "cate", "[0-9]*" }, { "id", "[0-9]*" } });
            
        }
    }
}