import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-c7',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c7.component.html',
  styleUrls: ['./c7.component.css']
})
export class C7Component {

//inicializamos con un array de objetos personas vacio
public persona = signal<IPersona[]>([]);

//inicializamos con el objeto persona (con valores por defecto)
public resultado =signal<IPersona>(
  {cedula:'', nombre:'', sueldo:0, fechaNacimiento:new Date(), edad:0, discapacitado:false}
);


public constructor(){

  this.persona.set([
      {
        cedula: '0000000001',
        nombre: 'Angel Alava',
        sueldo: 1000.10,
        fechaNacimiento: new Date('1977-07-21T00:00:00Z'),
        edad: 10,
        discapacitado: false
      },
      {
        cedula: '0000000002',
        nombre: 'Byron Bravo',
        sueldo: 2000.20,
        fechaNacimiento: new Date('1977-07-12T00:00:00Z'),
        edad: 20,
        discapacitado: true
      },
      {
        cedula: '0000000003',
        nombre: 'Caled Castro',
        sueldo: 3000.30,
        fechaNacimiento: new Date('1999-12-28T00:00:00Z'),
        edad: 30,
        discapacitado: false
      }
    ]);

}



public Eliminar(event:MouseEvent,miCedula:string):void{


  /*asignamos a la propiedad resultado un objeto*/

  this.resultado.set(
     this.persona().find(item=>item.cedula == miCedula) as IPersona 
    );

}


}
