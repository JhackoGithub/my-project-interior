using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DAL.Core;
using Entities;

namespace DAL
{
    public class ProjectDAO : BaseDAO
    {
        public ProjectDAO()
        {
        }

        public ProjectDAO(Transaction transaction) : base(transaction)
        {
        }

        public List<Project> GetProjects()
        {
            List<Project> res = ExecuteToList<Project>("Project_GetAll");
            return res;
        }

        public Project GetProjectById(int id)
        {
            var paramSql = new SqlParameter("@Id", id);
            var res = ExecuteToSingleOrDefault<Project>("Project_GetById", paramSql);
            return res;
        }

        public List<Project> GetProjectCateId(int cateId)
        {
            var paramSql = new SqlParameter("@CategoryId", cateId);
            List<Project> res = ExecuteToList<Project>("Project_GetByCategoryId", paramSql);
            return res;
        }

        public void AddProject(Project project)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Type", project.Type),
                                    new SqlParameter("@CategoryId", project.CategoryId),
                                    new SqlParameter("@Name", project.Name),
                                    new SqlParameter("@PathImage", project.PathImage),
                                    new SqlParameter("@PrimaryImage", project.PrimaryImage),
                                    new SqlParameter("@Information", project.Information),
                                    new SqlParameter("@Description", project.Description),
                                    new SqlParameter("@CreatedOn", project.CreatedOn)
                                };

            project.Id = ExecuteToSingleOrDefault<int>("Project_Insert", paramArrs);
        }

        public int UpdateProject(Project project)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Id", project.Id),
                                    new SqlParameter("@Type", project.Type),
                                    new SqlParameter("@CategoryId", project.CategoryId),
                                    new SqlParameter("@Name", project.Name),
                                    new SqlParameter("@PathImage", project.PathImage),
                                    new SqlParameter("@PrimaryImage", project.PrimaryImage),
                                    new SqlParameter("@Information", project.Information),
                                    new SqlParameter("@Description", project.Description),
                                    new SqlParameter("@ChangedOn", project.ChangedOn)
                                };

            int retVal = ExecuteCommand("Project_Update", paramArrs);
            return retVal;
        }

        public int DeleteProject(int id, DateTime deletedOn)
        {
            var paramArrs = new[]
                                {
                                    new SqlParameter("@Id", id),
                                    new SqlParameter("@DeletedOn", deletedOn)
                                };

            int retVal = ExecuteCommand("Project_Delete", paramArrs);
            return retVal;
        }
    }
}