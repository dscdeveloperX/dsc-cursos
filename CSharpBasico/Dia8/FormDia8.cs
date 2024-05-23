using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CSharpBasico.Dia8
{
    public partial class FormDia8 : Form
    {
        public FormDia8()
        {
            InitializeComponent();
        }

        private void btnSelect1_Click(object sender, EventArgs e)
        {
            select();
            

            
            
        }


        private void select() {

            //cadena de conexion
            string cadenaConexion = @"Data source=DSC-PC\ISQL; Initial Catalog=darwincito_db; Integrated Security=True; Password=son200420052012";
            //probar la conexion a base de datos
            //objeto conexion
            using (SqlConnection cnn = new SqlConnection(cadenaConexion))
            {

                //objeto comando
                using (SqlCommand cmd = new SqlCommand("sp_animalSelect", cnn))
                {
                    //indicamos que este comando es un procedimiento almacenado
                    cmd.CommandType = CommandType.StoredProcedure;
                    //agregando parametro tipovalor con valor = perro
                    cmd.Parameters.Add(new SqlParameter("@TipoValor", tbxTipo.Text));

                    //abrir la conexion
                    cnn.Open();
                    //ejecutar comando y lo guardamos en una variable dr que es de tipo datareader

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        //leer data reader
                        while (dr.Read())
                        {
                            MessageBox.Show($"nombre: {dr["Nombre"].ToString()}, Color: {dr["Color"].ToString()}");
                        }



                    }


                }


            }
        }



    }
}


//@TipoValor varchar(20)

/*SqlParameter tipo = new SqlParameter();
tipo.ParameterName = "@TipoValor";
tipo.Value = "perro";
cmd.Parameters.Add(tipo);*/
