using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;

namespace ApiDarwin1.Controllers
{

    [EnableCors("dsccors")]
    [Route("public/v2/[controller]")]
    [ApiController]
    public class ClubController : ControllerBase
    {



        //variable donde guardaremos la cadena de conexion
        private readonly string miCadenaConeccion;

        public ClubController(IConfiguration configuration)
        {
            //injectamos la configuracion del archivo aap.setting.json para obtener la cadena de conexion "miCadenaConeccion"
            miCadenaConeccion = configuration.GetConnectionString("conectionDarwin");
        }







        [HttpGet]
        public List<ClubResponse> ClubTodos()
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


            return clubes;
        }

        [HttpGet("f1")]
        public List<F1Response> F1Teams()
        {
            List<F1Response> teams = new List<F1Response>();
            F1Response f1Team1 = new F1Response();
            f1Team1.TeamPosition = 1;
            f1Team1.TeamName = "Mclaren";
            f1Team1.Driver1 = "Lando Norris";
            f1Team1.Driver2 = "Oscar Piastri";
            f1Team1.CarName = "Mcl24";


            F1Response f1Team2 = new F1Response();
            f1Team2.TeamPosition = 2;
            f1Team2.TeamName = "Ferrari";
            f1Team2.Driver1 = "Charles Leclerc";
            f1Team2.Driver2 = "Carlos Sainz";
            f1Team2.CarName = "sf100";

            teams.Add(f1Team1);
            teams.Add(f1Team2);

            return teams;

        }






        [HttpGet("clubId{id}")]

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


            return clubes.Where(x => x.ClubId == id).ToList();
        }

        [HttpGet("f1position{position}")]
        public List<F1Response> F1Todos(int position)
        {
            List<F1Response> teams = new List<F1Response>();

            F1Response f1Team1 = new F1Response();
            f1Team1.TeamPosition = 1;
            f1Team1.TeamName = "Mclaren";
            f1Team1.Driver1 = "Lando Norris";
            f1Team1.Driver2 = "Oscar Piastri";
            f1Team1.CarName = "Mcl24";


            F1Response f1Team2 = new F1Response();
            f1Team2.TeamPosition = 2;
            f1Team2.TeamName = "Ferrari";
            f1Team2.Driver1 = "Charles Leclerc";
            f1Team2.Driver2 = "Carlos Sainz";
            f1Team2.CarName = "sf100";

            teams.Add(f1Team1);
            teams.Add(f1Team2);

            return teams.Where(x => x.TeamPosition == position).ToList();
        }

        [HttpGet("all/f1")]
        //async y task nos indican una tarea que se ejecutara sin bloquear otras, muy util para conectarse a bases
        public async Task<List<F1Response>> F1Todos()
        {
            List<F1Response> response = new List<F1Response>();
            using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AllTeams", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())

                        {
                            F1Response f1 = new F1Response()
                            {
                                TeamPosition = Convert.ToInt32(dr["Posicion"]),
                                TeamName = dr["NombreEquipo"].ToString(),
                                Driver1 = dr["Conductor1"].ToString(),
                                Driver2 = dr["Conductor2"].ToString(),
                                CarName = dr["NombreAuto"].ToString()
                            };
                            response.Add(f1);
                        };
                    }
                }
            }
            return response;
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

        [HttpGet("{id}")]
        public async Task<ClubResponse> ClubId(int id)
        {
            ClubResponse club = new ClubResponse();

            using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SelectByIdClub", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ClubId", id));
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            club.ClubId = Convert.ToInt32(dr["ClubId"]);
                            club.ClubNombre = dr["ClubNombre"].ToString();
                            club.ClubAlias = dr["ClubAlias"].ToString();
                            club.ClubColor = dr["ClubColor"].ToString();




                        }

                    }

                }

            }
            return club;
        }





        [HttpGet("f1Id/{id}")]
        public async Task<F1Response> F1Id(int id)
        {
            F1Response response = new F1Response();
            using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AllEquipo", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Posicion", id));
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            response.TeamPosition = Convert.ToInt32(dr["Posicion"]);
                            response.TeamName = dr["NombreEquipo"].ToString();
                            response.Driver1 = dr["Conductor1"].ToString();
                            response.Driver2 = dr["Conductor2"].ToString();
                            response.CarName = dr["NombreAuto"].ToString();


                        }
                    }

                }
            }
            return response;
        }






        /* [HttpPost("f1Add}")]
         public async Task<List<F1Response>> F1Response()
         {
             List<F1Response> f1response = new List<F1Response>();
             using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
             {
                 using (SqlCommand cmd = new SqlCommand("",)) ;

             }


         }*/



        [HttpPost]
        public async Task<bool> Post(ClubRequest request)

        {

            try
            {

                using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_InsertClub", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@ClubNombre", request.ClubNombre));
                        cmd.Parameters.Add(new SqlParameter("@ClubAlias", request.ClubAlias));
                        cmd.Parameters.Add(new SqlParameter("@ClubColor", request.ClubColor));

                        await cnn.OpenAsync();

                        await cmd.ExecuteNonQueryAsync();
                        return true;
                    }

                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        [HttpPost("F1")]
        public async Task<bool> Post(F1Response request)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_AddTeam", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@NombreEquipo", request.TeamName));
                        cmd.Parameters.Add(new SqlParameter("@Conductor1", request.Driver1));
                        cmd.Parameters.Add(new SqlParameter("@Conductor2", request.Driver2));
                        cmd.Parameters.Add(new SqlParameter("@NombreAuto", request.CarName));
                        await cnn.OpenAsync();
                        await cmd.ExecuteNonQueryAsync();
                        return true;
                    }
                }
                        
            } catch(Exception ex) {
                return false;
            }
        }

        [HttpPut("{id}")]
        public async Task<bool> Put(ClubRequest request, int id)
        {

            try
            {
                using (SqlConnection cnn = new SqlConnection(miCadenaConeccion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_UpdateClub", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@ClubId", id));
                        cmd.Parameters.Add(new SqlParameter("@ClubNombre", request.ClubNombre));
                        cmd.Parameters.Add(new SqlParameter("@ClubAlias", request.ClubAlias));
                        cmd.Parameters.Add(new SqlParameter("@ClubColor", request.ClubColor));

                        await cnn.OpenAsync();

                        await cmd.ExecuteNonQueryAsync();
                        return true;
                    }
                }

            }
            catch (Exception ex)
            {
                return false;
            }



        }




    }


   
}





    
    
