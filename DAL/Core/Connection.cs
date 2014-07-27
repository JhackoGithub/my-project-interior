using System;
using System.Data.SqlClient;
using System.Linq;
using DAL.Core;

namespace DAL.Core
{
    public class Connection
    {
        private static Connection _instance;
        public static Connection Instance
        {
            get
            {
                return _instance ?? (_instance = new Connection());
            }
        }

        private readonly string _connectionString;

        private readonly string _connectionPoolString;

        private readonly string _connectionNoPoolString;

        private Connection()
        {
            _connectionString = AppConfig.Instance.BiobanxConnectionString;

            if (string.IsNullOrEmpty(_connectionString))
            {
                throw new Exception("Connection String can not null");
            }
            var connArrs = _connectionString.Split(';');
            var sTemp = connArrs
                .Where(CheckStartWith)
                .Aggregate(string.Empty, (current, t) => current + (t + ";"));

            _connectionPoolString = sTemp + "Pooling=true;Min Pool Size=5;Max Pool Size=15;Connect Timeout=2;Connection Reset = True;Connection Lifetime = 600;";
            _connectionNoPoolString = sTemp + "Pooling=false;Connect Timeout=45;";
        }

        private static bool CheckStartWith(string str)
        {
            str = str.ToLower();
            return !str.StartsWith("pooling=")
                   && !str.StartsWith("min pool size=")
                   && !str.StartsWith("max pool size=")
                   && !str.StartsWith("connect timeout=")
                   && !str.Equals(string.Empty);
        }

        public SqlConnection Open()
        {
            try
            {
                var sqlConnection = new SqlConnection(_connectionPoolString);
                sqlConnection.Open();
                return sqlConnection;
            }
            catch (Exception)
            {
                var sqlConnection = new SqlConnection(_connectionNoPoolString);
                sqlConnection.Open();
                return sqlConnection;
            }
        }
    }
}
