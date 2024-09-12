import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-f4-hijo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './f4-hijo.component.html',
  styleUrls: ['./f4-hijo.component.css'],
})
export class F4HijoComponent {

  public miFoto: string = 'burro.jpg';
  public miNombre: string = 'Don Burro';
  public miDescripcion: string = 'Intento en varias ocaciones ser asambleista';

  //evento que tendra el componente "hijo"
  //desde donde el componente "padre"
  //obtendra el valor del campo "nombre"
  @Output() 
  public EventoEmisorNombre = new EventEmitter<string>();

  public EmitirNombre(): void {
    //emito el valor de nombre
    this.EventoEmisorNombre.emit(this.miNombre);
  }
}
