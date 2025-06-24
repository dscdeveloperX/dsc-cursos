namespace TutorialCSharp.Services.Clases.Propiedades
{
    public class ClaseConversión
    {
        private double porc_Euro;
        private double porc_Soles;
        private double porc_Pesos;
        public ClaseConversión()
        {
            porc_Euro = -10;
            porc_Soles = 15;
            porc_Pesos = 20;

        }


        public double ConversionDolarEuro(ConversionRequest valor )
        {
            

           double valorPorcEuro = (valor.Valor / 100) * porc_Euro;
           double  respuesta = valor.Valor + valorPorcEuro;

            

            return respuesta;
            

        }

        public double ConversionDolarSoles(ConversionRequest request)
        {
            double valorPorcSoles = (request.Valor / 100) * porc_Soles;
            double respuesta = request.Valor + valorPorcSoles;

            return respuesta;

        }

        public double ConversionDolarPesos(ConversionRequest request)
        {
            double valorPorcPesos = (request.Valor / 100) * porc_Pesos;
            double respuesta = request.Valor + valorPorcPesos;
            return respuesta; 
        }


        public ConversionResponse  ConversionMoneda(ConversionRequest request)


        {


            double respuestaEuros = ConversionDolarEuro(request);
            double respuestaSoles = ConversionDolarSoles(request);
            double respuestaPesos = ConversionDolarPesos(request);



            ConversionResponse response = new ConversionResponse();

            response.ValorEuro = respuestaEuros;
            response.ValorSoles = respuestaSoles;
            response.ValorPesos = respuestaPesos;
            

        

            return response  ;

        }



      

    }
}
