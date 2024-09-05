import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-a5',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a5.component.html',
  styleUrls: ['./a5.component.css']
})
export class A5Component {


  public Ejemplo1():void{

    //Tuplas: Para definir una tupla, se especifica una lista de tipos entre corchetes [], donde cada tipo corresponde a un elemento en la tupla.
    console.info('------ Visualizar valores de una tupla ------');
    // Definición de una tupla
    let miTupla: [string, number, boolean] = ["texto", 42, true];

    //Acceso a los Elementos: Puedes acceder a los elementos de una tupla de manera similar a los arreglos, usando índices.
    console.log(miTupla[0]); // "texto"
    console.log(miTupla[1]); // 42
    console.log(miTupla[2]); // true

  }


  public Ejemplo2():void{
    
    console.info('------ Modificar valores de una tupla ------');

    let miTupla: [string, number, boolean] = ["texto", 42, true];

    //Modificación de Elementos: Puedes modificar los elementos de una tupla, siempre y cuando mantengas el tipo correcto para cada posición.
    miTupla[0] = "nuevo texto"; 
    miTupla[1] = 100; 
    miTupla[2] = true;

    //Acceso a los Elementos: Puedes acceder a los elementos de una tupla de manera similar a los arreglos, usando índices.
    console.log(miTupla[0]); // "texto"
    console.log(miTupla[1]); // 42
    console.log(miTupla[2]); // true


  }

  public Ejemplo3():void{
    //Tuplas con Tipos Opcionales y de Valores Predeterminados: Puedes definir elementos opcionales en una tupla usando ?, o asignar valores predeterminados a los elementos.
    console.info('------ Tupla con valores opcionales ------');
    // Tupla con un elemento opcional
    let tuplaOpcional: [string, number?] = ["texto"];
    tuplaOpcional = ["texto", 123]; // También es válido

    // Tupla con un valor predeterminado
    let tuplaDefault: [string, number, boolean?] = ["texto", 123];
    tuplaDefault = ["texto", 123, true]; // También es válido
    
    console.log(tuplaDefault[0]);
    console.log(tuplaDefault[1]);
    console.log(tuplaDefault[2]);

  }

  


}
