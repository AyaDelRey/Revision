CREATE PROCEDURE [dbo].[SP_GetAllUsers]
AS
BEGIN
    -- Sélectionner tous les utilisateurs
    SELECT UserId, UserName, Email, CreatedDate
    FROM dbo.[User];
END
