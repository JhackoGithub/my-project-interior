using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DAL.Core;
using Entities;

namespace DAL
{
    public class MenuLeftDAO : BaseDAO
    {
        public MenuLeftDAO(){}

        public MenuLeftDAO(Transaction transaction) : base(transaction) { }

        public List<MenuLeft> GetMenuLefs()
        {
            var res = ExecuteToList<MenuLeft>("MenuLeft_GetAll");
            return res;
        }

        public MenuLeft GetMenuLefById(int id)
        {
            var paramSql = new SqlParameter("@Id", id);
            var res = ExecuteToSingleOrDefault<MenuLeft>("MenuLeft_GetById", paramSql);
            return res;
        }

        public void AddMenuLef(MenuLeft menuLeft)
        {
            var paramArrs = new[]
            {
                new SqlParameter("@ParentId", menuLeft.ParentId),                  
                new SqlParameter("@Position", menuLeft.Position),
                new SqlParameter("@Name", menuLeft.Name),
                new SqlParameter("@CreatedOn", menuLeft.CreatedOn)
            };

            menuLeft.Id = ExecuteToSingleOrDefault<int>("MenuLeft_Insert", paramArrs);
        }

        public int UpdateMenuLef(MenuLeft menuLeft)
        {
            var paramArrs = new[]
            {
                new SqlParameter("@Id", menuLeft.Id),
                new SqlParameter("@ParentId", menuLeft.ParentId),                  
                new SqlParameter("@Position", menuLeft.Position),
                new SqlParameter("@Name", menuLeft.Name),
                new SqlParameter("@ChangedOn", menuLeft.ChangedOn)
            };

            var retVal = ExecuteCommand("MenuLeft_Update", paramArrs);
            return retVal;
        }

        public int DeleteMenuLef(int id, DateTime deletedOn)
        {
            var paramArrs = new[]
            {
                new SqlParameter("@Id", id),
                new SqlParameter("@DeletedOn", deletedOn)
            };

            var retVal = ExecuteCommand("MenuLeft_Delete", paramArrs);
            return retVal;
        }
    }
}
