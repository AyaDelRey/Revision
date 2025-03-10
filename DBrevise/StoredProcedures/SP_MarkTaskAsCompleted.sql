CREATE PROCEDURE [dbo].[SP_MarkTaskAsCompleted]
    @TaskId UNIQUEIDENTIFIER
AS
BEGIN
    -- Mettre à jour la tâche pour la marquer comme terminée
    UPDATE dbo.Task
    SET IsCompleted = 1 -- Marquer la tâche comme terminée
    WHERE TaskId = @TaskId;
END
GO
