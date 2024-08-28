import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IPersona } from 'src/app/Core/Models/ipersona';

@Component({
  selector: 'app-a4',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a4.component.html',
  styleUrls: ['./a4.component.css']
})
export class A4Component {

  public persona = signal<IPersona[]>(
    [
      {
        nombre: 'Angel Alava',
        sueldo: 1000.10,
        fechaNacimiento: new Date('1977-07-21T00:00:00Z'),
        edad: 10,
        discapacitado: false
      },
      {
        nombre: 'Byron Bravo',
        sueldo: 2000.20,
        fechaNacimiento: new Date('1977-07-12T00:00:00Z'),
        edad: 20,
        discapacitado: true
      },
      {
        nombre: 'Caled Castro',
        sueldo: 3000.30,
        fechaNacimiento: new Date('1999-12-28T00:00:00Z'),
        edad: 30,
        discapacitado: false
      }
    ]
  );



}
