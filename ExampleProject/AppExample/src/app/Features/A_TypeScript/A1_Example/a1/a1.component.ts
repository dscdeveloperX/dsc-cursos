import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-a1',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a1.component.html',
  styleUrls: ['./a1.component.css']
})
export class A1Component {




  public nombre:string;


  constructor(){
    this.nombre = 'Darwin Sánchez';
  }

public MostrarResultado():void{

  //Let: tiene valor variable y se usa para declarar variables que están limitadas al bloque en el que se definen
  let edad : number = 42;
  //const: tiene valor constante y se usa para declarar variables que están limitadas al bloque en el que se definen
  const PI:number = 3.14;
  //respuesta con interpolacion de texto (se muestra en consola)
  console.log(`Nombre: ${this.nombre} Edad: ${edad} PI: ${PI} `);

}



}
