using ApiDsc.Entity;
using Microsoft.AspNetCore.Mvc;

namespace ApiDsc.Controllers
{




    [ApiController]
    [Route("api/[controller]")]
    public class PersonaController : ControllerBase
    {




        [HttpGet("All")]
        public IEnumerable<Persona> Lista()
        {
            return new List<Persona>() { 

            new Persona(){ Cedula="0978385",Nombre= "Darwin", Sueldo= 45.67M},
            new Persona(){ Cedula="0954758",Nombre= "Tommy", Sueldo= 45.55M},
            new Persona(){ Cedula="0894743",Nombre= "Gregory", Sueldo= 45.33M},
            new Persona(){ Cedula="0978368",Nombre= "Steven", Sueldo= 45.21M}

            };

           

        }



        [HttpGet("{id}")]
        public IEnumerable<Persona> ListaId(string id)
        {
            List<Persona> personas = new List<Persona>();
            personas.Add(new Persona() { Cedula= "0847346",Nombre="Tatiana",Sueldo=47.96M});
            personas.Add(new Persona() { Cedula = "894734279", Nombre = "Bonnie", Sueldo = 87.333M });
            personas.Add(new Persona() { Cedula = "426724", Nombre = "Jenny", Sueldo = 753.89M });

            return personas.Where(x => x.Cedula == id);


        }






    }
}














//private readonly ILogger<WeatherForecastController> _logger;
/*
public WeatherForecastController(ILogger<WeatherForecastController> logger)
{
    _logger = logger;
}
*/