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


  public MostrarDataset(evento:MouseEvent):void{

    console.log(evento);//objeto evento completo
    //target: hace referencia al objeto "button"
    const boton:HTMLElement =  evento.target as HTMLElement;

    //obtenemos valor de cedula del atributo del button con nombre data-cedula o para ser mas especifico "cedula"
    let cedula:string | undefined = boton.dataset['cedula'];
    let nombre:string | undefined = boton.dataset['nombre'];
    //mostramos cedula por consola
    console.log(`Cedula: ${cedula} Nombre: ${nombre} `);

  }


}
