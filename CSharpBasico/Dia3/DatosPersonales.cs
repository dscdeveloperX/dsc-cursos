using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpBasico.Dia3
{
    public class DatosPersonales
    {
        public string Datos (string cedula)
        {
            return $"cedula: {cedula}";
        }


        public string Datos (string cedula,string edad)
        {
            return $"cedula: {cedula}, edad: {edad}";
        }

    }
}
