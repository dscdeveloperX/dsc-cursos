using ChequesProyecto.Entities.Cheque;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ChequesProyecto.Repositories.Cheque
{
    public class ChequeRepository : IChequeRepository
    {
        private readonly string CadenaConexion;

        public ChequeRepository(IConfiguration configuration)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");

        }

        public async Task<bool> CreateCheque(ChequeCreateRequest chequeCreateRequest)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(CadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ChequeCreate", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@AccountId", chequeCreateRequest.AccountId));
                        cmd.Parameters.Add(new SqlParameter("@BeneficiaryId", chequeCreateRequest.BeneficiaryId));
                        cmd.Parameters.Add(new SqlParameter("@ReportTypeId", chequeCreateRequest.ReportTypeId));
                        cmd.Parameters.Add(new SqlParameter("@CityId", chequeCreateRequest.CityId));
                        cmd.Parameters.Add(new SqlParameter("@ChequeNumber", chequeCreateRequest.Chequenumber));
                        cmd.Parameters.Add(new SqlParameter("@Amount", chequeCreateRequest.Amount));
                        cmd.Parameters.Add(new SqlParameter("@Date", chequeCreateRequest.Date));
                        cmd.Parameters.Add(new SqlParameter("@PaymentDetail", chequeCreateRequest.PaymentDetail));

                        await cnn.OpenAsync();
                       int affectRows =  await cmd.ExecuteNonQueryAsync();
                        return (affectRows>0);

                    }


                }

            }
            catch (Exception ex) { return false; }


        }


        public async Task<List<ChequeResponse>> GetChequeReport(ChequeRequest chequeRequest)
        {
            List<ChequeResponse> chequeResponses = new List<ChequeResponse>();
            using (SqlConnection cnn = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ChequeGetReport", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ReportTypeId", chequeRequest.ReportTypeId);
                    cmd.Parameters.AddWithValue("@StartChequeNumber", chequeRequest.StartChequeNumber);
                    cmd.Parameters.AddWithValue("@EndChequeNumber", chequeRequest.EndChequeNumber);

                    await cnn.OpenAsync();

                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())

                    {
                        while (await dr.ReadAsync())
                        {
                            ChequeResponse chequeResponse = new ChequeResponse()
                            {
                                CompanyName = dr["CompanyName"].ToString(),
                                BankName = dr["BankName"].ToString(),
                                AccountNumber = dr["AccountNumber"].ToString(),
                                BeneficiaryId = dr["BeneficiaryId"].ToString(),
                                ReportTypeName = dr["ReportTypeName"].ToString(),
                                BeneficiaryName = dr["BeneficiaryName"].ToString(),
                                CityName = dr["CityName"].ToString(),
                                ChequeNumber = Convert.ToInt32(dr["ChequeNumber"]),
                                Amount = Convert.ToDecimal(dr["Amount"]),
                                Date = Convert.ToDateTime(dr["Date"]),
                                PaymentDetail = dr["PaymentDetail"].ToString()
                            };
                            chequeResponses.Add(chequeResponse);
                        }
                    }
                }
                return chequeResponses;
            }

        }

    }
}
