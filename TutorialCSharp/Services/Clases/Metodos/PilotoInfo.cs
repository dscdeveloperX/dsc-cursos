
using System.Security.Cryptography.X509Certificates;
using TutorialCSharp.Entities.Clases.Metodos;
using TutorialCSharp.Services.Clases.Metodos;

namespace TutorialCSharp.Services.Clases.Metodos

{
    public class PilotoInfo
    {
        public int Descuento; 

        public PilotoInfo()
        {
            Descuento = 10;
        }

        public PilotoInfoResponse Calculo(PilotoInfoRequest pilotoInfo)
        {



            PilotoInfoResponse pilotoInfoResponse  =  new PilotoInfoResponse();

            pilotoInfoResponse.Nombre = pilotoInfo.Nombre;

            pilotoInfoResponse.Equipo = pilotoInfo.Equipo;
            pilotoInfoResponse.Numero = pilotoInfo.Numero;
            pilotoInfoResponse.Nacionalidad = pilotoInfo.Nacionalidad;
            pilotoInfoResponse.Sueldo = pilotoInfo.SueldoBruto - (pilotoInfo.Danios / Descuento);
            
            
       


            return pilotoInfoResponse;
           


           

        }


        public PilotoInfoResponse Response()
        {
            PilotoInfoResponse pilotoInfo = new PilotoInfoResponse();
            return pilotoInfo;
            

        }


       


    }

        
     
       
           

    }
       

    

    public class GetPiloto ()
   {

    


    }

