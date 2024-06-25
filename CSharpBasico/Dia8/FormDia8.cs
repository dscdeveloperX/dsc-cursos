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
            //select();
            SelectPersona(tbxTipo.Text,Convert.ToDecimal( tbxSueldo.Text));




        }

        private void SelectPersona (string es,decimal sld)
        {
            //cadena de conexion
            string cadenaConexion = @"Data source=DSC-PC\ISQL; Initial Catalog=darwincito_db; Integrated Security=True; Password=son200420052012";

            //clase conexion
            SqlConnection cnn = new SqlConnection(cadenaConexion);

            //clase commando
            //(a) establecido nombre del SP
            //(a) establecido la clase conexion
            //(b) establecido tipo de comando que es igual a un tipo "SP"
            SqlCommand cmd = new SqlCommand("sp_PersonaSelect", cnn);//(a)
            cmd.CommandType = CommandType.StoredProcedure;//(b)

            //clase parametros
            //(a) nombre del parametro
            //(b) tipo parametro
            //(c) tamaño del tipo si es texto 
            //(d) valor del parametro
            SqlParameter prmEstadoCivil = new SqlParameter();
            prmEstadoCivil.ParameterName = "@EstadoCivil";//(a)
            prmEstadoCivil.SqlDbType = SqlDbType.VarChar;//(b)
            prmEstadoCivil.Size = 1;//(c)
            prmEstadoCivil.Value = es;//(d)

            //agregar parametros a la clase comando
            cmd.Parameters.Add(prmEstadoCivil);

            SqlParameter prmSueldo = new SqlParameter();
            prmSueldo.ParameterName = "@Sueldo";
            prmSueldo.SqlDbType = SqlDbType.Decimal;
            prmSueldo.Value = sld;
            cmd.Parameters.Add(prmSueldo);
            

            //abrir la conexion de la clase conexion
            cnn.Open();


            //ejuctamos comando y su resultado lo guardamos en una variable de tipo sqlDataReader
            //DataReader almacena datos temporalmente en memoria
            //DataReader solo puede leer los datos hacia adelante
            SqlDataReader dr = cmd.ExecuteReader();

            //creamos una lista de clases "persona"
            List<Persona> ListaPersonas = new List<Persona>();

            //recorrer la data siempre que exista un registro
            //si existe un registro el dataRead con su metodo Read() devolvera "True"
            while (dr.Read()) {

                //crear una clase persona y llenar sus propiedades con el resultado del DataReader
                Persona persona = new Persona();
                persona.PersonaId = Convert.ToInt32( dr["PersonaId"]);
                persona.Cedula =  dr["Cedula"].ToString();
                persona.Nombre= dr["Nombre"].ToString();
                persona.EstadoCivil = dr["EstadoCivil"].ToString();
                persona.Sueldo = Convert.ToDecimal (dr["Sueldo"]);

                //agregar clase persona a la lista de personas
                ListaPersonas.Add(persona);
            }

            //visualizar lista de personas en el gridview
            BindingSource source = new BindingSource();
            source.DataSource = ListaPersonas;
            GridPersona.DataSource = source;


            //cerrado la conexion de la clase conexion
            cnn.Close();
            //cerramos el datareader
            dr.Close();
            




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
