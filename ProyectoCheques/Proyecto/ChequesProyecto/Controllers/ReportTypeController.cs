using ChequesProyecto.Entities.Cheque;
using ChequesProyecto.Repositories.ReportType;
using ChequesProyecto.Services.ReportType;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Xml;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ReportTypeController : ControllerBase
    {
        //private readonly IWebHostEnvironment _env;
        private readonly IReportTypeService _reportTypeService;
        public ReportTypeController(IReportTypeService reportTypeService)
        {
            _reportTypeService = reportTypeService;
        }


        [HttpGet("report-type")]
        public async Task<IActionResult> GetReportTypetAll()
        {
            try { 
            return Ok(await _reportTypeService.GetReportTypeAll());
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }


    }






}
