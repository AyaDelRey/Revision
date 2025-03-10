using System;

namespace Common.Repositories
{
    public interface IUserRepository
    {


        // Récupérer un utilisateur par son identifiant
        IUserRepository Get(Guid userId);

        // Insérer un nouvel utilisateur
        Guid Insert(IUserRepository user);

        // Supprimer un utilisateur
        void Delete(Guid userId);

        // Vérifier si un utilisateur existe avec un email et un mot de passe
        Guid CheckPassword(string email, string password);
    }
}
