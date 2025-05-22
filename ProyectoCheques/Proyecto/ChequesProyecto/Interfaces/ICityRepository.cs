using ChequesProyecto.Response;

namespace ChequesProyecto.Interfaces
{
    public interface ICityRepository
    {
        public Task<List<CityGetAllResponse>> CityGetAll();

    }
}
