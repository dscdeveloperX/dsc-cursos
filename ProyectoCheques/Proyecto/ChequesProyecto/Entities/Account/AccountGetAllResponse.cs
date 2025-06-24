namespace ChequesProyecto.Entities.Account
{
    public class AccountGetAllResponse
    {
        public int Id { get; set; }
        public string AccountNumber { get; set; }

        public int BankId { get; set; }
        public string BankName { get; set; }

        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
    }
}
