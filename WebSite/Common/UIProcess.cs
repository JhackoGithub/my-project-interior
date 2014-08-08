using System.Web;

namespace WebSite.Common
{
    public class UIProcess
    {
        private static string GetFullPath(bool isFullPath, string url, string query)
        {
            return isFullPath
                       ? "http://" + HttpContext.Current.Request.Url.Authority + url + query
                       : url + query;
        }

        public static string GetLoginLink(string query, bool isFullPath = false)
        {
            return GetFullPath(isFullPath, "/Login.aspx", query);
        }

        public static string GetDefaultLink(string query, bool isFullPath = false)
        {
            return GetFullPath(isFullPath, "../Admin/News.aspx", query);
        }
    }
}