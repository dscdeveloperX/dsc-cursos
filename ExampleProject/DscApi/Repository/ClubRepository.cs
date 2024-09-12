using Azure.Core;
using DscApi.Interface;
using DscApi.Models.Entity;
using DscApi.Models.Request;
using Microsoft.Data.SqlClient;
using System.Data;

namespace DscApi.Repository
{
    public class ClubRepository : IClub
    {



        private readonly string dscConnectionString;

        public ClubRepository(IConfiguration configuration)
        {
            dscConnectionString = configuration.GetConnectionString("dscconnectionstring");
        }



        public async Task<bool> ClubDelete(int id)
        {
            bool response = false;

            using (SqlConnection cnn = new SqlConnection(dscConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_DeleteClub", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ClubId", SqlDbType.Int) { Value = id, Direction = ParameterDirection.Input });

                    await cnn.OpenAsync();

                    response = Convert.ToBoolean(await cmd.ExecuteNonQueryAsync());


                }
            }

            return response;
        }

        public async Task<bool> ClubInsert(ClubAddModRequest request)
        {
            bool response = false;

            using (SqlConnection cnn = new SqlConnection(dscConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_InsertClub", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ClubNombre", SqlDbType.NVarChar) { Value = request.@ClubNombre, Size = 200, Direction = ParameterDirection.Input });
                    cmd.Parameters.Add(new SqlParameter("@ClubAlias", SqlDbType.NVarChar) { Value = request.@ClubAlias, Size = 200, Direction = ParameterDirection.Input });
                    cmd.Parameters.Add(new SqlParameter("@ClubColor", SqlDbType.NVarChar) { Value = request.@ClubColor, Size = 50, Direction = ParameterDirection.Input });
                    
                    await cnn.OpenAsync();

                    response = Convert.ToBoolean(await cmd.ExecuteNonQueryAsync());


                }
            }

            return response;
        }

        public async Task<List<Club>> ClubSelectAll()
        {
            List<Club> response = new List<Club>();

            using (SqlConnection cnn = new SqlConnection(dscConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ClubAll", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {

                        while (await dr.ReadAsync())
                        {

                            Club club = new Club()
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

        public async Task<List<Club>> ClubSelectById(int id)
        {
            
            List<Club> response = new List<Club>();

            using (SqlConnection cnn = new SqlConnection(dscConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ClubById", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ClubId", SqlDbType.Int) { Value = id, Direction = ParameterDirection.Input });
                    //
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {

                        while (await dr.ReadAsync())
                        {

                            Club club = new Club()
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

        public async Task<bool> ClubUpdate(ClubAddModRequest request)
        {
            bool response = false;

            using (SqlConnection cnn = new SqlConnection(dscConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_UpdateClub", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ClubId", SqlDbType.Int) { Value = request.ClubId, Direction = ParameterDirection.Input });
                    cmd.Parameters.Add(new SqlParameter("@ClubNombre", SqlDbType.NVarChar) { Value = request.ClubNombre, Size = 200, Direction = ParameterDirection.Input });
                    cmd.Parameters.Add(new SqlParameter("@ClubAlias", SqlDbType.NVarChar) { Value = request.ClubAlias, Size = 200, Direction = ParameterDirection.Input });
                    cmd.Parameters.Add(new SqlParameter("@ClubColor", SqlDbType.NVarChar) { Value = request.ClubColor, Size = 50, Direction = ParameterDirection.Input });


                    await cnn.OpenAsync();

                    response = Convert.ToBoolean(await cmd.ExecuteNonQueryAsync());


                }
            }

            return response;
        }
    }
}
