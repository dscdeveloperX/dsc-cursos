using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Xml;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/[controller]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private readonly IWebHostEnvironment _env;
        public ReportController(IWebHostEnvironment env)
        {
            _env = env;
        }

        public async Task<IActionResult> FormatoCheque() {
            return Ok( await Task.Run(()=> true));
        }


        private async Task<List<string>> PdfGenerateRolPago(Stream stream, int companyID, string documentType, string documentGroupDescription, DateTime documentGroupDate, int documentGroupIDExistent = 0, string tituloDocumento = "")
        {


            int ramdomDocumentCode = new Random().Next(400, 700);
            //
            //fuentes size
            int fontSmall = 8;
                int fontMedium = 10;
                int fontBig = 12;
                //fuentes familia
                string fontFamilly = "Arial";
                //ancho de image
                //float imgQRWidth = 120f;//100f
                //float barraWidth = 156f;
                float tablaBorderWidth = 0.5f;
            //tama;o de columnas
               (float col1, float col2, float col3) tcol = (200f,100f,100f);
                BaseColor borderColor = BaseColor.GRAY;
                //
                float tablaBorderWidthBottom = 0f;
                string pathReport = Path.Combine( _env.WebRootPath, "Report" ); //HttpContext.Current.Server.MapPath("~/");
                string reportFileName = $"{documentType}_{ramdomDocumentCode}.pdf";


                //crear un docuento pdr
                //dimensiones
                Document pdfDoc = new Document(PageSize.A4, 25, 25, 25, 15);
                System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
                
                //creamos objeto
                PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, memoryStream);
                //lectura
                pdfDoc.Open();

                /*--------------------------------------------------------------------------------
                TABLA PRINCIPAL
                --------------------------------------------------------------------------------*/
                PdfPTable t = new PdfPTable(3);
                //alineamos tabla en el centro
                t.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
            //ancho de la tabla
                t.TotalWidth = (tcol.col1 + tcol.col2 + tcol.col3);
                t.LockedWidth = true;

                /*--------------------------------------------------------------------------------
               TABLA CABECERA
               --------------------------------------------------------------------------------*/
                /*PdfPTable tblBeneficiario = new PdfPTable(2);
                float[] widthsBeneficiario = new float[] { (tcol.col1 + tcol.col2), tcol.col3};
                tblBeneficiario.SetWidths(widthsBeneficiario);
                //alineamos tabla en el centro
                tblBeneficiario.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
                //ancho de la tabla
                tblBeneficiario.TotalWidth = 500f;
                tblBeneficiario.LockedWidth = true;*/

                /*--------------------------------------------------------------------------------
                CABECERA - EMPRESA
                --------------------------------------------------------------------------------*/
                //creamos celda
                PdfPCell cellBeneficiario = new PdfPCell();
                cellBeneficiario.Padding = 0;
                cellBeneficiario.BorderWidth = 0;
                cellBeneficiario.BackgroundColor = BaseColor.WHITE;
                cellBeneficiario.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                cellBeneficiario.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                //creamos parafo
                Paragraph prgBeneficiario = new Paragraph(new Chunk(txtBeneficiario, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)));
                prgBeneficiario.Alignment = 1;
                //agregamos parrafo
                cellBeneficiario.AddElement(prgBeneficiario);
                //agregamos celda
                t.AddCell(cellBeneficiario);
                /*--------------------------------------------------------------------------------
                CABHECERA - FOTO
                --------------------------------------------------------------------------------*/
                //creamos celda
                PdfPCell cellCabeceraLogo = new PdfPCell();
                cellCabeceraLogo.Padding = 0;
                cellCabeceraLogo.Rowspan = 3;
                cellCabeceraLogo.BorderWidth = 0;
                cellCabeceraLogo.BackgroundColor = BaseColor.WHITE;
                cellCabeceraLogo.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                cellCabeceraLogo.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                //logo empresa

                // Convertir el string Base64 a un arreglo de bytes
                byte[] imageBytes = Convert.FromBase64String(pathEmpresa);

                // Crear la imagen a partir de los bytes
                iTextSharp.text.Image imgEmpresa = iTextSharp.text.Image.GetInstance(imageBytes);
                //iTextSharp.text.Image imgEmpresa = iTextSharp.text.Image.GetInstance($"{path}/{pathEmpresa}");
                imgEmpresa.ScaleAbsoluteWidth(100f);
                //agregamos parrafo
                cellCabeceraLogo.AddElement(imgEmpresa);
                //agregamos celda
                tblCabecera.AddCell(cellCabeceraLogo);
                /*--------------------------------------------------------------------------------
                CABECERA - ROL DE PAGO
                --------------------------------------------------------------------------------*/
                //creamos celda
                PdfPCell cellCabeceraRolPago = new PdfPCell();
                cellCabeceraRolPago.Padding = 0;
                cellCabeceraRolPago.BorderWidth = 0;
                cellCabeceraRolPago.BackgroundColor = BaseColor.WHITE;
                cellCabeceraRolPago.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                cellCabeceraRolPago.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                //creamos parafo
                Paragraph prgCabeceraRolPago = new Paragraph(new Chunk(tituloDocumento, FontFactory.GetFont(fontFamilly, fontMedium, Font.BOLD, BaseColor.BLACK)));
                prgCabeceraRolPago.Alignment = 1;
                //agregamos parrafo
                cellCabeceraRolPago.AddElement(prgCabeceraRolPago);
                //agregamos celda
                tblCabecera.AddCell(cellCabeceraRolPago);

                /*--------------------------------------------------------------------------------
                CABECERA - DESCRIPCION
                --------------------------------------------------------------------------------*/
                //creamos celda
                PdfPCell cellCabeceraDescripcion = new PdfPCell();
                cellCabeceraDescripcion.Padding = 0;
                cellCabeceraDescripcion.BorderWidth = 0;
                cellCabeceraDescripcion.BackgroundColor = BaseColor.WHITE;
                cellCabeceraDescripcion.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                cellCabeceraDescripcion.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                //creamos parafo
                Paragraph prgCabeceraDescripcion = new Paragraph(new Chunk(cabeceraDescripcion, FontFactory.GetFont(fontFamilly, fontMedium, Font.BOLD, BaseColor.BLACK)));
                prgCabeceraDescripcion.Alignment = 1;
                //agregamos parrafo
                cellCabeceraDescripcion.AddElement(prgCabeceraDescripcion);
                //agregamos celda
                tblCabecera.AddCell(cellCabeceraDescripcion);

              




                pdfDoc.Add(t);

                pdfDoc.Close();
                byte[] bytes = memoryStream.ToArray();
                System.IO.File.WriteAllBytes( Path.Combine(pathReport, reportFileName), bytes);
                pdfWriter.CloseStream = false;


        }
         
       
        }





    }
}
