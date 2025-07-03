using ChequesProyecto.Entities.Cheque;

namespace ChequesProyecto.Services.Cheque
{
    public interface IChequeService
    {
        public Task<bool> CreateCheque(ChequeCreateRequest chequeCreateRequest);

        Task<List<ChequeReportResponse>> GetChequeReport(ChequeReportRequest chequeReportRequest);

        Task<byte[]> GenerateChequeReport(List<ChequeReportResponse> chequeData, string documentType);

        Task<bool> GenerarCheques(ChequeBatchCreate chequeBatchCreate);
        Task<List<ChequeReportResponse>> GetChequesByDateRange(ChequesGetByDateRangeRequest chequesGetByDateRangeRequest);

        Task<byte[]> GenerateChequeDateRangeReport(List<ChequeReportResponse> chequeData);




    }
}
