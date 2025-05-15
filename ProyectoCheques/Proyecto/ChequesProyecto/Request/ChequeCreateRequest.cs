namespace ChequesProyecto.Request
{
    public class ChequeCreateRequest
    {
        public int AccountId { get; set; }
        public string BeneficiaryId { get; set; }
        public string ReportTypeId { get; set; }
        public int CityId { get; set; }
        public string Chequenumber { get; set; }
        public decimal Amount { get; set; }
        public string Date { get; set; }
        public string PaymentDetail { get; set; }
    }
}
