using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia1
{
    public partial class CrudBasico : Form
    {

        List<string> lstNombres = new List<string>();

        public CrudBasico()
        {
            InitializeComponent();
            
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //agregamos nombre
            string nombre = tbxNombre.Text;
            lstNombres.Add(nombre);
            //limpiamos texto donde escribmos nombre
            tbxNombre.Text = string.Empty;
            //cargamos lista
            cargarLista();
//          

        }

        private void cargarLista() {

            //asignamos nuestra lista a un source para que automaticamente se actualice
            BindingSource source = new BindingSource();
            source.DataSource = lstNombres;
            //asignamos objeto source (que contiene la lista) a el control lbxlistanombre
            lbxListaNombres.DataSource = source;
        }

        private void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            //obtenemos el indice
            int indice = int.Parse(tbxIndice.Text);
            //modificamos el valor de la lista cuyo indice es igual a ?
            lstNombres[indice] =tbxModificarNombre.Text;
            //
            cargarLista();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            //obtenemos el indice
            int indice = int.Parse(tbxIndice.Text);
            //eliminamos el valor de la lista cuyo indice es igual a ?
            lstNombres.RemoveAt(indice);
            //
            cargarLista();
        }


        //eventos control "lbxListaNombres" cada vez que seleccionamos un item diferente
        private void lbxListaNombres_SelectedIndexChanged(object sender, EventArgs e)
        {
            //cada vez que selecciones un item de control "lbxListaNombres"
            //asignamos su indice a un control "tbxIndice" a su propiedad "Text"
            tbxIndice.Text = lbxListaNombres.SelectedIndex.ToString();
            //asignamos su texto a un control "tbxIndice" a su propiedad "Text"
            tbxModificarNombre.Text = lbxListaNombres.SelectedItem.ToString();
        }
    }
}
