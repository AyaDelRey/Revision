using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entities
{
    public class User
    {
        public Guid UserId { get; set; }     // Correspond à UserId (clé primaire)
        public string UserName { get; set; } // Correspond à UserName
        public string Email { get; set; }    // Correspond à Email
        public string PasswordHash { get; set; } // Correspond à PasswordHash
        public DateTime CreatedDate { get; set; } // Correspond à CreatedDate
    }
}
