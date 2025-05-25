using ChequesProyecto.Entities.City;

namespace ChequesProyecto.Services.City
{
    public interface ICityService
    {
        public Task<List<CityGetAllResponse>> GetCityAll();
    }
}
