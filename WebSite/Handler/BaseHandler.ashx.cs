using System.Web;
using System.Web.SessionState;

namespace WebSite.Handler
{
    /// <summary>
    /// Summary description for BaseHandler
    /// </summary>
    public abstract class BaseHandler : IHttpHandler, IRequiresSessionState
    {
        #region IHttpHandler Members

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            ProcessMainRequest(context);
        }

        public bool IsReusable
        {
            get { return false; }
        }

        #endregion

        protected abstract void ProcessMainRequest(HttpContext context);
    }
}