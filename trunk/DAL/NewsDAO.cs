using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DAL.Core;
using Entities;

namespace DAL
{
    public class NewsDAO : BaseDAO
    {
        public NewsDAO()
        {
        }

        public NewsDAO(Transaction transaction) : base(transaction)
        {
        }

        public List<News> GetNews()
        {
            List<News> res = ExecuteToList<News>("News_GetAll");
            return res;
        }

        public List<News> GetTopNews(int top)
        {
            var paramSql = new SqlParameter("@Top", top);
            List<News> res = ExecuteToList<News>("News_GetTop", paramSql);
            return res;
        }

        public News GetNewsById(int id)
        {
            var paramSql = new SqlParameter("@Id", id);
            var res = ExecuteToSingleOrDefault<News>("News_GetById", paramSql);
            return res;
        }

        public void AddNews(News news)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Title", news.Title),
                                    new SqlParameter("@SubContent", news.SubContent),
                                    new SqlParameter("@ImageUrl", news.ImageUrl),
                                    new SqlParameter("@Contents", news.Contents),
                                    new SqlParameter("@CreatedOn", news.CreatedOn)
                                };

            news.Id = ExecuteToSingleOrDefault<int>("News_Insert", paramArrs);
        }

        public int UpdateNews(News news)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Id", news.Id),
                                    new SqlParameter("@Title", news.Title),
                                    new SqlParameter("@SubContent", news.SubContent),
                                    new SqlParameter("@ImageUrl", news.ImageUrl),
                                    new SqlParameter("@Contents", news.Contents),
                                    new SqlParameter("@ChangedOn", news.ChangedOn)
                                };

            int retVal = ExecuteCommand("News_Update", paramArrs);
            return retVal;
        }

        public int DeleteNews(int id, DateTime deletedOn)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Id", id),
                                    new SqlParameter("@DeletedOn", deletedOn)
                                };

            int retVal = ExecuteCommand("News_Delete", paramArrs);
            return retVal;
        }
    }
}