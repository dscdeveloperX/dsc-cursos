using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CSharpBasico.Dia33;

namespace CSharpBasico.Dia3
{
    public partial class FormularioPrincipal : Form
    {
        public FormularioPrincipal()
        {
            InitializeComponent();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            LlamadaExterna();
        }

        private void LlamadaExterna()
        {
            double sueldo = 0, iess = 0, netoPagar = 0;
            //Calculo varCalculo = new Calculo();
            sueldo =double.Parse( txbSueldo.Text);
            Calculo clCalculo = new Calculo();
            iess= clCalculo.CalculoIess(sueldo);
            lblIess.Text = iess.ToString();
            netoPagar = sueldo - iess;
            lblNeto.Text = netoPagar.ToString();
            

        }

        private void btnDatosPersonales_Click(object sender, EventArgs e)
        {
            DatosPersonales DatosCedula = new DatosPersonales();
           
            MessageBox.Show(DatosCedula.Datos("091872345"),"burrito");
            MessageBox.Show(DatosCedula.Datos("091872345","25"));
     
        }





        private void btnAnimal_Click(object sender, EventArgs e)
        {
            //crear una nueva instancia o copia de la clase animal
            F1 formulaUno = new F1(550);

            //vamos a mostrar el valor de nombre antes del cambio
            MessageBox.Show(formulaUno.velocidadLimite.ToString());

            formulaUno.velocidadLimite = 200;

            //vamos a mostrar el valor de nombre despues del cambio
            MessageBox.Show(formulaUno.velocidadLimite.ToString());

            
        }







        private void btnEjemploCampo_Click(object sender, EventArgs e)
        {
            //creamos una nueva instancia del objeto de clase ejemplocampo
            EjemploCampo clase1 = new EjemploCampo();
            clase1.Hola();
            //clase1.Adios();
            
            
        }






    }
}
