﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;


namespace ApiDarwin1.Controllers
{
    [EnableCors("dsccors")]
    [Route("public/v2/[controller]")]
    [ApiController]
    public class AnimalController : Controller
    {
        private readonly string MiCadenaConexion;
        public AnimalController(IConfiguration configuration)
        {
            MiCadenaConexion = configuration.GetConnectionString("conectionPapito");
        }

        [HttpGet]
        public async Task<List<AnimalResponse>> Animal()
        {
            List<AnimalResponse> animales = new List<AnimalResponse>();
            using (SqlConnection cnn = new SqlConnection(MiCadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SelectAllAnimal", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            AnimalResponse animal = new AnimalResponse()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Color = dr["Color"].ToString(),
                                Patas = Convert.ToInt32( dr["Patas"])
                            };
                            animales.Add(animal);

                        };
                    }

                }
                return animales;
            }

        }

        [HttpGet("{id}")]
        public async Task<AnimalResponse> Animal(int id)
        {
            AnimalResponse animal = new AnimalResponse();
            using (SqlConnection cnn = new SqlConnection(MiCadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SelectByIdAnimal", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", id));
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            animal.Id = Convert.ToInt32(dr["Id"]);
                            animal.Nombre = dr["Nombre"].ToString();
                            animal.Color = dr["Color"].ToString();
                            animal.Patas = Convert.ToInt32( dr["Patas"]);
                        }
                    }
                }
            }
            return animal;

        }


        [HttpGet("Patas/{patas}/Color/{color}")]
        public async Task<List <AnimalResponse>> AnimalFilter(int patas,string color)
        {
           List< AnimalResponse> animales = new List< AnimalResponse>();
            using (SqlConnection cnn = new SqlConnection(MiCadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AnimalFilter", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Patas", patas));
                    cmd.Parameters.Add(new SqlParameter("@Color", color));
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            AnimalResponse animal = new AnimalResponse(); 
                            animal.Id = Convert.ToInt32(dr["Id"]);
                            animal.Nombre = dr["Nombre"].ToString();
                            animal.Color = dr["Color"].ToString();
                            animal.Patas = Convert.ToInt32(dr["Patas"]);
                            animales.Add(animal);
                        }
                    }
                }
            }
            return animales;

        }


        [HttpPost]
        public async Task<bool> Post(AnimalRequest request)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(MiCadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_InsertAnimal", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Nombre", request.Nombre));
                        cmd.Parameters.Add(new SqlParameter("@Color", request.Color));
                        cmd.Parameters.Add(new SqlParameter("@Patas", request.Patas));

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

        [HttpPut("{id}")]

        public async Task<bool> Put(AnimalRequest request, int id)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(MiCadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_UpdateAnimal", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Id", id));
                        cmd.Parameters.Add(new SqlParameter("@Nombre", request.Nombre));
                        cmd.Parameters.Add(new SqlParameter("@Color", request.Color));
                        cmd.Parameters.Add(new SqlParameter("@Patas", request.Patas));
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

        [HttpDelete("{id}")]

        public async Task<bool> Delete(int id)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(MiCadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_DeleteAnimal", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Id", id));

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
