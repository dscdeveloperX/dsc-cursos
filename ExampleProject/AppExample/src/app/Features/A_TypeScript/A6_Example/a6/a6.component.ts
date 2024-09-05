import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IMascota } from 'src/app/Core/Models/imascota';
import { IPersona } from 'src/app/Core/Models/ipersona';

@Component({
  selector: 'app-a6',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a6.component.html',
  styleUrls: ['./a6.component.css']
})
export class A6Component {



  public Ejemplo1():void{
 
    //En Arrays: Cuando se usa en un array, el operador propagador permite expandir los elementos de un array dentro de otro array.:
    const numeros:number[] = [1, 2, 3];
    const masNumeros:number[] = [40, 50, 60];

    // Usando el operador propagador para combinar arrays
    const todosNumeros:number[] = [...numeros, ...masNumeros];
    //
    console.log(todosNumeros); // [1, 2, 3, 40, 50, 60]


  }


  public Ejemplo2():void{
    
    //data con 2 objetos
    const mascotaData:IMascota[] = [
      {id:1, nombre:'CAFU', raza:'Cholo paticortis'},
      {id:2, nombre:'INKI', raza:'Pajarera'}
    ];

    //crea un tercer objeto
    const nuevaMascota:IMascota = {id:3, nombre:'RISA', raza:'Payasa'};

    //agrego el tercer objeto a data
    const mascotaTodo:IMascota[] = [...mascotaData, nuevaMascota];

    console.log(mascotaTodo);

  }


  public Ejemplo3():void{

    //modificamos el objeto persona
    
    const persona:IPersona =  {
      cedula: '0918723453',
      nombre: 'El papito',
      sueldo: 2500.10,
      fechaNacimiento: new Date('1977-07-21T00:00:00Z'),
      edad: 37,
      discapacitado: false
    };
    //modifica edad y sueldo
    const personaModificada:IPersona = {...persona, edad:100, sueldo:5000}

    console.log(personaModificada);
   
  }

}
