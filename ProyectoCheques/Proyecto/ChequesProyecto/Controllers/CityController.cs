using ChequesProyecto.Services.City;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/v1/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly ICityService _cityService;
        public CityController(ICityService cityService) {
            _cityService = cityService;
        }

        [HttpGet("cities")]
        public async Task<IActionResult> GetCityAll()
        {
            try
            {
                return Ok(await _cityService.GetCityAll());

            }
            catch (Exception ex) {
                return StatusCode(500, new { error=ex.Message });
            }
        }
    }
}
