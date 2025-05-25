using ChequesProyecto.Entities.ReportType;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ChequesProyecto.Repositories.ReportType
{
    public class ReportTypeRepository : IReportTypeRepository
    {
        private readonly string CadenaConexion;

        public ReportTypeRepository(IConfiguration configuration)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");
        }

        public async Task<List<ReportTypesGetAllResponse>> GetReportTypeAll()
        {
            List<ReportTypesGetAllResponse> reports = new List<ReportTypesGetAllResponse>();
            using (SqlConnection cnn = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ReportsTypesGetAll", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    await cnn.OpenAsync();

                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())

                    {
                        while (await dr.ReadAsync())
                        {
                            ReportTypesGetAllResponse report = new ReportTypesGetAllResponse()
                            {
                                Id = dr["Id"].ToString(),
                                Name = dr["Name"].ToString()
                            };
                            reports.Add(report);
                        }
                    }
                }
                return reports;
            }

        }


     

    }
}
