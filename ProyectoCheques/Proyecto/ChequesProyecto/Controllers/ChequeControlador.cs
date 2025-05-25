using ChequesProyecto.Interfaces;
using ChequesProyecto.Response;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using ChequesProyecto.Repositories;
using System.Data;
using ChequesProyecto.Data.Request;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/[controller]")]
    [ApiController]

    public class ChequeControlador : ControllerBase
    {
        private readonly string CadenaConexion;


        private readonly ICityRepository _cityRepository;
        private readonly IChequeRepository _chequeRepository;

        private readonly IReportTypeRepository _reportTypeRepository;

        public ChequeControlador(IConfiguration configuration, ICityRepository cityRepository, IChequeRepository chequeRepository, IReportTypeRepository reportTypeRepository)
        {
            CadenaConexion = configuration.GetConnectionString("apiconnectionstring");
            _cityRepository = cityRepository;
            _chequeRepository = chequeRepository;
            _reportTypeRepository = reportTypeRepository;

        }




        [HttpPost]

        public async Task<IActionResult> ChequeCreate(ChequeCreateRequest request)
        {
            return Ok(await _chequeRepository.ChequeCreate(request));
        }





        [HttpGet("cities")]
        public async Task<IActionResult> CityGetAll()
        {
            return Ok(await _cityRepository.CityGetAll());

        }

        [HttpGet("reports")]
        public async Task<IActionResult> ReportGetAll()
        {
            return Ok (await _reportTypeRepository.ReportGetAll());
        }


    }
}
