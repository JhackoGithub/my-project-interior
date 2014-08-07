using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSite.Handler
{
    /// <summary>
    /// Summary description for ProjectHandler
    /// </summary>
    public class ProjectHandler : BaseHandler
    {
        protected override void ProcessMainRequest(HttpContext context)
        {
            var jsonString = string.Empty;
            context.Response.ContentType = "text/plain";
            int id = context.Request.QueryString["id"] == null ? 0 : Convert.ToInt32(context.Request.QueryString["id"]);
            var action = context.Request.QueryString["funcname"].ToLower();
            int type = Convert.ToInt32(context.Request.QueryString["type"]);
            switch (action)
            {
                default:
                    break;
            }
        }
    }
}