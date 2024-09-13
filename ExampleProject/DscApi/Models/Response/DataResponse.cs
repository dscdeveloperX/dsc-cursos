using DscApi.Models.Entity;

namespace DscApi.Models.Response
{
    public class DataResponse<T>
    {
        public int ErrorCodigo { get; set; }
        public string ErrorMensaje { get; set; } = string.Empty;
        public List<T> Data { get; set; }  = new List<T>();

    }
}
