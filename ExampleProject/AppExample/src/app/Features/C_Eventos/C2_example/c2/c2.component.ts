import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-c2',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c2.component.html',
  styleUrls: ['./c2.component.css']
})
export class C2Component {

  public respuesta = signal<string>('...');


  public SaludoDarwin():void{
    this.respuesta.set('hola: Darwin');
  }

  public SaludoTommy():void{
    this.respuesta.set('hola: Tommy');
  }



}
