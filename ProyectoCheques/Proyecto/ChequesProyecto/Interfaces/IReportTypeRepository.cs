using ChequesProyecto.Data.Response;

namespace ChequesProyecto.Interfaces
{
    public interface IReportTypeRepository
    {
        public Task<List<ReportTypesGetAllResponse>> ReportGetAll();
    }
}
