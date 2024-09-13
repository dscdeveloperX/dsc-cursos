using Azure.Core;
using DscApi.Interface;
using DscApi.Models.Response;
using DscApi.Models.Entity;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DscApi.Models.Request;

namespace DscApi.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [EnableCors("dsccors")]
    public class ClubController : ControllerBase
    {

        private readonly IClub _clubRepository;
        public ClubController(IClub clubRepository)
        {
            _clubRepository = clubRepository;
        }



        [HttpGet("{id:int}")]
        public async Task<ActionResult<DataResponse<Club>>> GetById(int id)
        {
            DataResponse<Club> response = new DataResponse<Club>();
            List<Club> data = new List<Club>();


            try
            {
                data = await _clubRepository.SelectByIdClub(id);
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Data = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1000;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Data = data;
            }
            return response;
        }




        [HttpGet]
        public async Task<ActionResult<DataResponse<Club>>> Get()
        {
            DataResponse<Club> response = new DataResponse<Club>();
            List<Club> data = new List<Club>();


            try
            {
                data = await _clubRepository.SelectAllClub();
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Data = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1000;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Data = data;
            }
            return response;
        }



        [HttpPost("Post")]
        public async Task<ActionResult<DataResponse<Club>>> Post([FromBody] ClubInsertRequest request)
        {
            DataResponse<Club> response = new DataResponse<Club>();
            List<Club> data = new List<Club>();

            try
            {
                if (!await _clubRepository.InsertClub(request))
                {
                    throw new Exception("no se insertaron registros");
                }
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Data = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1010;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Data = data;
            }
            return response;
        }



        [HttpPut("Put")]
        public async Task<ActionResult<DataResponse<Club>>> Put([FromBody] ClubUpdateRequest request)
        {
            DataResponse<Club> response = new DataResponse<Club>();
            List<Club> data = new List<Club>();

            try
            {
                if (!await _clubRepository.UpdateClub(request))
                {
                    throw new Exception("no se modifico el registro");
                }
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Data = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1002;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Data = data;
            }
            return response;
        }


        [HttpDelete("{id:int}")]
        public async Task<ActionResult<DataResponse<Club>>> Delete(int id)
        {
            DataResponse<Club> response = new DataResponse<Club>();
            List<Club> data = new List<Club>();

            try
            {
                if (!await _clubRepository.DeleteClub(id))
                {
                    throw new Exception("no se elimino registro");
                }


                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Data = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1003;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Data = data;
            }
            return response;
        }







    }
}
