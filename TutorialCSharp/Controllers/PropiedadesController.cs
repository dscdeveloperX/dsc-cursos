using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Cryptography;
using TutorialCSharp.Services.Clases.Propiedades;

namespace TutorialCSharp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PropiedadesController : ControllerBase
    {
        [HttpGet("propiedad-ejemplo1")]

        public IActionResult PropiedadEjemplo1()
        {

            //manera corta
            PropiedadesLecturaEscritura escrituraCorta = new PropiedadesLecturaEscritura()
            {
                Cedula = "0959317413",
                Sueldo = 456.32,
                Nombre = "Darwin",
                Edad = 21,
                FechaNacimiento = new DateTime(2004, 2, 2)

            };



            PropiedadesLecturaEscritura escritura = new PropiedadesLecturaEscritura();
            escritura.Cedula = "0959317413";
            escritura.Sueldo = 456.32;
            escritura.Nombre = "Darwin";
            escritura.Edad = 21;
            escritura.FechaNacimiento = new DateTime(2004, 2, 2);



            PropiedadSoloLectura lectura = new PropiedadSoloLectura();

            string cedula = lectura.Cedula;
            double sueldo = lectura.Sueldo;

            Debug.WriteLine("PROPIEDADES DE LECTURA");
            Debug.WriteLine($"Cedula: {cedula}, Sueldo:{sueldo}");

            Debug.WriteLine("PROPIEDADES DE LECTURA Y ESCRITURA");
            Debug.WriteLine($"Cedula: {escritura.Cedula}, Sueldo:{escritura.Sueldo}, Nombre: {escritura.Nombre}, edad: {escritura.Edad} , Fechanacimiento: {escritura.FechaNacimiento} ");

            return Ok();
        }

        [HttpPost("conversion-dolar-euro")]
        public IActionResult Conversion()
        {




            return Ok();

        }

    }
}
