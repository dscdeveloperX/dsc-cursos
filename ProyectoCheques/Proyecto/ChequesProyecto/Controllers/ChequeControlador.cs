using ChequesProyecto.Request;
using ChequesProyecto.Response;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/[controller]")]
    [ApiController]
    
    public class ChequeControlador : ControllerBase
    {
        private readonly string CadenaConexion;

        public ChequeControlador(IConfiguration configuration)
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

        [HttpGet]
        public async Task<List<CityGetAllResponse>> CityGet()
        {
            List<CityGetAllResponse> cities = new List<CityGetAllResponse>();
            using (SqlConnection cnn = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_CityGetAll", cnn)) 
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            CityGetAllResponse city = new CityGetAllResponse()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Name = dr["Name"].ToString()
                            };
                            cities.Add(city);
                        }
                    }

                }

                return cities;
            }
        }

    }
}
