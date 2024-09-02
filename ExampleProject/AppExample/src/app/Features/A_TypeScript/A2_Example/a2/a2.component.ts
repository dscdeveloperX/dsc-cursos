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

  public constructor(){

    //tipos basicos
    //------------------------------------------------------------------------------
    let nombre:string = 'darwin';
    let edad:number = 15;
    let sueldo:number= 1200.86;
    let fechaNacimiento:Date = new Date(1977,7,21);
    let habilitar:boolean = true;
    //variable de cualquier tipo, se le puede asignar cualquier tipo de valor
    //------------------------------------------------------------------------------
    let cualquierTipo:any;
    cualquierTipo = 100.25;
    cualquierTipo = 'Darwin'
    cualquierTipo = new Date(1977,7,21);
    cualquierTipo = true;
    //null y undefined: Representan valores vacíos o ausentes. Por defecto, null y undefined son subtipos de todos los demás tipos.
    //------------------------------------------------------------------------------
    let valorNulo:null = null;
    let valorIndefinido:undefined = undefined;
    //Define tipos personalizados usando combinaciones de tipos existentes
    //------------------------------------------------------------------------------
    let cantidad: number | null;
    cantidad = null;
    cantidad = 125.22;

  }

}
