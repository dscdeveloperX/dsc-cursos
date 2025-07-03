
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
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using iTextSharp.text;
using ChequesProyecto.Services.Cheque;
using Microsoft.AspNetCore.Server.IIS.Core;

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
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }










        [HttpPost("cheque-report")]
        public async Task<IActionResult> ChequeReport(ChequeReportRequest chequeReportRequest)
        {
            List<ChequeReportResponse> chequeData = await _chequeService.GetChequeReport(chequeReportRequest);
            //return Ok( await _reportRepository.GetChequeReport(chequeRequest));
            byte[] pdfBytes = await _chequeService.GenerateChequeReport(chequeData, "general");

            return File(pdfBytes, "application/pdf", "ChequeGenerado.pdf");
        }

        [HttpPost("cheque-date-range-report")]
        public async Task<IActionResult> GetChequesByDateRange(ChequesGetByDateRangeRequest chequesGetByDateRangeRequest)
        {
            List<ChequeReportResponse> chequeData = await _chequeService.GetChequesByDateRange(chequesGetByDateRangeRequest);
            //return Ok( await _reportRepository.GetChequeReport(chequeRequest));
            byte[] pdfBytes = await _chequeService.GenerateChequeDateRangeReport(chequeData);

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




        [HttpPost("generate")]
        public async Task<IActionResult> Generate([FromForm] ChequeBatchCreate chequeBatchCreate)
        {
            return Ok(await _chequeService.GenerarCheques(chequeBatchCreate));
        }




        /*
        public static string CellValue(SpreadsheetDocument spreadsheetDocument, string sheetName, string column, int row)
        {

            //using (SpreadsheetDocument spreadsheetDocument = SpreadsheetDocument.Open(document, false))
            //{
            //Sheets sheets = spreadsheetDocument.WorkbookPart.Workbook.GetFirstChild<Sheets>();
            Sheet theSheet = spreadsheetDocument.WorkbookPart.Workbook.Descendants<Sheet>().Where(s => s.Name == sheetName).FirstOrDefault();
            if (theSheet == null)
            {
                throw new ArgumentException("sheetName");
            }
            WorksheetPart wsPart = (WorksheetPart)(spreadsheetDocument.WorkbookPart.GetPartById(theSheet.Id));

            Cell theCell = wsPart.Worksheet.Descendants<Cell>().Where(c => c.CellReference == $"{column}{row}").FirstOrDefault();

            string value = "";
            if (theCell != null)
            {

                if (theCell.InnerText.Length > 0)//celda vacia
                {
                    value = theCell.InnerText;

                    if (theCell.DataType != null)
                    {
                        // Code removed here…
                        switch (theCell.DataType.Value)//celda string
                        {
                            case CellValues.SharedString:

                                // For shared strings, look up the value in the
                                // shared strings table.
                                var stringTable = spreadsheetDocument.WorkbookPart.GetPartsOfType<SharedStringTablePart>()
                                    .FirstOrDefault();

                                // If the shared string table is missing, something 
                                // is wrong. Return the index that is in
                                // the cell. Otherwise, look up the correct text in 
                                // the table.
                                if (stringTable != null)
                                {
                                    value =
                                        stringTable.SharedStringTable
                                        .ElementAt(int.Parse(value)).InnerText;
                                }
                                break;

                            case CellValues.Boolean:
                                switch (value)
                                {
                                    case "0":
                                        value = "FALSE";
                                        break;
                                    default:
                                        value = "TRUE";
                                        break;
                                }
                                break;
                        }
                    }
                    else if (theCell.CellFormula != null)
                    {
                        value = theCell.CellValue.InnerText;
                    }
                }


                //value = theCell.InnerText;

            }
                    
            return value;
            //}
        }
        */





    }
}
