import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { F4HijoComponent } from '../f4-hijo/f4-hijo.component';

@Component({
  selector: 'app-f4',
  standalone: true,
  imports: [CommonModule, F4HijoComponent],
  templateUrl: './f4.component.html',
  styleUrls: ['./f4.component.css']
})
export class F4Component {

  public NombreRecibido = signal<string>('');


  public GetEventoEmisorNombre(nombre:string):void{
    //recigbe el valor del "nombre" que emite el hijo
    alert('Soy el padre recibí el nombre desde el hijo');

    this.NombreRecibido.set(nombre);
  }

 
}
