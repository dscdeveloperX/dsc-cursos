using ChequesProyecto.Entities.Account;
using ChequesProyecto.Repositories.Account;

namespace ChequesProyecto.Services.Account
{
    public class AccountService : IAccountService
    {
        private readonly IAccountRepository _accountRepository;

        public AccountService(IAccountRepository accountRepository) {
            _accountRepository = accountRepository;
        }

        public async Task<List<AccountGetAllResponse>> GetAccountAll()
        {
            return await _accountRepository.GetAccountAll();
        }
    }
}
