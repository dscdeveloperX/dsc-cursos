import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-c1',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './c1.component.html',
  styleUrls: ['./c1.component.css']
})
export class C1Component {



  public Saludo():void{
    alert("Hola saludo-1");
  }

  public Saludo2():void{
    alert("Hola saludo-2");
  }

  public Saludo3():void{
    alert("Hola saludo-3");
  }

  public Saludo4(evento:any):void{
    console.log(evento);//objeto total
    console.log(evento.target);//objeto button
    console.log(evento.target.dataset.cedula);//atributo dataset
  }



}
