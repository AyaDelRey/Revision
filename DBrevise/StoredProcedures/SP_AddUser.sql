CREATE PROCEDURE [dbo].[SP_AddUser]
    @UserName NVARCHAR(100),
    @Email NVARCHAR(100),
    @Password NVARCHAR(255)
AS
BEGIN
   
    INSERT INTO dbo.[User] (UserId, UserName, Email, PasswordHash, CreatedDate)
    VALUES (NEWID(), @UserName, @Email, HASHBYTES('SHA2_256', @Password), GETDATE());
END
GO
