namespace ChequesProyecto.Entities.Cheque
{
    public class ChequeBatchCreate
    {
        public int AccountId { get; set; }
        public string ReportTypeId { get; set; }
        public int CityId { get; set; }
        public int Chequenumber { get; set; }
        public string PaymentDetail { get; set; }
        public IFormFile BeneficiaryFile { get; set; }


    }
}
