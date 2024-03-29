﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DAL.Core;
using Entities;

namespace DAL
{
    public class MenuLeftDAO : BaseDAO
    {
        public MenuLeftDAO()
        {
        }

        public MenuLeftDAO(Transaction transaction) : base(transaction)
        {
        }

        public List<MenuLeft> GetMenuProject()
        {
            List<MenuLeft> res = ExecuteToList<MenuLeft>("MenuLeftProject_GetAll");
            return res;
        }

        public List<MenuLeft> GetMenuConsultant()
        {
            List<MenuLeft> res = ExecuteToList<MenuLeft>("MenuLeftConsultant_GetAll");
            return res;
        }

        public List<MenuLeft> GetMenuContact()
        {
            List<MenuLeft> res = ExecuteToList<MenuLeft>("MenuLeftContact_GetAll");
            return res;
        }


        public List<MenuLeft> GetMenuLefs(int type)
        {
            var paramSql = new SqlParameter("@Type", type);
            List<MenuLeft> res = ExecuteToList<MenuLeft>("MenuLeft_GetAll", paramSql);
            return res;
        }

        public MenuLeft GetMenuLefById(int id, int type)
        {
            var paramSql = new[]
                               {
                                   new SqlParameter("@Id", id),
                                   new SqlParameter("@Type", type)
                               };
            var res = ExecuteToSingleOrDefault<MenuLeft>("MenuLeft_GetById", paramSql);
            return res;
        }

        public void AddMenuLef(MenuLeft menuLeft)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Type", menuLeft.Type),
                                    new SqlParameter("@SubType", menuLeft.SubType),
                                    new SqlParameter("@ParentId", menuLeft.ParentId),
                                    new SqlParameter("@Position", menuLeft.Position),
                                    new SqlParameter("@Name", menuLeft.Name),
                                    new SqlParameter("@Link", menuLeft.Link),
                                    new SqlParameter("@CreatedOn", menuLeft.CreatedOn)
                                };

            menuLeft.Id = ExecuteToSingleOrDefault<int>("MenuLeft_Insert", paramArrs);
        }

        public int UpdateMenuLef(MenuLeft menuLeft)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Id", menuLeft.Id),
                                    new SqlParameter("@Type", menuLeft.Type),
                                    new SqlParameter("@SubType", menuLeft.SubType),
                                    new SqlParameter("@ParentId", menuLeft.ParentId),
                                    new SqlParameter("@Position", menuLeft.Position),
                                    new SqlParameter("@Name", menuLeft.Name),
                                    new SqlParameter("@Link", menuLeft.Link),
                                    new SqlParameter("@ChangedOn", menuLeft.ChangedOn)
                                };

            int retVal = ExecuteCommand("MenuLeft_Update", paramArrs);
            return retVal;
        }

        public int DeleteMenuLef(int id, DateTime deletedOn)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Id", id),
                                    new SqlParameter("@DeletedOn", deletedOn)
                                };

            int retVal = ExecuteCommand("MenuLeft_Delete", paramArrs);
            return retVal;
        }
    }
}