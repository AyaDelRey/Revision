CREATE PROCEDURE [dbo].[SP_AddTask]
    @Title NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @IsCompleted BIT,
    @DueDate DATETIME,
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
    -- Insérer une nouvelle tâche
    INSERT INTO dbo.Task (TaskId, Title, Description, IsCompleted, DueDate, CreatedDate, UserId)
    VALUES (NEWID(), @Title, @Description, @IsCompleted, @DueDate, GETDATE(), @UserId);
END
GO