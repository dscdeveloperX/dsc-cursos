using ChequesProyecto.Request;
using ChequesProyecto.Response;


namespace ChequesProyecto.Interfaces

{
    public interface ICheque
    {
        public Task<bool> Post(ChequeCreateRequest request);
        public Task<List<CityGetAllResponse>> CityGet();

    }
}
