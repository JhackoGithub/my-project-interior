using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace WebSite.Common
{
    public static class Utils
    {
        public static string ConvertToJsonString(object obj)
        {
            var result = JsonConvert.SerializeObject(obj);
            return result;
        }

        public static T ConvertDeserialize<T>(HttpContext context, ref string jsonString)
        {
            context.Request.InputStream.Position = 0;

            using (var inputStream = new StreamReader(context.Request.InputStream))
            {
                jsonString = inputStream.ReadToEnd();
            }
            var region = JsonConvert.DeserializeObject<T>(jsonString);

            return region;
        }

        public static T ConvertDeserialize<T>(HttpContext context)
        {
            context.Request.InputStream.Position = 0;

            using (var inputStream = new StreamReader(context.Request.InputStream))
            {
                return JsonConvert.DeserializeObject<T>(inputStream.ReadToEnd());
            }
        }

        public static T ConvertDeserializeEntity<T>(string value)
        {
            return JsonConvert.DeserializeObject<T>(value);
        }
    }
}