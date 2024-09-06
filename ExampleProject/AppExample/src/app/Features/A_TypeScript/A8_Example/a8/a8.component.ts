import { Component, OnDestroy, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { interval, Subscription } from 'rxjs';

@Component({
  selector: 'app-a8',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a8.component.html',
  styleUrls: ['./a8.component.css']
})

export class A8Component implements OnDestroy {


  //contador que incrementará de 1 en 1
  public contador = signal<number>(0);  
  //en esta variable guardaremos el objeto "interval" para asi poderlo eliminar
  //en la variable "intervalo" debe ser inicializada y si por alguna razon no 
  //la puede inicializar adjuntarle al nombre de la variable el operador "!"
  private intervalo!:Subscription;
  
  
  
  public IniciarIntervalo():void{
    //interval: es un metodo que ejecuta una funcion una y otra vez por un tiempo determinado en milisegundo
    
    //le asignamos a la variable "intervalo" el objeto "interval"
    this.intervalo = interval(1000).subscribe(
                     ()=>{ this.contador.set( this.contador() + 1 ); }
                     );
  }
  
  
  
  public  FinalizarIntervalo():void{
    
    //podetemos borrar el intervalo a partir de la variable "intervalo" que es donde se guardo el objeto "setInterval"
    if(this.intervalo != null){
      this.intervalo.unsubscribe();
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
  