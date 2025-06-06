using TutorialCSharp.Entities;

namespace TutorialCSharp.Services.Clases.Metodos
{
    public class Mensaje
    {
        public ApiMensajeResponse Mostrar(string titulo)
        {
            ApiMensajeResponse response = new ApiMensajeResponse();

            response.Mensaje = titulo;

            return response;

            
        }

        public ApiMensajeResponse Mostrar(string titulo, string descripcion)
        {
            ApiMensajeResponse response = new ApiMensajeResponse(){ Mensaje = $"{titulo} - {descripcion}" };

            return response;
        }

        public ApiMensajeResponse Mostrar(string titulo, string descripcion, string tipoMensaje)
        {

            return new ApiMensajeResponse()
            {
                Mensaje = $"{titulo} - {descripcion} - {tipoMensaje}"
            };

        }



    }
}
