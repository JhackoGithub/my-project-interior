using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using Newtonsoft.Json;

namespace WebSite.Common
{
    public static class Utils
    {
        public static string ConvertToJsonString(object obj)
        {
            string result = JsonConvert.SerializeObject(obj);
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


        public static bool SendEmail(string body, bool isBodyHtml, Byte[] bytes, string fileName)
        {
            var webConfig = AppConfig.Instance;
            var smtp = new SmtpClient(AppConfig.Instance.SmtpServer, AppConfig.Instance.SmtpPort)
                           {
                               EnableSsl = true,
                               DeliveryMethod = SmtpDeliveryMethod.Network,
                               UseDefaultCredentials = false,
                               Credentials = new NetworkCredential("mai.quang.minh@kloon.vn", "gauiubebong"),
                               Port = webConfig.SmtpPort
                           };

            using (var mm = new MailMessage())
            {
                mm.From = new MailAddress("noithatvietam@gmail.com");
                mm.Subject = "Phiếu đánh giá ";
                mm.Body = body ?? string.Empty;
                mm.IsBodyHtml = isBodyHtml;
                mm.CC.Add("quangminh84@gmail.com");
                mm.To.Add("noithatvietam@gmail.com");
                if (bytes.Length > 0)
                {
                    mm.Attachments.Add(new Attachment(new MemoryStream(bytes), fileName));
                }

                try
                {
                    ServicePointManager.ServerCertificateValidationCallback =
                        delegate { return true; };
                    smtp.Send(mm);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
    }

    public class Constant
    {
        public const string PROJECT_ARCHITECTURE = "Kiến trúc";
        public const string PROJECT_INTERIOR = "Nội thất";
        public const string NEWS = "Tin tức";
        public const string CONSULTANT = "Tư vấn";
        public const string CONTACT = "Liên hệ";
    }
}