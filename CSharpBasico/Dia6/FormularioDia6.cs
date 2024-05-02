using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia6
{
    public partial class FormularioDia6 : Form
    {
        //campo animales lista
        public List<Animal> Animales = new List<Animal>();
        public FormularioDia6()
        {
            InitializeComponent();
        }

        private void btnLlamada1_Click(object sender, EventArgs e)
        {
            //coleccion de clases
            List<Animal> animales = new List<Animal>();

            //agregar elementos a la lista forma abrev
            animales.Add(
                new Animal ()
                {
                    AnimalId = 1,
                    Tipo = "perro",
                    Nombre = "kafu",
                    Color = "negro",
                    Pedigri = false
                }
                );


            animales.Add(
               new Animal
               {
                   AnimalId = 2,
                   Tipo = "perro",
                   Nombre = "risas",
                   Color = "amarillo",
                   Pedigri = false
               }
                );

            animales.Add(
              new Animal
              {
                  AnimalId = 3,
                  Tipo = "loro",
                  Nombre = "rosendo",
                  Color = "verde",
                  Pedigri = true
              }
               );

            //llenar con datos el gridview
                       ///
            gridAnimales.DataSource = animales;


        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //crear un registro
            Animal animal = new Animal();
            animal.AnimalId = int.Parse(tbxAnimalId.Text);
            animal.Tipo = tbxTipo.Text;
            animal.Nombre = tbxNombre.Text;
            animal.Color = tbxColor.Text;
            animal.Pedigri = cbxPedigri.Checked;
            
            //agregar registro a tabla 
            Animales.Add(animal);
            
            //visualizar lista en el gridview
            BindingSource source = new BindingSource();
            source.DataSource = Animales;
            gridAnimales.DataSource = source;
            
            //limpiar para volver a agregar 
            tbxAnimalId.Text = string.Empty;
            tbxTipo.Text = string.Empty;
            tbxNombre.Text = string.Empty;
            tbxColor.Text = string.Empty;
            cbxPedigri.Checked = false;




        }
    }
}
