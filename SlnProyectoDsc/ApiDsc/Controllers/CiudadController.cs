using ApiDsc.Entity;
using Microsoft.AspNetCore.Mvc;

namespace ApiDsc.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class CiudadController : Controller
    {



        [HttpGet("All")]
        public IEnumerable<Ciudad> Lista()
        {
           return new List<Ciudad>()
            {
                new Ciudad(){ Id=1, Nombre="Guayaquil"},
                new Ciudad(){Id=2, Nombre="Quito"}
            };
        }
    }
}
