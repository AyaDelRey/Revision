using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entities
{
    public class Task
    {
        public Guid TaskId { get; set; }       // Correspond à TaskId (clé primaire)
        public string Title { get; set; }      // Correspond à Title
        public string Description { get; set; } // Correspond à Description
        public bool IsCompleted { get; set; }   // Correspond à IsCompleted
        public DateTime? DueDate { get; set; }  // Correspond à DueDate
        public DateTime CreatedDate { get; set; } // Correspond à CreatedDate
        public Guid UserId { get; set; }       // Correspond à UserId (clé étrangère)
    }
}
