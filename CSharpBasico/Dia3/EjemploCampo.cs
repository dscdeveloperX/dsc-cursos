using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia3.darwin
{
    public class EjemploCampo
    {
        //campo codigo
        private string codigo = "123456";
        


        public void Hola() {

            //MessageBox.Show(codigo);

            //variable local codigo
            string codigo = "11111";

            MessageBox.Show(codigo);
            MessageBox.Show(this.codigo);


        }


        public void Adios()
        {

            MessageBox.Show(codigo);

        }



    }
}
