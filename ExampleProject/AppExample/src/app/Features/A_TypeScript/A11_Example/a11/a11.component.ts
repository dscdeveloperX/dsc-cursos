import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IPersona } from 'src/app/Core/Models/ipersona';

@Component({
  selector: 'app-a11',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a11.component.html',
  styleUrls: ['./a11.component.css']
})
export class A11Component {
  public personasData = signal<IPersona[]>([]);


  public constructor(){

    //cargamos datos iniciales
    this.personasData.set(
      [
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
    ]
  );

  }


  public AgregarPersona():void{

    const persona:IPersona =  {
      cedula: '0918723453',
      nombre: 'El papito',
      sueldo: 2500.10,
      fechaNacimiento: new Date('1977-07-21T00:00:00Z'),
      edad: 37,
      discapacitado: false
    };

    //establecemos un nuevo valor
    this.personasData.set(
      
      [
        ...this.personasData(), //"..." es un operador de propagación y su funcion aquí es copiar en un nuevo array. 
        persona //Luego, añadimos la nueva persona al final de este nuevo array
      ]

    );

  }


}
