using System.Diagnostics;
using TutorialCSharp.Entities;

namespace TutorialCSharp.Services.Clases.Constructores
{

    //constructores
    //1 - inicializar o definir campos


    public class Radio
    {
        //campos
        public int volumen = 0;
        public bool luces = false;
        public string musicaInicial = "departure.mp3";

        //constructor vacio
        public Radio()
        {
        }

        //constructor parametro volumen
        public Radio(int volumen)
        {
            this.volumen = volumen;
        }

        //constructor parametro luces
        public Radio(bool luces)
        {
            this.luces = luces;
        }

        public Radio(string musicaInicial)
        {
            this.musicaInicial = musicaInicial;
        }

        //constructor madre
        public Radio(int volumen, bool luces, string musicaInicial)
        {
            this.volumen = volumen;
            this.luces = luces;
            this.musicaInicial = musicaInicial;
        }


        public ApiMensajeResponse Encender()
        {
            ApiMensajeResponse apiMensajeResponse = new ApiMensajeResponse();
            apiMensajeResponse.Mensaje = $"volumen: {volumen} luces: {luces} musicaInicial: {musicaInicial} ";

            return apiMensajeResponse;

        }


        

    }


    


  

   


}
