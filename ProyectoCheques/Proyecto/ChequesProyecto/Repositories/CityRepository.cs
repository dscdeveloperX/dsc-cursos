using ChequesProyecto.Interfaces;
using ChequesProyecto.Response;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ChequesProyecto.Repositories
{
    public class CityRepository: ICityRepository
    {

        private readonly string CadenaConexion;

        public CityRepository(IConfiguration configuration)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");
        }


        public async Task<List<CityGetAllResponse>> CityGetAll() {

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
