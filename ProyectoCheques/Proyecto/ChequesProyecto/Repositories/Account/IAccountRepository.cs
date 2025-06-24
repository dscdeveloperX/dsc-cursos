using ChequesProyecto.Entities.Account;
using ChequesProyecto.Entities.City;

namespace ChequesProyecto.Repositories.Account
{
    public interface IAccountRepository
    {
        public Task<List<AccountGetAllResponse>> GetAccountAll();

    }
}
