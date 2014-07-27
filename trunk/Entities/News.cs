using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
    public class News
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string SubContent { get; set; }

        public string ImageUrl { get; set; }

        public string Contents { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ChangedOn { get; set; }

        public DateTime? DeletedOn { get; set; }
    }
}
