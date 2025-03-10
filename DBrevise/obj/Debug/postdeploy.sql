/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Insérer des utilisateurs dans dbo.Users
INSERT INTO dbo.[Users] (UserId, UserName, Email, PasswordHash, CreatedDate)
VALUES 
    (NEWID(), 'JohnDoe', 'john.doe@example.com', HASHBYTES('SHA2_256', 'password123'), GETDATE()),
    (NEWID(), 'JaneDoe', 'jane.doe@example.com', HASHBYTES('SHA2_256', 'password456'), GETDATE()),
    (NEWID(), 'AdminUser', 'admin@example.com', HASHBYTES('SHA2_256', 'adminpassword'), GETDATE());

-- Récupérer les UserId générés pour utilisation dans les tâches
DECLARE @UserId1 UNIQUEIDENTIFIER = (SELECT UserId FROM dbo.[Users] WHERE UserName = 'JohnDoe');
DECLARE @UserId2 UNIQUEIDENTIFIER = (SELECT UserId FROM dbo.[Users] WHERE UserName = 'JaneDoe');
DECLARE @UserId3 UNIQUEIDENTIFIER = (SELECT UserId FROM dbo.[Users] WHERE UserName = 'AdminUser');

-- Insérer des tâches associées à chaque utilisateur
INSERT INTO dbo.Tasks (TaskId, Title, Description, IsCompleted, DueDate, CreatedDate, UserId)
VALUES
    (NEWID(), 'Acheter du lait', 'Aller au supermarché pour acheter du lait.', 0, DATEADD(DAY, 3, GETDATE()), GETDATE(), @UserId1),
    (NEWID(), 'Finir le projet', 'Compléter le projet To-Do List.', 0, DATEADD(DAY, 7, GETDATE()), GETDATE(), @UserId1),
    (NEWID(), 'Révision des notes', 'Vérifier les notes du dernier trimestre.', 1, NULL, GETDATE(), @UserId2),
    (NEWID(), 'Configurer le serveur', 'Configurer le serveur pour le nouveau client.', 0, DATEADD(DAY, 5, GETDATE()), GETDATE(), @UserId3),
    (NEWID(), 'Rédiger un rapport', 'Rédiger un rapport pour la réunion trimestrielle.', 0, DATEADD(DAY, 10, GETDATE()), GETDATE(), @UserId3);

-- Vérification des données insérées
SELECT * FROM dbo.[Users];
SELECT * FROM dbo.Tasks;

GO
