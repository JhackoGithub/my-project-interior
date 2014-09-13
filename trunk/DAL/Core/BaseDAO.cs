using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;

namespace DAL.Core
{
    public class BaseDAO
    {
        private readonly Transaction _transaction;
        private MethodInfo _methodInfo;

        public BaseDAO()
        {
        }

        public BaseDAO(Transaction transaction)
        {
            _transaction = transaction;
        }

        private T ExecuteScalar<T>(SqlCommand sqlCommand)
        {
            try
            {
                SetConnection(sqlCommand);
                object obj = sqlCommand.ExecuteScalar();
                return obj == null ? default(T) : (T) obj;
            }
            catch (Exception)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                CloseConnection(sqlCommand.Connection);
            }
        }

        protected T ExecuteScalar<T>(CommandType commandType, string queryString, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand(queryString) {CommandType = commandType};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteScalar<T>(sqlCommand);
        }

        protected T ExecuteScalar<T>(string storeProcedureName, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand(storeProcedureName) {CommandType = CommandType.StoredProcedure};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteScalar<T>(sqlCommand);
        }

        private int ExecuteCommand(SqlCommand sqlCommand)
        {
            try
            {
                SetConnection(sqlCommand);

                return sqlCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                CloseConnection(sqlCommand.Connection);
            }
        }

        protected int ExecuteCommand(CommandType commandType, string queryString, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand(queryString) {CommandType = commandType};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteCommand(sqlCommand);
        }

        protected int ExecuteCommand(string storeProcedureName, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand(storeProcedureName) {CommandType = CommandType.StoredProcedure};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteCommand(sqlCommand);
        }

        protected T ExecuteToReturnValue<T>(CommandType commandType, string queryString,
                                            params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand(queryString) {CommandType = commandType};
            var returnValue = new SqlParameter
                                  {ParameterName = "@ReturnValue", Direction = ParameterDirection.ReturnValue};
            sqlCommand.Parameters.Add(returnValue);
            sqlCommand.Parameters.AddRange(parameters);

            ExecuteCommand(sqlCommand);

            return (T) sqlCommand.Parameters["@ReturnValue"].Value;
        }

        protected T ExecuteToReturnValue<T>(string storeProcedureName, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand(storeProcedureName) {CommandType = CommandType.StoredProcedure};
            var returnValue = new SqlParameter
                                  {ParameterName = "@ReturnValue", Direction = ParameterDirection.ReturnValue};
            sqlCommand.Parameters.Add(returnValue);
            sqlCommand.Parameters.AddRange(parameters);

            ExecuteCommand(sqlCommand);

            object res = sqlCommand.Parameters["@ReturnValue"].Value;
            return (T) res;
        }

