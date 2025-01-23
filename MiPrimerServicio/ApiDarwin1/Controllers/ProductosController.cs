using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ApiDarwin1.Controllers
{
    [EnableCors("dsccors")]
    [Route("public/v2/[Controller]")]
    [ApiController]
    public class ProductosController : Controller
    {
        private readonly string miCadenaConexion;
        public ProductosController(IConfiguration configuration)
        {
            miCadenaConexion = configuration.GetConnectionString("conectionPapito");
        }

        [HttpGet]
        public async Task<List<ProductoResponse>> Producto()
        {
            List<ProductoResponse> productos = new List<ProductoResponse>();
            using (SqlConnection cnn = new SqlConnection(miCadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AllProducts", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            ProductoResponse producto = new ProductoResponse()
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Categoria = dr["Categoria"].ToString(),
                                Precio = Convert.ToDecimal( dr["Precio"]),
                                Stock = Convert.ToInt32( dr["Stock"]),
                                Estado = Convert.ToBoolean( dr["Estado"])

                            };
                            productos.Add(producto);
                            
                        };
                    }
                }
            }
            return productos;
        
        }

        [HttpGet("{id}")]
        public async Task<ProductoResponse> Producto(int id)

        {

            ProductoResponse producto = new ProductoResponse();
           
            using (SqlConnection cnn = new SqlConnection(miCadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ProductsById", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", id));
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            producto.Id = Convert.ToInt32(dr["Id"]);
                            producto.Nombre = dr["Nombre"].ToString();
                            producto.Categoria = dr["Categoria"].ToString();
                            producto.Precio =  Convert.ToDecimal( dr["Precio"]);
                            producto.Stock = Convert.ToInt32 (dr["Stock"]);
                            producto.Estado = Convert.ToBoolean( dr["Estado"]);
                        }
                    }
                }
            }
            return producto;

        }
        [HttpGet("Estado/{estado}/Stock/{stock}/Precio/{precio}")]
        public async Task<List<ProductoResponse>> ProductosFilter(bool estado,int stock,decimal precio)
        {
            List<ProductoResponse> productos = new List<ProductoResponse>();
            using (SqlConnection cnn = new SqlConnection(miCadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ProductsFilter1", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Estado", estado));
                    cmd.Parameters.Add(new SqlParameter("@Stock", stock));
                    cmd.Parameters.Add(new SqlParameter("@Precio", precio));
                    await cnn.OpenAsync();
                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            ProductoResponse producto = new ProductoResponse();
                            producto.Id = Convert.ToInt32( dr["Id"]);
                            producto.Nombre = dr["Nombre"].ToString();
                            producto.Categoria = dr["Categoria"].ToString();
                            producto.Precio = Convert.ToDecimal( dr["Precio"]);
                            producto.Stock = Convert.ToInt32( dr["Stock"]);
                            producto.Estado = Convert.ToBoolean( dr["Estado"]);

                            productos.Add(producto);

                        }
                    }
                }
            } 
            return productos;
        }

        [HttpPost]
        public async Task<bool> Post(ProductoRequest request)
        {
            try
            {
                using(SqlConnection cnn = new SqlConnection(miCadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ProductsInsert", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Nombre", request.Nombre));
                        cmd.Parameters.Add(new SqlParameter("@Categoria", request.Categoria));
                        cmd.Parameters.Add(new SqlParameter("@Stock", request.Stock));
                        cmd.Parameters.Add(new SqlParameter("@Estado", request.Estado));
                        cmd.Parameters.Add(new SqlParameter("@Precio", request.Precio));

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



        [HttpPut("{id:int}")]
        public async Task<bool> Put(int id,ProductoRequest request)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(miCadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ProductsUpdate", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Id", id));
                        cmd.Parameters.Add(new SqlParameter("@Nombre", request.Nombre));
                        cmd.Parameters.Add(new SqlParameter("@Categoria", request.Categoria));
                        cmd.Parameters.Add(new SqlParameter("@Stock", request.Stock));
                        cmd.Parameters.Add(new SqlParameter("@Estado", request.Estado));
                        cmd.Parameters.Add(new SqlParameter("@Precio", request.Precio));

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

        [HttpDelete("{id:int}")]
        public async Task<bool> Delete(int id)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(miCadenaConexion))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ProductsDelete", cnn))
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
            
               
            
 
