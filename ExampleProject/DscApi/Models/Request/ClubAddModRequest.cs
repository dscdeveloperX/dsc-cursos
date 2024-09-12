namespace DscApi.Models.Request
{
    public class ClubAddModRequest
    {
        public int? ClubId { get; set; }
        public string ClubNombre { get; set; }
        public string ClubAlias { get; set; }
        public string ClubColor { get; set; }
    }
}
