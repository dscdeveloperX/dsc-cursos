namespace ChequesProyecto.Entities.Cheque
{
    public class ChequeResponse
    {
        public string CompanyName { get; set; }
        public string BankName { get; set; }
        public string AccountNumber { get; set; }
        public string BeneficiaryId { get; set; }
        public string BeneficiaryName { get; set; }
        public string ReportTypeName { get; set; }
        public string CityName { get; set; }
        public int ChequeNumber { get; set; }
        public decimal Amount { get; set; }
        public DateTime Date { get; set; } = DateTime.Now; // Valor por defecto
        public string? PaymentDetail { get; set; }
    }
}
