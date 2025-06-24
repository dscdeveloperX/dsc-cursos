
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using ChequesProyecto.Repositories;
using System.Data;
using ChequesProyecto.Repositories.ReportType;
using ChequesProyecto.Repositories.Cheque;
using ChequesProyecto.Repositories.City;
using ChequesProyecto.Entities.Cheque;
using iTextSharp.text.pdf;
using iTextSharp.text;
using ChequesProyecto.Services.Cheque;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/v1/[controller]")]
    [ApiController]

    public class ChequeController : ControllerBase
    {

        private readonly IChequeService _chequeService;
        
        public ChequeController(IChequeService chequeService)
        {
            _chequeService = chequeService;

        }




        [HttpPost]

        public async Task<IActionResult> ChequeCreate(ChequeCreateRequest chequeCreateRequest)
        {
            try
            {
                return Ok(await _chequeService.CreateCheque(chequeCreateRequest));
            }
            catch (Exception ex) {
                return StatusCode(500, new { error = ex.Message});
            }
        }





      

       


        [HttpPost("cheque-report")]
        public async Task<IActionResult> ChequeReport(ChequeReportRequest chequeReportRequest)
        {
            List<ChequeReportResponse> chequeData = await _chequeService.GetChequeReport(chequeReportRequest);
            //return Ok( await _reportRepository.GetChequeReport(chequeRequest));
            byte[] pdfBytes = await _chequeService.GenerateChequeReport(chequeData,"general");

            return File(pdfBytes, "application/pdf", "ChequeGenerado.pdf");
        }



        [HttpPost("receipt-report")]
        public async Task<IActionResult> ReceiptReport(ChequeReportRequest chequeReportRequest)
        {
            //return Ok( await _reportRepository.GetChequeReport(chequeRequest));
            //byte[] pdfBytes = await _chequeService.PdfGenerateRolPago(chequeReportRequest,"general");
            return Ok();
            //return File(pdfBytes, "application/pdf", "ChequeGenerado.pdf");
        }




    }
}
