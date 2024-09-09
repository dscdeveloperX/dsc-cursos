import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ControlContainer, FormControl, FormControlName, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-e4',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e4.component.html',
  styleUrls: ['./e4.component.css']
})
export class E4Component {


  public deshabilitarEnvioFormPersona = signal<boolean>(false);

  public formPersona!:FormGroup;
  public ctrlNombre!:FormControl;
  

  constructor(){

    this.CrearFormPersona();   

  }


  private CrearFormPersona():void{
     //creamos instancias de los controles de formulario
     this.ctrlNombre = new FormControl('', Validators.compose([Validators.required]));
  
     //creamos una nueva instancia de formulario
     this.formPersona = new FormGroup(
       {
         Nombre:this.ctrlNombre,
       }
     );
  }

  
  public EnviarFormPersona():void{

    if(this.formPersona.valid){
      this.deshabilitarEnvioFormPersona.set(true);
      //simular que proceso demora 5 segundos
      setTimeout(
        ()=>{
          console.log(this.formPersona.value);
          this.deshabilitarEnvioFormPersona.set(false);
        },
        5000);
      
    
    }

  }


}
