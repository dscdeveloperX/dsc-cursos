using ChequesProyecto.Entities.City;
using ChequesProyecto.Repositories.City;

namespace ChequesProyecto.Services.City
{
    public class CityService : ICityService
    {
        private readonly ICityRepository _cityRepository;

        public CityService(ICityRepository cityRepository) {
            _cityRepository = cityRepository;
        }

        public async Task<List<CityGetAllResponse>> GetCityAll()
        {
            return await _cityRepository.GetCityAll();
        }
    }
}
