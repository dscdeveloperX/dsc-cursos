import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-a2',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a2.component.html',
  styleUrls: ['./a2.component.css']
})
export class A2Component {

  //fecha está en formato ISO 8601

  public persona:any = [
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
  ];



}
