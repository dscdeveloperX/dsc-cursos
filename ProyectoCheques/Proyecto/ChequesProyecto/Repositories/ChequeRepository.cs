using ChequesProyecto.Data.Request;
using ChequesProyecto.Interfaces;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ChequesProyecto.Repositories
{
    public class ChequeRepository : IChequeRepository 
    {
        private readonly string CadenaConexion;

        public ChequeRepository  (IConfiguration configuration)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");

        }

        public async Task<bool> ChequeCreate (ChequeCreateRequest request)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(CadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ChequeCreate", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@AccountId", request.AccountId));
                        cmd.Parameters.Add(new SqlParameter("@BeneficiaryId", request.BeneficiaryId));
                        cmd.Parameters.Add(new SqlParameter("@ReportTypeId", request.ReportTypeId));
                        cmd.Parameters.Add(new SqlParameter("@CityId", request.CityId));
                        cmd.Parameters.Add(new SqlParameter("@ChequeNumber", request.Chequenumber));
                        cmd.Parameters.Add(new SqlParameter("@Amount", request.Amount));
                        cmd.Parameters.Add(new SqlParameter("@Date", request.Date));
                        cmd.Parameters.Add(new SqlParameter("@PaymentDetail", request.PaymentDetail));

                        await cnn.OpenAsync();
                        await cmd.ExecuteNonQueryAsync();
                        return true;

                    }


                }

            }
            catch (Exception ex) { return false; }


        }

    }
}
