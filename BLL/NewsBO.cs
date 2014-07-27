using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entities;

namespace BLL
{
    public class NewsBO
    {
        public List<News> GetNews()
        {
            var dao = new NewsDAO();
            var res = dao.GetNews();
            return res;
        }

        public List<News> GetTopNews(int top)
        {
            var dao = new NewsDAO();
            var res = dao.GetTopNews(top);
            return res;
        }

        public News GetNewsById(int id)
        {
            var dao = new NewsDAO();
            var res = dao.GetNewsById(id);
            return res;
        }

        public int AddNews(News news)
        {
            var dao = new NewsDAO();
            var datetime = DateTime.Now;
            news.CreatedOn = news.CreatedOn = datetime;
            dao.AddNews(news);
            return news.Id;
        }

        public int UpdateNews(News news)
        {
            var dao = new NewsDAO();
            var datetime = DateTime.Now;
            news.ChangedOn = datetime;
            var res = dao.UpdateNews(news);
            return res;
        }

        public int DeleteNews(int id)
        {
            var dao = new NewsDAO();
            var res = dao.DeleteNews(id, DateTime.Now);
            return res;
        }
    }
}
