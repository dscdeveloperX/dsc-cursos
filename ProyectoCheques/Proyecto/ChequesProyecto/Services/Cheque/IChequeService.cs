using ChequesProyecto.Entities.Cheque;

namespace ChequesProyecto.Services.Cheque
{
    public interface IChequeService
    {
        public Task<bool> CreateCheque(ChequeCreateRequest chequeCreateRequest);

        Task<List<ChequeResponse>> GetChequeReport(ChequeRequest chequeRequest);

        Task<byte[]> PdfGenerateRolPago(string documentType);
    }
}
