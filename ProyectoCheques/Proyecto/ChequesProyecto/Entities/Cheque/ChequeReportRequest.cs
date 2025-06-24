namespace ChequesProyecto.Entities.Cheque
{
    public class ChequeReportRequest
    {
        public string ReportTypeId { get; set; }
        public int StartChequeNumber { get; set; }
        public int EndChequeNumber { get; set; }

    }
}
