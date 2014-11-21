using System;
using System.Configuration;

namespace WebSite.Common
{
    public class AppConfig
    {
        private static AppConfig _instance;

        public static AppConfig Instance
        {
            get { return _instance ?? (_instance = new AppConfig()); }
        }

        private AppConfig()
        {
            //ServiceUri = GetAppConfig("ServiceUri");
            SmtpServer = GetAppConfig("SmtpServer");
            SmtpPort = Int32.Parse(GetAppConfig("SmtpPort"));
            //Email = GetAppConfig("Email");
            //Password = GetAppConfig("Password");
            //UploadDirectory = GetAppConfig("UploadDirectory");
        }

        //public string ServiceUri { get; private set; }
        public string SmtpServer { get; private set; }
        public int SmtpPort { get; private set; }
        //public string Email { get; private set; }
        //public string Password { get; private set; }
        //public string UploadDirectory { get; private set; }

        public static string GetAppConfig(string name)
        {
            return ConfigurationManager.AppSettings.Get(name);
        }
    }
}