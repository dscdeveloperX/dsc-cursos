import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CompartirInformacionService } from 'src/app/Core/Services/compartir-informacion.service';


@Component({
  selector: 'app-f5-hijo-b',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './f5-hijo-b.component.html',
  styleUrls: ['./f5-hijo-b.component.css']
})
export class F5HijoBComponent  {

  //renderiza mensaje en pantalla
  public Mensaje = signal<string>('');



  constructor(private compartirInformacionService:CompartirInformacionService){

    //obtenemos mensaje actalizado
    this.compartirInformacionService.sensorMensaje.subscribe((valor)=>{
        this.Mensaje.set(valor);
    });

  }


  public ModificarMensaje():void{
this.compartirInformacionService.ModificarMensaje("HIJO B: Modifico mensaje")
  }




}
