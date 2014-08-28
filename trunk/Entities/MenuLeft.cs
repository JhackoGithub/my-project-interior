using System;

namespace Entities
{
    public class MenuLeft
    {
        public int Id { get; set; }

        public int Type { get; set; }

        public int? SubType { get; set; }

        public int? ParentId { get; set; }

        public int? Position { get; set; }

        public string Name { get; set; }

        public int? Link { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ChangedOn { get; set; }

        public DateTime? DeletedOn { get; set; }
    }
}