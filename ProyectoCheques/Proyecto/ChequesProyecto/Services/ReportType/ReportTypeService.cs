using ChequesProyecto.Entities.ReportType;
using ChequesProyecto.Repositories.ReportType;

namespace ChequesProyecto.Services.ReportType
{
    public class ReportTypeService : IReportTypeService
    {

        private readonly IReportTypeRepository _reportTypeRepository;
        public ReportTypeService(IReportTypeRepository reportTypeRepository) {
            _reportTypeRepository = reportTypeRepository;
        }

        public async Task<List<ReportTypesGetAllResponse>> GetReportTypeAll()
        {
            return await _reportTypeRepository.GetReportTypeAll();
        }
    }
}
