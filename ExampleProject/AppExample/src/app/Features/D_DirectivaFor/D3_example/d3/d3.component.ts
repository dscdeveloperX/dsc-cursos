import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-d3',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './d3.component.html',
  styleUrls: ['./d3.component.css']
})
export class D3Component {

  public persona = signal(
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
