﻿namespace ChequesProyecto.Entities.Cheque
{
    public class ChequeCreateRequest
    {
        public int AccountId { get; set; }
        public string BeneficiaryId { get; set; }
        public string BeneficiaryName { get; set; }
        public string ReportTypeId { get; set; }

        public int CityId { get; set; }
        public int Chequenumber { get; set; }
        public decimal Amount { get; set; }
        public DateTime Date { get; set; }
        public string PaymentDetail { get; set; }
    }
}
