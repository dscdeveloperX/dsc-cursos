import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-a3',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a3.component.html',
  styleUrls: ['./a3.component.css']
})
export class A3Component {


  public MostrarResultado():void{

    let vocales:string[] = [];
    //mostrar en consola
    console.info('Array vocales vacio');
    console.log(vocales);

    // Agregar item
    vocales.push('A');
    vocales.push('E');
    vocales.push('I');
    vocales.push('O');
    vocales.push('U1');
    vocales.push('X');
    //mostrar en consola
    console.info('Array vocales con items');
    console.log(vocales);

    // Eliminar un elemento "1" en el índice 5 (el valor "X")
    vocales.splice(5, 1);
    //mostrar en consola
    console.info('Eliminamos item X');
    console.log(vocales);

    //actualizar un item del array
    vocales[4] = "U";
    //mostrar en consola
    console.info('actualizamos item U');
    console.log(vocales);

    //interar por un array con forEach

    //funcion de flecha forma 1 (con cuerpo)
    console.info('interar por array forma 1');

    vocales.forEach(
      
      (item:string) => {
        //mostrar en consola cada item del array
        console.log(item);
      }

      );

    //funcion de flecha forma 2 (sin cuerpo) 
    //Como solo realiza una instruccion prodriamos oviar las llaves "{ }" y su ";")
    console.info('interar por array forma 2');

    vocales.forEach(
      
      (item) => console.log(item)
      
      );


    //funcion de flecha forma 3 (sin cuerpo)
    //Como solo realiza una instruccion prodriamos oviar las llaves "{ }" y su ";")
    //como solo pasa 1 parametro "item" podemos obviar los paréntesis "()"
    console.info('interar por array forma 3');

    vocales.forEach(
    item => console.log(item)
    );

  }

}
