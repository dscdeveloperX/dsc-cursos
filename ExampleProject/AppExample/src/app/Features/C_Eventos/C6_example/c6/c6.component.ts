import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IPersona } from 'src/app/Core/Models/ipersona';

@Component({
  selector: 'app-c6',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c6.component.html',
  styleUrls: ['./c6.component.css']
})
export class C6Component {




  public persona:IPersona[] = [];

  public resultado1 = signal<IPersona[]>([]);

  public resultado2 = signal<string>('');

  



  public constructor(){


    this.persona = [
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
      ];

  }



  public MostrarResultado1():void{
    

    //convierte el objeto JSON en texto
    const objeto_a_texto:string = JSON.stringify(this.persona);
    //mostrar texto
    this.resultado2.set( objeto_a_texto );

    //convierto el texto a objeto tipo persona
    const texto_a_objeto:IPersona[] = JSON.parse(objeto_a_texto);
    //mostrar objeto
    this.resultado1.set(texto_a_objeto);

  }


}
