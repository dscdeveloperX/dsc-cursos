using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia5
{
    public partial class FormularioDia5 : Form
    {
        public FormularioDia5()
        {
            InitializeComponent();
        }

        private void btnLlamada1_Click(object sender, EventArgs e)
        {
            //lista de clases empleado
           List<Empleado> listaEmp = new List<Empleado>();


            //creaste una clase empleado y le asignaste valores
            Empleado emp1 = new Empleado();
            //le asignamos valores
            emp1.Cedula = "0000000001";
            emp1.Nombre = "Viejo";
            emp1.Edad = 35;
            emp1.Hola();
            //agrego empleado a la lista
            listaEmp.Add(emp1);

            

            //******************************************

            //creaste una clase empleado y le asignaste valores
            Empleado emp2 = new Empleado();
            //le asignamos valores
            emp2.Cedula = "0000000002";
            emp2.Nombre = "Burro";
            emp2.Edad = 46;

            //agrego empleado a la lista
            listaEmp.Add(emp2);

            //******************************************
            //recorro la lista de empleados
            foreach (Empleado empleado in listaEmp) {
                //presento los valores de las propiedades de empleados
                MessageBox.Show($"cedula: {empleado.Cedula}, nombre: {empleado.Nombre}, edad: {empleado.Edad}");

            }

        }

        private void btnLlamada2_Click(object sender, EventArgs e)
        {
            //lista de clases empleado
            List<Empleado> listaEmp = new List<Empleado>();


            
            //agrego empleado a la lista
            listaEmp.Add(

            new Empleado() {
            Cedula = "000121313",
            Nombre = "Darwin",
            Edad = 25
           
            }
            
            );

            //******************************************

            //agrego empleado a la lista
            listaEmp.Add(

            new Empleado()
            {
                Cedula = "1112223333",
                Nombre = "Tommy",
                Edad = 11
            }

            );


            //******************************************
            //recorro la lista de empleados
            foreach (Empleado empleado in listaEmp)
            {
                //presento los valores de las propiedades de empleados
                MessageBox.Show($"cedula: {empleado.Cedula}, nombre: {empleado.Nombre}, edad: {empleado.Edad}");

            }
        }
    }
}
