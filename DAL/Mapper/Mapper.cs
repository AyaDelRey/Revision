using DAL.Entities;
using System;
using System.Data;
using Task = DAL.Entities.Task;

namespace DAL.Mappers
{
    internal static class Mapper
    {
        public static User ToUser(this IDataRecord record)
        {
            if (record is null) throw new ArgumentNullException(nameof(record));

            return new User()
            {
                UserId = (Guid)record[nameof(User.UserId)],               // Mappage de UserId
                UserName = (string)record[nameof(User.UserName)],         // Mappage de UserName
                Email = (string)record[nameof(User.Email)],               // Mappage de Email
                PasswordHash = (string)record[nameof(User.PasswordHash)], // Mappage de PasswordHash
                CreatedDate = (DateTime)record[nameof(User.CreatedDate)], // Mappage de CreatedDate

            };
        }

        public static Task ToTask(this IDataRecord record)
        {
            if (record is null) throw new ArgumentNullException(nameof(record));

            return new Task()
            {
                TaskId = (Guid)record[nameof(Task.TaskId)],               // Mappage de TaskId
                Title = (string)record[nameof(Task.Title)],               // Mappage de Title
                Description = (record[nameof(Task.Description)] is DBNull) ? null : (string)record[nameof(Task.Description)], // Mappage de Description (peut être nul)
                IsCompleted = (bool)record[nameof(Task.IsCompleted)],     // Mappage de IsCompleted
                DueDate = (record[nameof(Task.DueDate)] is DBNull) ? null : (DateTime?)record[nameof(Task.DueDate)],       // Mappage de DueDate (peut être nul)
                CreatedDate = (DateTime)record[nameof(Task.CreatedDate)], // Mappage de CreatedDate
                UserId = (Guid)record[nameof(Task.UserId)],               // Mappage de UserId (clé étrangère vers User)
            };
        }
    }
}
