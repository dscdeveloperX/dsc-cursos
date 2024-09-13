import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-c4',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c4.component.html',
  styleUrls: ['./c4.component.css']
})
export class C4Component {

  public respuesta = signal<string>('...');

  public Saludo(tipoAnimal:string):void{
      //usamos interpolacion de texto como en c# pero con comillas tic `
      this.respuesta.set(`hola soy un: ${tipoAnimal}`);
  }





}
