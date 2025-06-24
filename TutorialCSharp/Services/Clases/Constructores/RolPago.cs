using TutorialCSharp.Entities.Clases.Constructores;

namespace TutorialCSharp.Services.Clases.Constructores
{
    public class RolPago
    {
        
        //campos
        //los campos son valores de alcance privado
        //que NO pueden ser leidos ni modificados desde fuera de la clase
        private readonly decimal _iessPersonalPorcentaje;
      

        //propieades
        //los campos son valores de alcance publico
        //que SI pueden ser leidos ni modificados desde fuera de la clase
        public string nombreTrabajador { get; set; }
        public decimal sueldoBase { get; set; }
        public decimal horasExtras { get; set; }
        public int diasLaborados { get; set; }
        public decimal descuentoComedor { get; set; }



        //constructor
        //inicializa el valor del porcentaje iess personal
        public RolPago(decimal iessPersonalPorcentaje)
        {
            _iessPersonalPorcentaje = iessPersonalPorcentaje;
        }



        public RolPagoResponse Calcular()
        {

            //calculo de ingresos
            decimal salarioMensual = (sueldoBase / 30 * diasLaborados);
            decimal totalIngresos = (salarioMensual + horasExtras);

            //calculo de egresos
            decimal iessPresonal = (totalIngresos / 100 * _iessPersonalPorcentaje);
            decimal totalEgresos = (iessPresonal + descuentoComedor);

            //total a recibir
            decimal totalRecibir = (totalIngresos - totalEgresos);


            //guardo datos en objeto response
            RolPagoResponse rolPagoResponse = new RolPagoResponse();
            //
            rolPagoResponse.NombreTrabajador = nombreTrabajador;
            rolPagoResponse.TotalEgresos = totalEgresos;
            rolPagoResponse.TotalIngresos = totalIngresos;
            rolPagoResponse.TotalRecibir = totalRecibir;

            //retorno objeto resultados
            return rolPagoResponse;
        }


    }
}
