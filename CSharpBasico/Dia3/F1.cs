using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia3
{
    public class F1
    {

        //creacion de campos
        public int velocidadLimite;

        //constructor
        //es el primer metodo que se ejecuta cuando inicial la clase
        public F1(int velocidad) {
            velocidadLimite = velocidad;
            Mensaje();
        }


        public void Mensaje() {
            MessageBox.Show("hemos iniciado");
        }

    }
}
