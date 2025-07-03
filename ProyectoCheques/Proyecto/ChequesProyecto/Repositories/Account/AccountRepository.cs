using ChequesProyecto.Entities.Account;
using ChequesProyecto.Entities.Cheque;
using ChequesProyecto.Entities.City;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ChequesProyecto.Repositories.Account
{
    public class AccountRepository : IAccountRepository
    {

        private readonly string CadenaConexion;

        public AccountRepository(IConfiguration configuration)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");
        }


        public async Task<List<AccountGetAllResponse>> GetAccountAll()
        {

            List<AccountGetAllResponse> accounts = new List<AccountGetAllResponse>();
            using (SqlConnection cnn = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AccountGetAll", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            AccountGetAllResponse account = new AccountGetAllResponse()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                AccountNumber = dr["AccountNumber"].ToString(),
                                BankId = Convert.ToInt32(dr["BankId"]),
                                BankName = dr["BankName"].ToString(),
                                CompanyId = Convert.ToInt32(dr["CompanyId"]),
                                CompanyName = dr["CompanyName"].ToString()
                            };
                            accounts.Add(account);
                        }
                    }

                }

                return accounts;
            }

        }


     
    }
}
