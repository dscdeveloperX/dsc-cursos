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
    [Route("api/v1/[Controller]")]
    [ApiController]
    [EnableCors("dsccors")]
    public class ClubClubler : ControllerBase
    {

        private readonly IClub _clubRepository;
        public ClubClubler(IClub clubRepository)
        {
            _clubRepository = clubRepository;
        }



        [HttpGet("Select/{id:int}")]
        public async Task<ActionResult<ClubResponse>> GetSelect(int id)
        {
            ClubResponse response = new ClubResponse();
            List<Club> data = new List<Club>();


            try
            {
                data = await _clubRepository.ClubSelectById(id);
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Clubes = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1000;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Clubes = data;
            }
            return response;
        }




        [HttpGet("SelectAll")]
        public async Task<ActionResult<ClubResponse>> GetSelectAll()
        {
            ClubResponse response = new ClubResponse();
            List<Club> data = new List<Club>();


            try
            {
                data = await _clubRepository.ClubSelectAll();
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Clubes = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1000;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Clubes = data;
            }
            return response;
        }



        [HttpPost("Post")]
        public async Task<ActionResult<ClubResponse>> Post([FromBody] ClubAddModRequest request)
        {
            ClubResponse response = new ClubResponse();
            List<Club> data = new List<Club>();

            try
            {
                if (!await _clubRepository.ClubInsert(request))
                {
                    throw new Exception("no se insertaron registros");
                }
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Clubes = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1010;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Clubes = data;
            }
            return response;
        }



        [HttpPut("Put")]
        public async Task<ActionResult<ClubResponse>> Put([FromBody] ClubAddModRequest request)
        {
            ClubResponse response = new ClubResponse();
            List<Club> data = new List<Club>();

            try
            {
                if (!await _clubRepository.ClubUpdate(request))
                {
                    throw new Exception("no se modifico el registro");
                }
                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Clubes = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1002;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Clubes = data;
            }
            return response;
        }


        [HttpDelete("Detele/{id:int}")]
        public async Task<ActionResult<ClubResponse>> Delete(int id)
        {
            ClubResponse response = new ClubResponse();
            List<Club> data = new List<Club>();

            try
            {
                if (!await _clubRepository.ClubDelete(id))
                {
                    throw new Exception("no se elimino registro");
                }


                response.ErrorCodigo = 0;
                response.ErrorMensaje = "Transacion exitosa";
                response.Clubes = data;
            }
            catch (Exception ex)
            {

                response.ErrorCodigo = 1003;
                response.ErrorMensaje = "Error: " + ex.Message;
                response.Clubes = data;
            }
            return response;
        }







    }
}
