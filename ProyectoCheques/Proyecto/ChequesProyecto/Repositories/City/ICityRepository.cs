using ChequesProyecto.Entities.City;

namespace ChequesProyecto.Repositories.City
{
    public interface ICityRepository
    {
        public Task<List<CityGetAllResponse>> GetCityAll();

    }
}
