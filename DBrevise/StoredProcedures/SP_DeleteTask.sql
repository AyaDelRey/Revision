CREATE PROCEDURE [dbo].[SP_DeleteTask]
    @TaskId UNIQUEIDENTIFIER
AS
BEGIN
    -- Supprimer une tâche par son TaskId
    DELETE FROM dbo.Task
    WHERE TaskId = @TaskId;
END
GO
