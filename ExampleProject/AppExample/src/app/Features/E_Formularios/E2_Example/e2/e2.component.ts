import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ControlContainer, FormControl, FormControlName, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-e2',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e2.component.html',
  styleUrls: ['./e2.component.css']
})
export class E2Component {


  public formAficionado!:FormGroup;

  public ctrlNombreAficionado!:FormControl;
  public ctrlPatinaje!:FormControl;
  public ctrlTenis!:FormControl;
  public ctrlBoxeo!:FormControl;
  

  constructor(){

   this.CrearFormAficionado();

  }



  private CrearFormAficionado():void{

     //creamos instancias de los controles de formulario
     this.ctrlNombreAficionado = new FormControl('', Validators.compose([Validators.required]));
     this.ctrlPatinaje = new FormControl(false, null);
     this.ctrlTenis = new FormControl(false, null);
     this.ctrlBoxeo = new FormControl(false, null);
 
   
     //creamos una nueva instancia de formulario
     this.formAficionado = new FormGroup(
       {
         NombreAficionado:this.ctrlNombreAficionado,
         Patinaje:this.ctrlPatinaje,
         Tenis: this.ctrlTenis,
         Boxeo: this.ctrlBoxeo
       }
     );
    
  }


  
  public EnviarFormAficionado():void{

    if(this.formAficionado.valid){
      console.log(this.formAficionado.value);
    
    }

  }


}
