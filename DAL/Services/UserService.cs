using DAL.Entities;
using DAL.Mappers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL.Services
{
    public class UserService
    {
        private string _connectionString;

        public UserService(string connectionString)
        {
            _connectionString = connectionString;
        }

        // Récupérer tous les utilisateurs
        public List<User> GetAllUsers()
        {
            var users = new List<User>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                string query = "SELECT UserId, UserName, Email, PasswordHash, CreatedDate, DisabledAt FROM dbo.Users";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            users.Add(reader.ToUser()); // Utilisation du mapper pour créer un User
                        }
                    }
                }
            }

            return users;
        }
    }
}
