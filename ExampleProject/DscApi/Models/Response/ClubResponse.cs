using DscApi.Models.Entity;

namespace DscApi.Models.Response
{
    public class ClubResponse
    {
        public int ErrorCodigo { get; set; }
        public string ErrorMensaje { get; set; }
        public List<Club> Clubes { get; set; }

    }
}
