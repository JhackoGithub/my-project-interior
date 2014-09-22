using System.Web.Routing;

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
            routes.Ignore("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });
            routes.Ignore("{file}.png");
            routes.Ignore("{file}.jpg");
            routes.MapPageRoute("admin", "admin-login/", "~/Login.aspx");

            routes.MapPageRoute("home", "", "~/Default.aspx", true);
            
            routes.MapPageRoute("architectural", "kien-truc/cong-trinh-kien-truc/{type}/{tab}", "~/Project.aspx", true, new RouteValueDictionary { { "type", 0 }, { "tab", 1 } });
            routes.MapPageRoute("architecturalcate", "kien-truc/cong-trinh-kien-truc/{type}/{tab}/{cate}", "~/Project.aspx", true, new RouteValueDictionary { { "type", 0 }, { "tab", 1 } });
            routes.MapPageRoute("interior", "noi-that/cong-trinh-noi-that/{type}/{tab}", "~/Project.aspx", true, new RouteValueDictionary { { "type", 1 }, { "tab", 1 } });
            routes.MapPageRoute("interiorcate", "noi-that/cong-trinh-noi-that/{type}/{tab}/{cate}", "~/Project.aspx", true, new RouteValueDictionary { { "type", 1 }, { "tab", 1 } });
            
            routes.MapPageRoute("new", "tin-tuc/{type}/{id}", "~/News.aspx", true, new RouteValueDictionary { { "type", 2 }, { "id", 0 } });
            routes.MapPageRoute("contact", "lien-he/{type}/{tab}/{id}", "~/Contact.aspx", true, new RouteValueDictionary { { "type", 4 }, { "tab", 0 } });
            routes.MapPageRoute("contactmap", "lien-he/dia-diem-cong-ty/{type}/{tab}/{name}", "~/Contact.aspx", true, new RouteValueDictionary { { "type", 4 }, { "tab", 0 }, { "name", 0 } });
            routes.MapPageRoute("contactinvestigate", "lien-he/phieu-dieu-tra/{type}/{tab}/{name}", "~/Contact.aspx", true, new RouteValueDictionary { { "type", 4 }, { "tab", 0 }, { "name", 1 } });
            routes.MapPageRoute("consultant", "tu-van/{name}/{type}/{tab}/{id}", "~/Consultant.aspx", true);
            routes.MapPageRoute("refer", "tham-khao/{name}/{type}/{tab}", "~/Refer.aspx", true);
            routes.MapPageRoute("question", "hoi-dap/{type}/{tab}", "~/Question.aspx", true);

            routes.MapPageRoute("details", "du-an/{type}/{tab}/{cate}/{id}", "~/Project-Info.aspx", false, null, new RouteValueDictionary { { "type", "[0-9]*" }, { "tab", "[0-9]*" }, { "cate", "[0-9]*" }, { "id", "[0-9]*" } });

            routes.MapPageRoute("lesson", "kien-thuc-can-thiet-khi-xay-nha/{name}/{type}/{tab}/{id}", "~/Lesson.aspx", false, null, new RouteValueDictionary { { "type", "[0-9]*" }, { "tab", "[0-9]*" }, { "id", "[0-9]*" } });
        }
    }
}