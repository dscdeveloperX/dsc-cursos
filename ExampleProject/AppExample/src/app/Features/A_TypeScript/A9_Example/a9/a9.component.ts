import { Component, OnDestroy, signal } from '@angular/core';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-a9',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a9.component.html',
  styleUrls: ['./a9.component.css']
})
export class A9Component implements OnDestroy {

  
  public texto = signal<string>('Este texto cambiara');  
  private timeout:any;
  
  
  
  public Comenzar():void{
    //seTimeout: es un metodo que ejecuta una funcion SOLO UNA VEZ e inicia en un tiempo determinado en milisegundo
    
    //le asignamos a la variable "intervalo" el objeto "interval"
    this.timeout = setTimeout(
                            () => { this.texto.set( 'NUEVO TEXTO' ); }, 
                            3000);
  }

  
  
  public Terminar():void{
    
    //eliminamos la variable "timeout" desde el contructor de la clase
    if(this.timeout != null){
      clearTimeout(this.timeout);
    }
    else{
      alert('Porfavor iniciar timeout');
    }
  }
  

  

  ngOnDestroy(): void {
    this.Terminar();
  }





}
