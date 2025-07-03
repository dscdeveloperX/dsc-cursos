using ChequesProyecto.Entities.Cheque;
using ChequesProyecto.Repositories.Cheque;
using iTextSharp.text.pdf;
using iTextSharp.text;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using Font = iTextSharp.text.Font;


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


        public async Task<bool> CreateChequeExcel(ChequeCreateRequest chequeCreateRequest)
        {
            return await _chequeRepository.CreateCheque(chequeCreateRequest);
        }

        public async Task<List<ChequeReportResponse>> GetChequeReport(ChequeReportRequest chequeReportRequest)
        {
            return await _chequeRepository.GetChequeReport(chequeReportRequest) ;
        }

        public async Task<List<ChequeReportResponse>> GetChequesByDateRange(ChequesGetByDateRangeRequest chequesGetByDateRangeRequest) {
            return await _chequeRepository.GetChequesByDateRange(chequesGetByDateRangeRequest);
        }

        public async Task<byte[]> GenerateChequeReport(List<ChequeReportResponse> chequeData, string documentType)
        {
            string amountWord = "CUARENTA MIL QUINIENTOS VEINTI CINCO  37/100";

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
            PdfWriter writer =  PdfWriter.GetInstance(pdfDoc, memoryStream);
            pdfDoc.Open();
            int count = 0;

            


            foreach (ChequeReportResponse item in chequeData)
            {
                count++;

                // ------------------------------------------------------------------------------
                // Crear una capa (OCG) que NO se imprime (PrintState = OFF)
                PdfLayer noPrintLayer = new PdfLayer("NoImprimir", writer);
                PdfDictionary usage = new PdfDictionary();
                PdfDictionary print = new PdfDictionary();
                print.Put(new PdfName("PrintState"), new PdfName("OFF")); // No imprimir
                usage.Put(new PdfName("Print"), print);
                noPrintLayer.Put(PdfName.USAGE, usage);

                // Dibujar el número de cheque en esa capa
                PdfContentByte cb = writer.DirectContent;
                cb.BeginLayer(noPrintLayer);

                BaseFont bf = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
                cb.BeginText();
                cb.SetFontAndSize(bf, 8);
                cb.ShowTextAligned(Element.ALIGN_LEFT, $"Cheque N°: {item.ChequeNumber}", 30, 200, 0);
                cb.EndText();

                cb.EndLayer();
                // ------------------------------------------------------------------------------


                // Tabla cabecera
                PdfPTable tblCheque = new PdfPTable(3);
                float[] widthsCheque = new float[] { tcol.col1, tcol.col2, tcol.col3 };
                tblCheque.SetWidths(widthsCheque);
                tblCheque.TotalWidth = (tcol.col1 + tcol.col2 + tcol.col3);
                tblCheque.LockedWidth = true;
                tblCheque.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
                //----------------------------------------------------------------------------
                // Celda de beneficiario
                //----------------------------------------------------------------------------
                PdfPCell cellBeneficiario = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 2,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgBeneficiario = new Paragraph(
                    new Chunk(item.BeneficiaryName, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellBeneficiario.AddElement(prgBeneficiario);



                tblCheque.AddCell(cellBeneficiario);

                //----------------------------------------------------------------------------
                // Celda de Monto
                //----------------------------------------------------------------------------
                PdfPCell cellMonto = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 1,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgMonto = new Paragraph(
                    new Chunk(Math.Round(item.Amount,2).ToString(), FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellMonto.AddElement(prgMonto);


                tblCheque.AddCell(cellMonto);


                //----------------------------------------------------------------------------
                // Celda de Monto en letras
                //----------------------------------------------------------------------------
                PdfPCell cellAmountWord = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 3,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgAmountWord = new Paragraph(
                    new Chunk(amountWord, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellAmountWord.AddElement(prgAmountWord);


                tblCheque.AddCell(cellAmountWord);

                //----------------------------------------------------------------------------
                // Celda de CIUDAD  Y FECHA
                //----------------------------------------------------------------------------
                PdfPCell cellCityDate = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 3,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgCityDate = new Paragraph(
                    new Chunk($"{ item.CityName }, {DateTime.Now.ToString("dd 'de' MMMM 'del' yyyy", new System.Globalization.CultureInfo("es-ES"))}", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellCityDate.AddElement(prgCityDate);


                tblCheque.AddCell(cellCityDate);


                // Agrega la tabla al documento
                pdfDoc.Add(tblCheque);

                // Agrega una nueva página si no es el último registro
                if ( count < chequeData.Count)
                {
                    pdfDoc.NewPage();
                }
            }

            pdfDoc.Close();
            return memoryStream.ToArray();
        }


        public async Task<bool> GenerarCheques(ChequeBatchCreate chequeBatchCreate) {


            ChequeCreateRequest chequeCreateRequest = new ChequeCreateRequest();

            if (chequeBatchCreate.BeneficiaryFile != null && chequeBatchCreate.BeneficiaryFile.Length > 0)
            {

                using Stream fileStream = chequeBatchCreate.BeneficiaryFile.OpenReadStream();

                using (SpreadsheetDocument spreadsheetDocument = SpreadsheetDocument.Open(fileStream, false))
                {
                    WorkbookPart workbookPart = spreadsheetDocument.WorkbookPart;
                    foreach (Sheet sheet in workbookPart.Workbook.Sheets.Elements<Sheet>())
                    {


                        if (sheet.Name.ToString().Contains("1"))
                        {

                            string sheetName = sheet.Name; // Nombre de la hoja

                            //busco los primeros 100000 cheques
                            for (int i = 0; i < 100000; i++)
                            {

                                string cedula = GetCellValue(spreadsheetDocument, sheetName, "A", i + 1);

                                //si el registro actual no tiene cedula finaliza la insercion de chqeues
                                if (cedula is null || cedula.Length == 0)
                                {
                                    break;
                                }

                                //si no hay detalles individuales se guardan los detalles generales en la db
                                string paymentDetail = GetCellValue(spreadsheetDocument, sheetName, "D", i + 1);
                                chequeCreateRequest.PaymentDetail = (paymentDetail is not null && paymentDetail.Length > 0) ? paymentDetail : chequeBatchCreate.PaymentDetail;

                                chequeCreateRequest.AccountId = chequeBatchCreate.AccountId;
                                chequeCreateRequest.BeneficiaryId = cedula;
                                chequeCreateRequest.BeneficiaryName = GetCellValue(spreadsheetDocument, sheetName, "B", i + 1);
                                chequeCreateRequest.ReportTypeId = chequeBatchCreate.ReportTypeId;
                                chequeCreateRequest.CityId = chequeBatchCreate.CityId;
                                //incrementa en uno el numero de cheque
                                chequeCreateRequest.Chequenumber = chequeBatchCreate.Chequenumber + i;
                                chequeCreateRequest.Amount = Convert.ToDecimal(GetCellValue(spreadsheetDocument, sheetName, "C", i + 1));
                                chequeCreateRequest.Date = DateTime.Now;

                                //inserta cheque
                                 bool result = await _chequeRepository.CreateCheque(chequeCreateRequest);

                            }

                            
                        }
                    }

                }

            }
            return true;

        }


        public async Task<byte[]> GenerateChequeDateRangeReport(List<ChequeReportResponse> chequeData)
        {
            

            float width = 7 * 72;  // 576 puntos
            float height = PageSize.A4.Width; // 216 puntos
            Rectangle chequeSize = new Rectangle(width, height);
            int fontSmall = 8;
            int fontMedium = 10;
            int fontBig = 12;
            string fontFamilly = "Arial";
            float tablaBorderWidth = 0.5f;
            (float col1, float col2, float col3, float col4, float col5, float col6, float col7) tcol = (110f, 70f, 70f,30f, 40f, 40f, 144f);
            BaseColor borderColor = BaseColor.GRAY;

            Document pdfDoc = new Document(chequeSize, 25, 25, 25, 15);
            using var memoryStream = new MemoryStream();
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
            pdfDoc.Open();
            int count = 0;




            foreach (ChequeReportResponse item in chequeData)
            {
                count++;

                // ------------------------------------------------------------------------------
           

                // Tabla cabecera
                PdfPTable tblCheque = new PdfPTable(7);
                float[] widthsCheque = new float[] { tcol.col1, tcol.col2, tcol.col3, tcol.col4, tcol.col5, tcol.col6, tcol.col7 };
                tblCheque.SetWidths(widthsCheque);
                tblCheque.TotalWidth = (tcol.col1 + tcol.col2 + tcol.col3 + tcol.col4 + tcol.col5 + tcol.col6 + tcol.col7);
                tblCheque.LockedWidth = true;
                tblCheque.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;

                //----------------------------------------------------------------------------
                // CABECERAS beneficiario
                //----------------------------------------------------------------------------



                PdfPCell cellBeneficiarioCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgBeneficiarioCabecera = new Paragraph(
                    new Chunk("BENEFICIARIO", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellBeneficiarioCabecera.AddElement(prgBeneficiarioCabecera);



                tblCheque.AddCell(cellBeneficiarioCabecera);


                //----------------------------------------------------------------------------
                // CABECERAS tipo reporte
                //----------------------------------------------------------------------------



                PdfPCell cellReportTypeCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgReportTypeCabecera = new Paragraph(
                    new Chunk("REPORTE", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellReportTypeCabecera.AddElement(prgReportTypeCabecera);



                tblCheque.AddCell(cellReportTypeCabecera);


                //----------------------------------------------------------------------------
                // CABECERAS Ciudad
                //----------------------------------------------------------------------------



                PdfPCell cellCiudadCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgCiudadCabecera = new Paragraph(
                    new Chunk("CIUDAD", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellCiudadCabecera.AddElement(prgCiudadCabecera);



                tblCheque.AddCell(cellCiudadCabecera);


                //----------------------------------------------------------------------------
                // CABECERAS cheque no
                //----------------------------------------------------------------------------



                PdfPCell cellChequeNoCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgChequeNoCabecera = new Paragraph(
                    new Chunk("CHEQUE No", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellChequeNoCabecera.AddElement(prgChequeNoCabecera);



                tblCheque.AddCell(cellChequeNoCabecera);



                //----------------------------------------------------------------------------
                // CABECERAS Monto
                //----------------------------------------------------------------------------



                PdfPCell cellMontoCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgMontoCabecera = new Paragraph(
                    new Chunk("MONTO", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellMontoCabecera.AddElement(prgMontoCabecera);



                tblCheque.AddCell(cellMontoCabecera);




                //----------------------------------------------------------------------------
                // CABECERAS Fecha
                //----------------------------------------------------------------------------



                PdfPCell cellFechaCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgFechaCabecera = new Paragraph(
                    new Chunk("FECHA", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellFechaCabecera.AddElement(prgFechaCabecera);



                tblCheque.AddCell(cellFechaCabecera);



                //----------------------------------------------------------------------------
                // CABECERAS Detalles
                //----------------------------------------------------------------------------



                PdfPCell cellDetalleCabecera = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgDetalleCabecera = new Paragraph(
                    new Chunk("DETALLE", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellDetalleCabecera.AddElement(prgDetalleCabecera);



                tblCheque.AddCell(cellDetalleCabecera);








                //----------------------------------------------------------------------------
                // Celda de beneficiario
                //----------------------------------------------------------------------------
                PdfPCell cellBeneficiario = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgBeneficiario = new Paragraph(
                    new Chunk(item.BeneficiaryName, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellBeneficiario.AddElement(prgBeneficiario);

                tblCheque.AddCell(cellBeneficiario);




                //----------------------------------------------------------------------------
                // tipo reporte
                //----------------------------------------------------------------------------



                PdfPCell cellReportType = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgReportType = new Paragraph(
                    new Chunk(item.ReportTypeName, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellReportType.AddElement(prgReportType);



                tblCheque.AddCell(cellReportType);



                //----------------------------------------------------------------------------
                // Ciudad
                //----------------------------------------------------------------------------



                PdfPCell cellCiudad = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgCiudad = new Paragraph(
                    new Chunk(item.CityName, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellCiudad.AddElement(prgCiudad);



                tblCheque.AddCell(cellCiudad);




                //----------------------------------------------------------------------------
                // cheque no
                //----------------------------------------------------------------------------



                PdfPCell cellChequeNo = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgChequeNo = new Paragraph(
                    new Chunk(item.ChequeNumber.ToString(), FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellChequeNo.AddElement(prgChequeNo);



                tblCheque.AddCell(cellChequeNo);





                //----------------------------------------------------------------------------
                // Celda de Monto
                //----------------------------------------------------------------------------
                PdfPCell cellMonto = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgMonto = new Paragraph(
                    new Chunk(Math.Round(item.Amount, 2).ToString(), FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellMonto.AddElement(prgMonto);


                tblCheque.AddCell(cellMonto);



                //----------------------------------------------------------------------------
                // Celda FECHA
                //----------------------------------------------------------------------------
                PdfPCell cellCityDate = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgCityDate = new Paragraph(
                    new Chunk($"{DateTime.Now.ToString("dd 'de' MMMM 'del' yyyy", new System.Globalization.CultureInfo("es-ES"))}", FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellCityDate.AddElement(prgCityDate);


                tblCheque.AddCell(cellCityDate);



                //----------------------------------------------------------------------------
                // Detalles
                //----------------------------------------------------------------------------



                PdfPCell cellDetalle = new PdfPCell
                {
                    Padding = 0,
                    Colspan = 0,
                    BorderWidth = 0,
                    BackgroundColor = BaseColor.WHITE,
                    HorizontalAlignment = PdfPCell.ALIGN_LEFT,
                    VerticalAlignment = PdfPCell.ALIGN_CENTER
                };

                Paragraph prgDetalle = new Paragraph(
                    new Chunk(item.PaymentDetail, FontFactory.GetFont(fontFamilly, fontBig, Font.BOLD, BaseColor.BLACK)))
                {
                    Alignment = Element.ALIGN_CENTER
                };

                cellDetalle.AddElement(prgDetalle);



                tblCheque.AddCell(cellDetalle);





                // Agrega la tabla al documento
                pdfDoc.Add(tblCheque);

                // Agrega una nueva página si no es el último registro
                /*if (count < chequeData.Count)
                {
                    pdfDoc.NewPage();
                }*/
            }

            pdfDoc.Close();
            return memoryStream.ToArray();
        }


        public static string GetCellText(SpreadsheetDocument doc, string sheetName, string cellReference)
        {

            var sheet = doc.WorkbookPart.Workbook.Descendants<Sheet>().FirstOrDefault(s => s.Name == sheetName);
            if (sheet == null) return null;

            var worksheetPart = (WorksheetPart)doc.WorkbookPart.GetPartById(sheet.Id);
            var cell = worksheetPart.Worksheet.Descendants<Cell>().FirstOrDefault(c => c.CellReference.Value == cellReference);
            if (cell == null || cell.CellValue == null) return null;

            // Si la celda usa SharedString, obtener el texto real
            if (cell.DataType != null && cell.DataType.Value == CellValues.SharedString)
            {
                var stringTable = doc.WorkbookPart.SharedStringTablePart.SharedStringTable;
                return stringTable.ElementAt(int.Parse(cell.CellValue.Text)).InnerText;
            }

            return cell.CellValue.Text; // Devuelve el valor de la celda
        }


        public static string GetCellValue(SpreadsheetDocument document, string sheetName, string column, int row)
        {
            var sheet = document.WorkbookPart.Workbook.Sheets
                .OfType<Sheet>()
                .FirstOrDefault(s => s.Name == sheetName);

            if (sheet == null)
                throw new ArgumentException($"La hoja '{sheetName}' no existe.");

            var worksheetPart = (WorksheetPart)document.WorkbookPart.GetPartById(sheet.Id);
            var cellReference = column + row;

            var cell = worksheetPart.Worksheet.Descendants<Cell>()
                .FirstOrDefault(c => string.Equals(c.CellReference?.Value, cellReference, StringComparison.OrdinalIgnoreCase));

            if (cell == null)
                return null;

            var rawValue = cell.CellValue?.InnerText ?? cell.InnerText;

            if (cell.DataType?.Value == CellValues.SharedString)
            {
                var sst = document.WorkbookPart.SharedStringTablePart?.SharedStringTable;
                if (sst != null && int.TryParse(rawValue, out int index))
                {
                    return sst.ElementAtOrDefault(index)?.InnerText ?? rawValue;
                }
            }
            else if (cell.DataType?.Value == CellValues.Boolean)
            {
                return rawValue == "1" ? "TRUE" : "FALSE";
            }

            return rawValue;
        }



    }
}
