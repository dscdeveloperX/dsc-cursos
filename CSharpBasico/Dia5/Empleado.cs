using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpBasico.Dia5
{
    public class Empleado
    {
        public string Cedula { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }

        public string Hola() { return "hola viejo"; }

    }
}
