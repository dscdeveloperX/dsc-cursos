using ChequesProyecto.Entities.Cheque;
using ChequesProyecto.Repositories.Cheque;
using iTextSharp.text.pdf;
using iTextSharp.text;

namespace ChequesProyecto.Services.Cheque
{
    public class ChequeService : IChequeService
    {
        private readonly IChequeRepository _chequeRepository;

        public ChequeService(IChequeRepository chequeRepository) {
            _chequeRepository = chequeRepository;
        }

        public async Task<bool> CreateCheque(ChequeCreateRequest chequeCreateRequest)
        {
            return await _chequeRepository.CreateCheque(chequeCreateRequest);
        }

        public async Task<List<ChequeResponse>> GetChequeReport(ChequeRequest chequeRequest)
        {
            return await _chequeRepository.GetChequeReport(chequeRequest) ;
        }


        public async Task<byte[]> PdfGenerateRolPago(string documentType)
        {
            float width = 8 * 72;  // 576 puntos
            float height = 3 * 72; // 216 puntos
            Rectangle chequeSize = new Rectangle(width, height);
            int fontSmall = 8;
            int fontMedium = 10;
            int fontBig = 12;
            string fontFamilly = "Arial";
            float tablaBorderWidth = 0.5f;
            (float col1, float col2, float col3) tcol = (200f, 100f, 100f);
            BaseColor borderColor = BaseColor.GRAY;

            Document pdfDoc = new Document(chequeSize, 25, 25, 25, 15);
            using var memoryStream = new MemoryStream();
            PdfWriter.GetInstance(pdfDoc, memoryStream);
            pdfDoc.Open();

            for (int i = 0; i < 5; i++)
            {
                // Tabla cabecera
                PdfPTable tblCheque = new PdfPTable(3);
                float[] widthsCheque = new float[] { tcol.col1, tcol.col2, tcol.col3 };
                tblCheque.SetWidths(widthsCheque);
                tblCheque.TotalWidth = (tcol.col1 + tcol.col2 + tcol.col3);
                tblCheque.LockedWidth = true;
                tblCheque.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;

                // Celda de beneficiario
                PdfPCell cellBeneficiario = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 3,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_CENTER,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgBeneficiario = new Paragraph(
                    new Chunk("DARWIN RODOLFO SANCHEZ CORREA", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellBeneficiario.AddElement(prgBeneficiario);
                tblCheque.AddCell(cellBeneficiario);

                // Agrega la tabla al documento
                pdfDoc.Add(tblCheque);

                // Agrega una nueva página si no es el último registro
                if (i < 4)
                {
                    pdfDoc.NewPage();
                }
            }

            pdfDoc.Close();
            return memoryStream.ToArray();
        }

    }
}
