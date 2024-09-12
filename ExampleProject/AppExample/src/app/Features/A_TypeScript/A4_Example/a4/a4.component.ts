import {Component } from '@angular/core';
import { CommonModule } from '@angular/common';



@Component({
  selector: 'app-a4',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a4.component.html',
  styleUrls: ['./a4.component.css']
})
export class A4Component {


  public EjemploForeach():void{

    //forEach: Ejecuta una función proporcionada una vez para cada elemento del arreglo.
    console.info("------ Foreach ------");
    let numeros:number[] = [1, 2, 3, 4];
    numeros.forEach(
      (item) => {
                  console.log(item);
                }
  );



  }

  public EjemploFind():void{
    
    //find: Devuelve el primer elemento que cumple con la condición establecida por la función proporcionada.
    console.info("------ Find ------");
    let numeros:number[] = [1, 2, 3, 4];

    let resultado:number | undefined = numeros.find( (item) => item > 2);
    console.log(resultado); // 3

  }

  public EjemploFilter():void{

    //filter: Crea un nuevo arreglo con todos los elementos que pasan la prueba implementada por la función proporcionada.
    console.info("------ Filter ------");
    let numeros:number[] = [1, 2, 3, 4];
    let resultado:number[] | undefined = numeros.filter(item => item > 2);
    console.log(resultado); // [3, 4]
  }


  public EjemploSome():void{

    //some: Prueba si al menos un elemento en el arreglo cumple con la condición implementada por la función proporcionada.
    console.info("------ Some ------");
    let numeros:number[] = [1, 2, 3, 4];
    let resultado:boolean = numeros.some( (item) => item > 3);
    console.log(resultado); // true
  }


  public EjemploEvery():void{

    //every: Prueba si todos los elementos en el arreglo cumplen con la condición implementada por la función proporcionada.
    console.info("------ Every ------");
    let numeros:number[] = [1, 2, 3, 4];
    let resultado:boolean = numeros.every(item => item > 0);
    console.log(resultado); // true
  }


  public EjemploMap():void{

    //map: Crea un nuevo arreglo con los resultados de aplicar una función proporcionada a cada elemento del arreglo original.
    console.info("------ Map ------");
    let numeros = [1, 2, 3, 4];
    let resultado:number[] = numeros.map(item => item * 2);
    console.log(resultado); // [2, 4, 6, 8]

  }


  public EjemploReduce():void{

    //reduce: Ejecuta una función reductora (que proporcionas) sobre cada elemento del arreglo, resultando en un único valor de salida.
    console.info("------ Reduce ------");
    let numeros:number[] = [10, 5, 8, 3];
    let resultado:number = numeros.reduce((acumulado, item) => acumulado + item, 0);
    
    console.log(resultado); // 26
    
  }

  public EjemploIndexOf():void{

    //indexOf: Devuelve el primer índice en el que se puede encontrar un elemento dado en el arreglo, o -1 si no está presente.
    console.info("------ IndexOf ------");
    let letras:string[] = ["A","B","C"];
    let indice = letras.indexOf("B");
    console.log(indice); // 1

  }

  


  
}
