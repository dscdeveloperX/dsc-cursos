namespace DscApi.Models.Entity
{
    public class Club
    {
        public int ClubId { get; set; }
        public string ClubNombre { get; set; } = string.Empty;
        public string ClubAlias { get; set; } = string.Empty;
        public string ClubColor { get; set; } = string.Empty;
    }
}
