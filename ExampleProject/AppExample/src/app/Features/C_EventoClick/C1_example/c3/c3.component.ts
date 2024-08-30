import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-c3',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c3.component.html',
  styleUrls: ['./c3.component.css']
})
export class C3Component {

  public respuesta = signal<string>('...');

  public Saludo(nombre:string){
      //usamos interpolacion de texto como en c# pero con comillas tic `
      this.respuesta.set(`hola mi nombre es: ${nombre}`);
  }

}
