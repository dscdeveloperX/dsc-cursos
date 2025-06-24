using System.Diagnostics;
using TutorialCSharp.Entities.Clases.Metodos;

namespace TutorialCSharp.Services.Clases.Metodos
{
    public class MetodoRetorno
    {

        
        public void NoRetornoNada() {

            Debug.WriteLine("soy un metodo que no devuelvo nada");
        }

        //METODOS CON RETORNO O SALIDA DE DATOS

        public string RetornoUnString()
        {
            return "retorno un string";

        }

        public int RetornoUNEntero()
        {
            return 2;
        }

        public bool RetornoUnBool()
        {
            return false;
        }

        public DateTime RetornoUnaFecha()
        {
            return DateTime.Now;
        }

        public double RetornoDouble()
        {
            return 4.2;
        }

        public PilotoInfoResponse Respuesta()
        {
            PilotoInfoResponse response = new PilotoInfoResponse();

            response.Nombre = "Fernando el viejo";
            response.Equipo = "Mercedez verde";
            response.Numero = 33;
            response.Nacionalidad = "Extraterrestre";
            response.Sueldo = 4000;

            return response; 
        }


        //METODOS CON ENTRADA DE DATOS

        public void EntradaDatosString(string nombre) {
            Debug.WriteLine($"nombre: {nombre}");   
        }

        public void Suma(DatosRequest request)
        {
            double respuesta = request.numero1 + request.numero2;
            Debug.WriteLine($"respuesta: {respuesta}");
        }






        //METODOS ENTRADA Y SALIDA DE DATOS

        public double SumaConRetorno(DatosRequest request)
        {
            double respuesta = request.numero1 + request.numero2;
          
            return respuesta;
        }


    }
}
