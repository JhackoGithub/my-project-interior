using System.Configuration;

namespace DAL.Core
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
            BiobanxConnectionString = GetConnectionString("ConnectionString");
        }

        public string BiobanxConnectionString { get; private set; }

        //private static string GetAppConfig(string name)
        //{
        //    return ConfigurationManager.AppSettings.Get(name);
        //}

        private static string GetConnectionString(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
