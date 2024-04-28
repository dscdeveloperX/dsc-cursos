using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia4
{
    public partial class FormularioPropiedades : Form
    {
        public FormularioPropiedades()
        {
            InitializeComponent();
        }

        private void btnLlamada1_Click(object sender, EventArgs e)
        {
            Ejemplo1 clase = new Ejemplo1();
            //modificado el valor
            clase.setCedula("88878787878");
            //presentando un valor
            MessageBox.Show(clase.getCedula());


            //*********************************

            Ejemplo2 clase2 = new Ejemplo2();
            //modificado el valor
            clase2.Cedula = "46464646464646";
            //presentando un valor
            MessageBox.Show(clase2.Cedula);
        }
    }
}
