import { Component, OnDestroy, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-a7',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a7.component.html',
  styleUrls: ['./a7.component.css']
})
export class A7Component implements OnDestroy {


//contador que incrementará de 1 en 1
//signal es una funcion que nos permite crear una señal reactiva sobretodo para contadores
public contador = signal<number>(0);  
//en esta variable guardaremos el objeto "setInterval" para asi poderlo eliminar
private intervalo:any=null;



public IniciarIntervalo():void{
  //setInterval: es un metodo que ejecuta una funcion una y otra vez por un tiempo determinado en milisegundo
  //setInterval parametro 1: es la funcion que se ejecuta
  //setInterval parametro 2: indica el tiempo en milisegundo en que se ejecuta la función 

  //le asignamos a la variable "intervalo" el objeto "setInterval"
  if(this.intervalo == null){

    this.intervalo = setInterval(

      ()=>{ this.contador.set( this.contador() + 1 ); },
      1000
);


  }
  
}



public  FinalizarIntervalo():void{
  
  //podetemos borrar el intervalo a partir de la variable "intervalo" que es donde se guardo el objeto "setInterval"
  if(this.intervalo != null){
    clearInterval(this.intervalo);
    this.intervalo = null;
  }
  else{
    alert('Porfavor iniciar intervalo');
  }
  

}



ngOnDestroy(): void {
  //cuando se destruya la clase (cuando se cierra) tambien eliminará el objeto "intervalo"
  this.FinalizarIntervalo();
}




}
