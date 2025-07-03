using Microsoft.AspNetCore.Mvc.RazorPages.Infrastructure;

namespace ChequesProyecto.Entities.Cheque
{
    public class ChequesGetByDateRangeRequest
    {
        public int AccountId { get; set; }
        public DateTime StarDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}
