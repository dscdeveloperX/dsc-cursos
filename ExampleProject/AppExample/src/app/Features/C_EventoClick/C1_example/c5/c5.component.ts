import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-c5',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c5.component.html',
  styleUrls: ['./c5.component.css']
})
export class C5Component {


  public Saludo(evento:any):void{
    console.log(evento);//objeto total
    console.log(evento.target);//objeto button
    console.log(evento.target.dataset.cedula);//atributo dataset
  }


}
