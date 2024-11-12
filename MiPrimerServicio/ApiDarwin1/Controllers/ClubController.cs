using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using Microsoft.Data.SqlClient;

namespace ApiDarwin1.Controllers
{


    [Route("public/v2/[controller]")]
    [ApiController]
    public class ClubController : ControllerBase
    {



        //variable donde guardaremos la cadena de conexion
        private readonly string miCadenaConeccion;

        public ClubController(IConfiguration configuration) {
            //injectamos la configuracion del archivo aap.setting.json para obtener la cadena de conexion "miCadenaConeccion"
            miCadenaConeccion = configuration.GetConnectionString("conectionDarwin");
        }







        [HttpGet]
        public List<ClubResponse> ClubTodos()
        {

            List<ClubResponse> clubes = new List<ClubResponse> ();
            
            ClubResponse club1 = new ClubResponse();
            club1.ClubId = 1;
            club1.ClubNombre = "Real Madrid";
            club1.ClubAlias = "cuadro merengue";
            club1.ClubColor = "blanco";

            ClubResponse club2 = new ClubResponse();
            club2.ClubId = 2;
            club2.ClubNombre = "Barcelona real";
            club2.ClubAlias = "barca";
            club2.ClubColor = "azul grana";

            clubes.Add(club1);
            clubes.Add(club2);


            return clubes;
        }





        [HttpGet("{id}")]
        public List<ClubResponse> ClubTodos(int id)
        {

            List<ClubResponse> clubes = new List<ClubResponse>();

            ClubResponse club1 = new ClubResponse();
            club1.ClubId = 1;
            club1.ClubNombre = "Real Madrid";
            club1.ClubAlias = "cuadro merengue";
            club1.ClubColor = "blanco";

            ClubResponse club2 = new ClubResponse();
            club2.ClubId = 2;
            club2.ClubNombre = "Barcelona real";
            club2.ClubAlias = "barca";
            club2.ClubColor = "azul grana";

            clubes.Add(club1);
            clubes.Add(club2);


            return clubes.Where(x=>x.ClubId == id).ToList();
        }







        [HttpGet("all")]
        public async Task<List<ClubResponse>> ClubAll()
        {

            List<ClubResponse> response = new List<ClubResponse>();

            using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SelectAllClub", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {

                        while (await dr.ReadAsync())
                        {

                            ClubResponse club = new ClubResponse()
                            {
                                ClubId = Convert.ToInt32(dr["ClubId"]),
                                ClubNombre = dr["ClubNombre"].ToString(),
                                ClubAlias = dr["ClubAlias"].ToString(),
                                ClubColor = dr["ClubColor"].ToString()
                            };

                            response.Add(club);

                        }

                    }

                }
            }

            return response;

        }




        /*
        [HttpGet("todos")]
        public string Saludos ()
        {
            return "hola a todos";
        }

        [HttpGet("mi-nombre/{id}")]

        public string Saludo (string id)
        {
            return $"hola {id}";
        }
        */


    }
}
