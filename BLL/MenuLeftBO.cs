using System;
using System.Collections.Generic;
using DAL;
using Entities;

namespace BLL
{
    public class MenuLeftBO
    {
        public List<MenuLeft> GetMenuLeft(int type)
        {
            var dao = new MenuLeftDAO();
            var res = dao.GetMenuLefs(type);
            return res;
        }

        public MenuLeft GetMenuLeftById(int id, int type)
        {
            var dao = new MenuLeftDAO();
            var res = dao.GetMenuLefById(id, type);
            return res;
        }

        public int AddMenuLef(MenuLeft news)
        {
            var dao = new MenuLeftDAO();
            var datetime = DateTime.Now;
            news.CreatedOn = news.CreatedOn = datetime;
            dao.AddMenuLef(news);
            return news.Id;
        }

        public int UpdateMenuLef(MenuLeft news)
        {
            var dao = new MenuLeftDAO();
            var datetime = DateTime.Now;
            news.ChangedOn = datetime;
            var res = dao.UpdateMenuLef(news);
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
