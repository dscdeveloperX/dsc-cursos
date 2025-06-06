namespace TutorialCSharp.Services.Clases.Propiedades
{
    public class ClaseConversión
    {

        public double ConversionDolarEuro(double valor )
        {
            ConversionRequest request = new ConversionRequest();
            double porcentajeEuro = 10; 
            double valorPorcentajeEuro = valor /(100 * porcentajeEuro);
            double resultadoFinal = valor = valorPorcentajeEuro;

            return resultadoFinal;
            

        }

        public double ConversionSoles(double valor)
        {

        }

        public double ConversionPesos(double valor)
        {

        }

    }
}
