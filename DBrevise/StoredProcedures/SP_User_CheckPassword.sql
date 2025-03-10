CREATE PROCEDURE [dbo].[SP_User_CheckPassword]
    @Email NVARCHAR(100),
    @Password NVARCHAR(255)
AS
BEGIN
    -- Variable pour stocker l'ID de l'utilisateur
    DECLARE @UserId UNIQUEIDENTIFIER;

    -- Sélectionner l'utilisateur correspondant à l'email et vérifier le mot de passe
    SELECT @UserId = UserId
    FROM [dbo].[User]
    WHERE Email = @Email
    AND PasswordHash = @Password; -- Comparaison du mot de passe hashé

    -- Si l'utilisateur existe, retourner son ID, sinon retourner NULL
    IF @UserId IS NOT NULL
    BEGIN
        SELECT @UserId AS UserId;
    END
    ELSE
    BEGIN
        SELECT NULL AS UserId; -- Aucun utilisateur trouvé
    END
END