        private List<T> ExecuteToList<T>(SqlCommand sqlCommand)
        {
            try
            {
                SetConnection(sqlCommand);

                SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.FieldCount == 0)
                {
                    return null;
                }
                var recordList = new List<T>();

                DynamicBuilder<T> builder = DynamicBuilder<T>.CreateBuilder(dataReader);

                while (dataReader.Read())
                {
                    T record = builder.Build(dataReader);
                    recordList.Add(record);
                }
                dataReader.Close();

                return recordList;
            }
            catch (Exception)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                CloseConnection(sqlCommand.Connection);
            }
        }

        private List<T> ExecuteToList<T>(SqlCommand sqlCommand, out int totalRows)
        {
            try
            {
                SetConnection(sqlCommand);
                var returnValue = new SqlParameter { ParameterName = "@TotalRows", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Output };
                sqlCommand.Parameters.Add(returnValue);
                SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.FieldCount == 0)
                {
                    totalRows = 0;
                    return null;
                }
                var recordList = new List<T>();

                DynamicBuilder<T> builder = DynamicBuilder<T>.CreateBuilder(dataReader);

                while (dataReader.Read())
                {
                    T record = builder.Build(dataReader);
                    recordList.Add(record);
                }
                
                dataReader.Close();
                totalRows = (int)sqlCommand.Parameters["@TotalRows"].Value;
                return recordList;
            }
            catch (Exception)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                CloseConnection(sqlCommand.Connection);
            }
        }

        protected List<T> ExecuteToList<T>(CommandType commandType, string queryString, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand {CommandText = queryString, CommandType = commandType};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToList<T>(sqlCommand);
        }

        protected List<T> ExecuteToList<T>(string storeProcedureName, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand
                                 {CommandText = storeProcedureName, CommandType = CommandType.StoredProcedure};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToList<T>(sqlCommand);
        }

        protected List<T> ExecuteToList<T>(string storeProcedureName, out int totalRows, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand { CommandText = storeProcedureName, CommandType = CommandType.StoredProcedure };
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToList<T>(sqlCommand, out totalRows);
        }

        public static object GetData<T>(IDataReader dataReader, bool isGenericType)
        {
            DynamicBuilder<T> builder = DynamicBuilder<T>.CreateBuilder(dataReader);
            if (!isGenericType)
            {
                return dataReader.Read() ? builder.Build(dataReader) : default(T);
            }

            var res = new List<T>();

            while (dataReader.Read())
            {
                T record = builder.Build(dataReader);
                res.Add(record);
            }
            return res;
        }

        private MethodInfo GetDataMethod()
        {
            if (_methodInfo == null)
            {
                _methodInfo = GetType().GetMethod("GetData",
                                                  BindingFlags.Public | BindingFlags.Static |
                                                  BindingFlags.FlattenHierarchy);
            }
            return _methodInfo;
        }

        private List<object> ExecuteToMultiObject(IList<Type> types, SqlCommand sqlCommand)
        {
            try
            {
                SetConnection(sqlCommand);

                SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.FieldCount == 0)
                {
                    return null;
                }

                var res = new List<object>();
                int i = 0;
                MethodInfo method = GetDataMethod();
                do
                {
                    bool isGenericType = types[i].IsGenericType;
                    var reader = new object[] {dataReader, isGenericType};
                    Type type = isGenericType
                                    ? types[i].GetGenericArguments()[0]
                                    : types[i];
                    MethodInfo generic = method.MakeGenericMethod(type);

                    res.Add(generic.Invoke(this, reader));
                    i++;
                } while (i < types.Count && dataReader.NextResult());

                dataReader.Close();

                return res;
            }
            catch (Exception)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                CloseConnection(sqlCommand.Connection);
            }
        }

        public List<object> ExecuteToMultiObject(Type[] types, CommandType commandType, string queryString,
                                                 params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand {CommandText = queryString, CommandType = commandType};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToMultiObject(types, sqlCommand);
        }

        public List<object> ExecuteToMultiObject(Type[] types, string storeProcedureName,
                                                 params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand
                                 {CommandText = storeProcedureName, CommandType = CommandType.StoredProcedure};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToMultiObject(types, sqlCommand);
        }

        private T ExecuteToSingleOrDefault<T>(SqlCommand sqlCommand)
        {
            SqlDataReader dataReader = null;
            try
            {
                SetConnection(sqlCommand);

                dataReader = sqlCommand.ExecuteReader();

                DynamicBuilder<T> builder = DynamicBuilder<T>.CreateBuilder(dataReader);

                return dataReader.Read() ? builder.Build(dataReader) : default(T);
            }
            catch (Exception)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                if (dataReader != null)
                {
                    dataReader.Close();
                }
                CloseConnection(sqlCommand.Connection);
            }
        }

        protected T ExecuteToSingleOrDefault<T>(CommandType commandType, string queryString,
                                                params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand {CommandText = queryString, CommandType = commandType};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToSingleOrDefault<T>(sqlCommand);
        }

        protected T ExecuteToSingleOrDefault<T>(string storeProcedureName, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand
                                 {CommandText = storeProcedureName, CommandType = CommandType.StoredProcedure};
            sqlCommand.Parameters.AddRange(parameters);

            return ExecuteToSingleOrDefault<T>(sqlCommand);
        }

        private DataTable ExecuteToDataTable(SqlCommand sqlCommand)
        {
            try
            {
                SetConnection(sqlCommand);

                var myDataAdapter = new SqlDataAdapter(sqlCommand);
                var myDataSet = new DataSet();
                myDataAdapter.Fill(myDataSet);
                return myDataSet.Tables[0];
            }
            catch (SqlException)
            {
                AutoRollbackTransaction();
                throw;
            }
            finally
            {
                CloseConnection(sqlCommand.Connection);
            }
        }

        protected DataTable ExecuteToDataTable(CommandType commandType, string queryString,
                                               params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand {CommandText = queryString, CommandType = commandType};

            sqlCommand.Parameters.AddRange(parameters);
            return ExecuteToDataTable(sqlCommand);
        }

        protected DataTable ExecuteToDataTable(string storeProcedureName, params SqlParameter[] parameters)
        {
            FixParameterNullValue(parameters);

            var sqlCommand = new SqlCommand
                                 {CommandText = storeProcedureName, CommandType = CommandType.StoredProcedure};

            sqlCommand.Parameters.AddRange(parameters);
            return ExecuteToDataTable(sqlCommand);
        }

        private void SetConnection(SqlCommand sqlCommand)
        {
            if (_transaction == null || _transaction.SqlTransaction == null)
            {
                sqlCommand.Connection = Connection.Instance.Open();
            }
            else
            {
                sqlCommand.Connection = _transaction.SqlTransaction.Connection;
                sqlCommand.Transaction = _transaction.SqlTransaction;
            }
        }

        private void CloseConnection(IDbConnection sqlConnection)
        {
            if ((_transaction == null || _transaction.SqlTransaction == null)
                && sqlConnection != null && sqlConnection.State == ConnectionState.Open)
            {
                sqlConnection.Close();
            }
        }

        private void AutoRollbackTransaction()
        {
            if (_transaction == null)
            {
                return;
            }

            _transaction.RollbackAndDispose();
        }

        private static void FixParameterNullValue(ICollection<SqlParameter> sqlParameters)
        {
            if (sqlParameters.Count == 0)
            {
                return;
            }
            IEnumerable<SqlParameter> query = sqlParameters
                .Where(par => par.Value == null);
            foreach (SqlParameter par in query)
            {
                par.Value = DBNull.Value;
            }
        }
    }
}