using System;
using System.Collections.Generic;
using DAL;
using Entities;

namespace BLL
{
    public class NewsBO
    {
        public List<News> GetNews()
        {
            var dao = new NewsDAO();
            List<News> res = dao.GetNews();
            return res;
        }

        public List<News> GetNewsByType(int type)
        {
            var dao = new NewsDAO();
            List<News> res = dao.GetNewsByType(type);
            return res;
        }

        public List<News> GetTopNews(int top)
        {
            var dao = new NewsDAO();
            List<News> res = dao.GetTopNews(top);
            return res;
        }

        public News GetNewsById(int id)
        {
            var dao = new NewsDAO();
            News res = dao.GetNewsById(id);
            return res;
        }

        public int AddNews(News news)
        {
            var dao = new NewsDAO();
            DateTime datetime = DateTime.Now;
            news.CreatedOn = news.CreatedOn = datetime;
            dao.AddNews(news);
            return news.Id;
        }

        public int UpdateNews(News news)
        {
            var dao = new NewsDAO();
            DateTime datetime = DateTime.Now;
            news.ChangedOn = datetime;
            int res = dao.UpdateNews(news);
            return res;
        }

        public int DeleteNews(int id)
        {
            var dao = new NewsDAO();
            int res = dao.DeleteNews(id, DateTime.Now);
            return res;
        }
    }
}