using ChequesProyecto.Entities.Account;
using ChequesProyecto.Entities.City;

namespace ChequesProyecto.Services.Account
{
    public interface IAccountService
    {
        public Task<List<AccountGetAllResponse>> GetAccountAll();
    }
}
