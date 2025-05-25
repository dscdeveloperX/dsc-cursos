using ChequesProyecto.Entities.Cheque;

namespace ChequesProyecto.Repositories.Cheque

{
    public interface IChequeRepository
    {
        public Task<bool> CreateCheque(ChequeCreateRequest chequeCreateRequest);

        Task<List<ChequeResponse>> GetChequeReport(ChequeRequest chequeRequest);


    }
}
