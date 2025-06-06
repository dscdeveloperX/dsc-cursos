using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TutorialCSharp.Entities;
using TutorialCSharp.Entities.Clases.Constructores;
using TutorialCSharp.Services.Clases.Constructores;


namespace TutorialCSharp.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ConstructoresController : ControllerBase
    {



        [HttpPost("radio-1")]
        public IActionResult Radio1()
        { 
            Radio testRadio = new Radio();

            ApiMensajeResponse respuesta  = testRadio.Encender();

            return Ok(respuesta);

        }




        [HttpPost("radio-2")]
        public IActionResult Radio2(bool luces )
        {
            
            Radio testRadio = new Radio(luces);

            ApiMensajeResponse respuesta = testRadio.Encender();

            return Ok(respuesta);

        }




        [HttpPost("radio-madre")]
        public IActionResult RadioMadre(int volumen,   bool luces, string musicaInicial )
        {

            Radio testRadio = new Radio(volumen,luces,musicaInicial);

            ApiMensajeResponse respuesta = testRadio.Encender();

            return Ok(respuesta);

        }



        [HttpPost("rol-pago")]
        public IActionResult RolPago([FromBody] RolPagoRequest rolPagoRequest)
        {

            //instanciamos una clase para aceder a sus miembros
            //enviamos procentaje iess personal por constructor
            RolPago rolPago = new RolPago(rolPagoRequest.IessPersonalPorcentaje);

            //asignamos valor a propiedades

            //informacion del trabajador
            rolPago.nombreTrabajador = rolPagoRequest.nombreTrabajador;
            rolPago.sueldoBase = rolPagoRequest.sueldoBase;

            //valores por ingresos
            rolPago.diasLaborados = rolPagoRequest.diasLaborados;
            rolPago.horasExtras = rolPagoRequest.horasExtras;

            //valore por egresos
            rolPago.descuentoComedor = rolPagoRequest.descuentoComedor;

            //calculamos con metodo calcular

            RolPagoResponse resultado = rolPago.Calcular();



            return Ok(resultado);

        }





    }
}
