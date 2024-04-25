
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CSharpBasico.Dia3.darwin;

namespace CSharpBasico.Dia1
{
    public partial class pruebaBasica : Form
    {
        public pruebaBasica()
        {
            InitializeComponent();
        }

        //evento click
        private void btnEnviarSaludo_Click(object sender, EventArgs e)
        {
            lblSaludo.Text = tbxNombre.Text;

            EjemploCampo clase1 = new EjemploCampo();


            
        }


    }
}
