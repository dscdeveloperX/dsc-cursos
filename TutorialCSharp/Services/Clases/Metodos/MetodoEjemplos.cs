using System.Diagnostics;
using TutorialCSharp.Entities.Clases.Metodos;

namespace TutorialCSharp.Services.Clases.Metodos
{
    public class MetodoEjemplos
    {
        public void MetodoVoid()
        {
            Debug.WriteLine("nada que devolver");

        }

        public string ReturnString()
        {
            return "Viejonso";
        
        }

        public bool ReturnBool()
        {
            bool respuesta = false;
            return respuesta;
        }

        public GemasResponse MetodoPrueba()
        {
            GemasResponse response = new GemasResponse();
            response.nombre = "Lapislazuli";
            response.precioPorKilate = 20.45;
            response.dureza = 6.5;
            response.utilidadJoyeria = true;

            return response;
        }

        public GemasResponse MetodoPrueba2(string nombre, double precioPorKilate, double dureza, bool utilidadJoyeria)
        {
            GemasResponse response = new GemasResponse();
             response.nombre = nombre;
             response.precioPorKilate = precioPorKilate;
             response.dureza = dureza;
             response.utilidadJoyeria = utilidadJoyeria;

         


            return response;
        }

        public GemasResponse MetodoPrueba3(GemasRequest request)
        {
            GemasResponse response = new GemasResponse();

            response.nombre = request.nombre;
            response.precioPorKilate = request.precioPorKilate;
            response.dureza = request.dureza;
            response.utilidadJoyeria = request.utilidadJoyeria;

            return response;

        }

        }




    }

  

