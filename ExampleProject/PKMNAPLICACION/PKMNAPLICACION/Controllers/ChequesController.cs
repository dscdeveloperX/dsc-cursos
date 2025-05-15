using ChequesServicio.Interfaces;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;



namespace ChequesServicio.Controllers
{
    [Route ("api/v1/[controller]")]
    [ApiController]
    [EnableCors("alexcors")]
    public class ChequesController : Controller
    {

        private readonly string CadenaConexion;

        public ChequesController(IConfiguration configuration)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");
        }

        [HttpPost]

        public async Task<bool> Post(ChequeCreateRequest request)
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
