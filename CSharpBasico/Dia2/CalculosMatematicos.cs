using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia2
{
    class CalculosMatematicos
    {
        public double Suma (double valor1,double valor2)
        {
            return valor1 + valor2;
        }

        public double Resta (double valor1, double valor2)
        {
            return valor1 - valor2;
        }

        public string Saludo (string nombre)
        {
           return $"bienvenido {nombre}";
        } 
        public string Nombre (string hola)
        {
            return ($"{hola} darwin");
        }
    }
}
