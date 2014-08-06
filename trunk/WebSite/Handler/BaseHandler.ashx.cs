using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace WebSite.Handler
{
    /// <summary>
    /// Summary description for BaseHandler
    /// </summary>
    public abstract class BaseHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            ProcessMainRequest(context);
        }

        protected abstract void ProcessMainRequest(HttpContext context);

        public bool IsReusable
        {
            get { return false; }
        }
    }
}