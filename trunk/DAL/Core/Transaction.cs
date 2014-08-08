using System;
using System.Data.SqlClient;

namespace DAL.Core
{
    public class Transaction
    {
        public SqlTransaction SqlTransaction { get; private set; }

        public static Transaction Begin()
        {
            var transaction = new Transaction();
            SqlConnection sqlConnection = Connection.Instance.Open();
            transaction.SqlTransaction = sqlConnection.BeginTransaction();
            return transaction;
        }

        public void CommitAndDispose()
        {
            try
            {
                SqlTransaction.Commit();
            }
            catch (Exception)
            {
                SqlTransaction.Rollback();
                throw;
            }
            finally
            {
                Close();
            }
        }

        private void Close()
        {
            if (SqlTransaction == null)
            {
                return;
            }
            SqlTransaction.Dispose();

            SqlTransaction = null;
        }

        public void RollbackAndDispose()
        {
            if (SqlTransaction == null)
            {
                return;
            }
            SqlTransaction.Rollback();
            SqlTransaction.Dispose();

            SqlTransaction = null;
        }
    }
}