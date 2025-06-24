using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using System.Diagnostics;
using System.Reflection.Metadata;
using TutorialCSharp.Entities;
using TutorialCSharp.Entities.Clases.Metodos;
using TutorialCSharp.Services.Clases.Metodos;

namespace TutorialCSharp.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class MetodosController : ControllerBase
    {

        [HttpGet("titulo/{titulo}")]

        public IActionResult Mostrar(string titulo) {

            Mensaje mensaje = new Mensaje();
           ApiMensajeResponse response = mensaje.Mostrar(titulo);

            return Ok(response);
        }


        [HttpPost("mostrar-1")]

        public IActionResult Mostrar(MensajeRequest request)
        {
            Mensaje mensaje = new Mensaje();
            
            ApiMensajeResponse response = mensaje.Mostrar(request.Titulo, request.Descripcion);

            return Ok(response);
        }


        [HttpPost("mostrar-2")]

        public IActionResult Mostrar2(MensajeRequest request)
        {
            Mensaje mensaje = new Mensaje();

            ApiMensajeResponse response = mensaje.Mostrar(request.Titulo, request.Descripcion, request.TipoMensaje);

            return Ok(response);
        }


        [HttpPost("piloto-calcular")]

        public IActionResult Piloto( [FromBody ] PilotoInfoRequest pilotoInforequest)
        {
           PilotoInfo piloto = new PilotoInfo();

           

            PilotoInfoResponse response = piloto.Calculo(pilotoInforequest);

            return Ok(response);
        }


        [HttpGet("metodos-input-output")]
        public IActionResult MetodosInputOutput() {

            MetodoRetorno metodoRetorno = new MetodoRetorno();

            MetodoEjemplos ejemplo  = new MetodoEjemplos();

           

            Debug.WriteLine("Titulo: NoRetornoNada");
            metodoRetorno.NoRetornoNada();

            Debug.WriteLine("Titulo: RetornoDouble");
            double valor = metodoRetorno.RetornoDouble();
            Debug.WriteLine(valor);

            //Metodos de ejemplo

            Debug.WriteLine("Titulo: Sin retorno");
            ejemplo.MetodoVoid();
            //Devuelve un string 
           
            Debug.WriteLine("Titulo: devuelve un string");
            string valor2 = ejemplo.ReturnString();
            Debug.WriteLine($"valor es igual a {valor2}");

            Debug.WriteLine("Titulo: devuelve bool");
            bool valorBool = ejemplo.ReturnBool();
            Debug.WriteLine($"That's {valorBool}");

            GemasResponse respuesta = ejemplo.MetodoPrueba();
            Debug.WriteLine(respuesta);

           



            return Ok(respuesta);
        }

        [HttpGet("output")]
        public IActionResult MetodosOutput() { 
        
            MetodoEjemplos ejemplo = new MetodoEjemplos();

            GemasResponse response = ejemplo.MetodoPrueba2("obsidiana", 3.55, 2.5, true);
            Debug.WriteLine(response);
            return Ok(response);
        
        }

        [HttpPost("metodo-input")]

        public IActionResult MetodoInput([FromBody] GemasRequest request)
        {
            MetodoEjemplos ejemplo = new MetodoEjemplos();

            GemasResponse response = ejemplo.MetodoPrueba3(request);
            return Ok(response);
        }
        

    }
}
