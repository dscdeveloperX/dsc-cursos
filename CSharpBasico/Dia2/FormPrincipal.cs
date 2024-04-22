using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CSharpBasico.Dia2;

namespace CSharpBasico.Dia2
{
    public partial class FormPrincipal : Form
    {
        public FormPrincipal()
        {
            InitializeComponent();
        }

        private void btnLlamar_Click(object sender, EventArgs e)
        {
            CalculosMatematicos calculos = new CalculosMatematicos();
            double resultado = calculos.Suma(54, 45);
            lblResultado.Text = resultado.ToString();

            CalculosMatematicos calculos2 = new CalculosMatematicos();
            double resultado2 = calculos2.Resta(33, 23);
            MessageBox.Show(resultado2.ToString());

            CalculosMatematicos nombre = new CalculosMatematicos();
            MessageBox.Show( nombre.Saludo("darwin"));


            CalculosMatematicos saludo = new CalculosMatematicos() ;
            MessageBox.Show (saludo.Nombre("hello"));

            //*****************

            /*List<string> lista = new List<string>(){ "darwin","wilson","laura","jose"};


            foreach (string item in lista) {
                MessageBox.Show(nombre.Saludo(item));
            }*/


        }
    }
}
