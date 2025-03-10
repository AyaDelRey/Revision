using DAL.Entities;
using DAL.Mappers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Task = DAL.Entities.Task;

namespace DAL.Services
{
    public class TaskService
    {
        private string _connectionString;

        public TaskService(string connectionString)
        {
            _connectionString = connectionString;
        }

        // Récupérer toutes les tâches d'un utilisateur
        public List<Task> GetTasksByUserId(Guid userId)
        {
            var tasks = new List<Task>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                string query = "SELECT TaskId, Title, Description, IsCompleted, DueDate, CreatedDate, UserId FROM dbo.Tasks WHERE UserId = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            tasks.Add(reader.ToTask()); // Utilisation du mapper pour créer un Task
                        }
                    }
                }
            }

            return tasks;
        }
    }
}
