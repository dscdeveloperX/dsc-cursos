namespace TutorialCSharp.Entities.Clases.Constructores
{
    public class RolPagoRequest
    {
        public decimal IessPersonalPorcentaje { get; set; }
        public string nombreTrabajador { get; set; }
        public decimal sueldoBase { get; set; }
        public decimal horasExtras { get; set; }
        public int diasLaborados { get; set; }
        public decimal descuentoComedor { get; set; }
    }
}
