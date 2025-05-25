using ChequesProyecto.Entities.ReportType;

namespace ChequesProyecto.Repositories.ReportType
{
    public interface IReportTypeRepository
    {
        public Task<List<ReportTypesGetAllResponse>> GetReportTypeAll();
       
    }
}
