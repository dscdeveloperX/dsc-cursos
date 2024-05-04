using System;//1
using System.Collections.Generic;//1
using System.Linq;//1
using System.Text;//1
using System.Threading.Tasks;//1
using System.Windows.Forms;

namespace CSharpBasico.Dia7
{
    class ClaseDia7
    {


        public void Ejemplo1() {


            // Crear una lista de enteros
            List<int> numeros = new List<int>();

            // Agregar elementos
            numeros.Add(100);
            numeros.Add(200);
            numeros.Add(300);

            // Acceder a elementos
            MessageBox.Show($"Segundo elemento: {numeros[1]} de {numeros.Count} elementos");


            // Eliminar segundo elemento 
            numeros.RemoveAt(1);


            // Acceder a elementos
            MessageBox.Show($"Segundo elemento: {numeros[1]} de {numeros.Count} elementos");


            // Ordenar elementos
            //numeros.Sort();

            // Mostrar elementos
            foreach (var numero in numeros)
            {
                Console.WriteLine(numero);
            }

            //forma vieja
            for (int i=0;i<numeros.Count;i++)
            {
                MessageBox.Show(numeros[i].ToString());
            }


        



        }

        
        public void Ejemplo2()
        {
            /*1-crear una lista de nombres
             2-agregar diez nombres
            3-recorrer la lista y presentar cada uno de los nombres con un for y despues con un foreach*/

            List<string> nombres = new List<string>();

            nombres.Add("pepe");
            nombres.Add("darwin");
            nombres.Add("juan");
            nombres.Add("emma");
            nombres.Add("federico");
            nombres.Add("arturo");
            nombres.Add("francisco");
            nombres.Add("carrie");
            nombres.Add("jenny");
            nombres.Add("rocky");

            for (int i= 0;i<nombres.Count;i+=1)
            {
                nombres[i] += " abc123456";
            }


            foreach (var nombre in nombres) 
            {
                MessageBox.Show(nombre);
            }

        }

        public void Ejemplo3()
        {
            /*1.crear una lista de numeros
             2.agregar 5 elementos a la lista
            3.recorrer con un for la lista y modificar sus valores multiplicados por 2
            (solo si el valor a modificar es mayor a 25)
            4.for each para recorrer la lista y recorrer sus valores*/

            List<int> numbers = new List<int>();
            numbers.Add(15);
            numbers.Add(34);
            numbers.Add(19);
            numbers.Add(36);
            numbers.Add(25);
            
            
                for (int i = 0; i < numbers.Count; i++)
                {
                    if (numbers[i] > 25)
                    {
                        numbers[i] *= 2;
                    }
                
                }

    


            foreach (int number in numbers)
            {
                MessageBox.Show(number.ToString());
            }
            
        }


    }
}
