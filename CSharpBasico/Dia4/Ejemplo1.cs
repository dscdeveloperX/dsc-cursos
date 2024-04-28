using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpBasico.Dia4
{
    public class Ejemplo1
    {
        //campo
        private string cedula;

        //constructor
        public Ejemplo1() {
            cedula = "777777777";
        }


        //propiedad escritura
        public void setCedula(string value) {
            cedula = value;
        }

        //propiedad lectura
        public string getCedula() {
            return cedula;
        }

    }



    public class Ejemplo2 { 
    
        public string Cedula { get; set; }
        

    }


}
