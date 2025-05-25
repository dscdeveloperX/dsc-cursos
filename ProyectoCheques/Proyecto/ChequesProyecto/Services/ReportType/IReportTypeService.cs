using ChequesProyecto.Entities.ReportType;

namespace ChequesProyecto.Services.ReportType
{
    public interface IReportTypeService
    {
        public Task<List<ReportTypesGetAllResponse>> GetReportTypeAll();
    }
}
