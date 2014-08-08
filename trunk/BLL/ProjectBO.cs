using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entities;

namespace BLL
{
    public class ProjectBO
    {
        public List<Project> GetProjects()
        {
            var dao = new ProjectDAO();
            List<Project> res = dao.GetProjects();
            return res;
        }

        public Project GetProjectById(int id)
        {
            var dao = new ProjectDAO();
            Project res = dao.GetProjectById(id);
            return res;
        }

        public int AddProject(Project project)
        {
            var dao = new ProjectDAO();
            DateTime datetime = DateTime.Now;
            project.CreatedOn = project.CreatedOn = datetime;
            dao.AddProject(project);
            return project.Id;
        }

        public int UpdateProject(Project project)
        {
            var dao = new ProjectDAO();
            DateTime datetime = DateTime.Now;
            project.ChangedOn = datetime;
            int res = dao.UpdateProject(project);
            return res;
        }

        public int DeleteProject(int id)
        {
            var dao = new ProjectDAO();
            int res = dao.DeleteProject(id, DateTime.Now);
            return res;
        }
    }
}
