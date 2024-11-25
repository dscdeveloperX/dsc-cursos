using Microsoft.AspNetCore.Mvc;

namespace ProyectoElpizo.Controllers
{
    [ApiController]
    [Route("cliente")]
    public class ClienteController : ControllerBase

    {
        [HttpGet]
        [Route("listar")]
        public dynamic ListarCliente()
        {
            List<Cliente> clientes = new List<Cliente>
            {
                new Cliente
                {
                    id = "1",
                    nombre = "Darwin",
                    edad = "20",
                    correo ="aaa"
                },
                new Cliente
                {
                    id = "2",
                    nombre = "Darwin't",
                    edad = "20",
                    correo ="baa"
                }
            };

            return clientes;
           
            
        }
        [HttpGet]
        [Route("listarId")]
        public dynamic ListarClienteId(string _id)
        {
            return new Cliente
            {
                id = _id,
                nombre = "pepita",
                edad= "33",
                correo = "caa"
            };


        }
        [HttpPost]
        [Route("guardar")]
        public dynamic GuardarCliente(Cliente cliente) 
        {
            cliente.id = "3";
            return new
            {
                success = true,
                message = "cliente registrado",
                result = cliente
            };
        }
        [HttpPost]
        [Route("eliminar")]
        public dynamic EliminarCliente(Cliente cliente)
        {
           string token = Request.Headers.Where(x => x.Key == "Authorization").FirstOrDefault().Value;
            if (token != "Zuleyka")
            {
                return new
                {

                    success = true,
                    message = "cliente cliente eliminado",
                    result = ""
                };
            }
            return new
            {
                
                success = true,
                message = "cliente cliente eliminado",
                result = cliente
            };
        }





    }

}

