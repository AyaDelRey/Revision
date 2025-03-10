using System;

namespace Common.Repositories
{
    public interface ITaskRepository
    {
        Guid Insert(Task task);  // Ajouter une tâche

        Task<Task> Get(Guid task_id);  // Récupérer une tâche par ID

        void Delete(Guid task_id);  // Supprimer une tâche

        Task MarkTaskAsCompleted(Guid taskId);  // Marquer la tâche comme terminée
    }
}
