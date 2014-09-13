using System;
using System.Collections.Generic;

namespace Entities
{

    public class ProjectPaging
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int TotalRows { get; set; }
        public List<Project> Projects { get; set; }
    }

    public class Project
    {
        public int Id { get; set; }

        public int Type { get; set; }

        public int CategoryId { get; set; }

        public string Name { get; set; }

        public string PathImage { get; set; }

        public string PrimaryImage { get; set; }

        public string Information { get; set; }

        public string Description { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ChangedOn { get; set; }

        public DateTime? DeletedOn { get; set; }
    }
}