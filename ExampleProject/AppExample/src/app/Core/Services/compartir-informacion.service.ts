import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CompartirInformacionService {

  
  private mensaje = new BehaviorSubject<string>('');

  //creamos una variable "sensorMensaje" de tipo observable string
  //this.mensaje.asObservable(): convertimos "mensaje" en una observable (a la podemos acceder son sucription)
  public sensorMensaje:Observable<string> = this.mensaje.asObservable();


  public ModificarMensaje(texto:string):void{
    //modificamos valor de mensaje
    this.mensaje.next(texto);
  }


}
