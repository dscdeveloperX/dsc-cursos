using ChequesProyecto.Entities.Cheque;

namespace ChequesProyecto.Repositories.Cheque

{
    public interface IChequeRepository
    {
        public Task<bool> CreateCheque(ChequeCreateRequest chequeCreateRequest);

        Task<List<ChequeReportResponse>> GetChequeReport(ChequeReportRequest chequeReportRequest);
        Task<List<ChequeReportResponse>> GetChequesByDateRange(ChequesGetByDateRangeRequest chequesGetByDateRangeRequest);


    }
}
