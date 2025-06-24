namespace TutorialCSharp.Entities.Clases.Metodos
{
    public class MensajeRequest
    {
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        //propiedad con tipo string que permite nulos
        public string? TipoMensaje { get; set; }
    }
}
