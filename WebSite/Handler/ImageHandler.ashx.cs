using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using WebSite.Common;

namespace WebSite.Handler
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : BaseHandler
    {
        protected override void ProcessMainRequest(HttpContext context)
        {
            var jsonString = string.Empty;
            context.Response.ContentType = "text/plain";
            var action = context.Request.QueryString["funcname"].ToLower();
            switch (action)
            {
                case "select":
                    var folder = Utils.ConvertDeserialize<string>(context, ref jsonString);
                    jsonString = BindImageByFolder(folder);
                    break;
            }
            context.Response.Write(jsonString);
        }

        private string BindImageByFolder(string folder)
        {
            string path = string.Format(@"\Images\projects{0}\", folder);
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                return string.Empty;
            var dirInfo = new DirectoryInfo(HttpContext.Current.Server.MapPath(path));
            var images = new StringBuilder();
            foreach (FileInfo fileInfo in dirInfo.GetFiles())
            {
                if (fileInfo.Name.Equals("project-view.jpg") || fileInfo.Name.Equals("project-main.jpg"))
                    continue;
                var pathImage = string.Format("{0}{1}", path, fileInfo.Name);
                images.Append("<div>");
                images.AppendFormat("<img src='{0}' />", pathImage);
                images.AppendFormat("<input id='rd{0}' type='radio' name='rd' value='rd{1}'><label for='rd{2}'>ảnh đại diện</label>", fileInfo.Name, fileInfo.Name, fileInfo.Name);
                images.Append("</div>");
            }
            var json = new
                           {
                               html = images.ToString()
                           };
            var res = Utils.ConvertToJsonString(json);
            return res;
        }
    }
}