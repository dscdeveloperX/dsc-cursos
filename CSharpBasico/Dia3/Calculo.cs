using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpBasico.Dia3
{
    class Calculo
    {
        public double CalculoIess (double miSueldo)
        {
            double porcentaje = 10;
            double respuesta = (miSueldo / 100 * porcentaje);
            return respuesta;

        }

    }
}
