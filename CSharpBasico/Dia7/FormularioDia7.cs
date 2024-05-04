using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia7
{
    public partial class FormularioDia7 : Form
    {
        public FormularioDia7()
        {
            InitializeComponent();
        }



        private void btnCall1_Click(object sender, EventArgs e)
        {
            /*ClaseDia7 cl1 = new ClaseDia7();
            cl1.Ejemplo1();*/

            //new ClaseDia7().Ejemplo1();
            new ClaseDia7().Ejemplo3();
        }


    }
}
