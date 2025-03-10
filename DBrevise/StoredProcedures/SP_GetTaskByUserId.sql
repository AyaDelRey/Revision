CREATE PROCEDURE [dbo].[SP_GetTaskByUserId]
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
    -- Sélectionner toutes les tâches d'un utilisateur
    SELECT TaskId, Title, Description, IsCompleted, DueDate, CreatedDate
    FROM dbo.Task
    WHERE UserId = @UserId
    ORDER BY CreatedDate DESC;
END
GO
